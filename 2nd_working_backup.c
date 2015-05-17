#include <math.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <stdbool.h>
#include <pthread.h>
#include <inttypes.h>
#include <string.h>
#include <smmintrin.h>
#include <immintrin.h>

#include "matrix.h"

#define ALLOCATE_ROWS(i) ((g_height / g_nthreads) + !!(g_height % g_nthreads - i > 0))
#define SET_MIN(matrix, value) (*(matrix + g_elements) = value)
#define SET_MAX(matrix, value) (*(matrix + g_elements + 1) = value)
#define SET_SUM(matrix, value) (*(matrix + g_elements + 2) = value)
#define GET_MIN(matrix) (*(matrix + g_elements))
#define GET_MAX(matrix) (*(matrix + g_elements + 1))
#define GET_SUM(matrix) (*(matrix + g_elements + 2))

static uint32_t g_seed = 0;

static ssize_t g_width = 0;
static ssize_t g_height = 0;
static ssize_t g_elements = 0;

static uint32_t *pow_rubbish[255];
static uint32_t rubbish_counter = 0;

static ssize_t g_nthreads = 1;

////////////////////////////////
///     UTILITY FUNCTIONS    ///
////////////////////////////////

/**
 * Returns pseudorandom number determined by the seed
 */
static inline uint32_t fast_rand(void)
{
	g_seed = (214013 * g_seed + 2531011);
	return (g_seed >> 16) & 0x7FFF;
}

/**
 * Sets the seed used when generating pseudorandom numbers
 */
void set_seed(uint32_t seed)
{
	g_seed = seed;
}

/**
 * Sets the number of threads available
 */
void set_nthreads(ssize_t count)
{
	g_nthreads = count;
}

/**
 * Sets the dimensions of the matrix
 */
void set_dimensions(ssize_t order)
{
	g_width = order;
	g_height = order;

	g_elements = g_width * g_height;
}

/**
 * Displays given matrix
 */
void display(register uint32_t *matrix)
{
	register uint32_t rows_remaining = g_height;
	while(rows_remaining--)
	{
		printf("%" PRIu32, *matrix++);
		for (register uint32_t i = g_width - 1; i--;)
		{
			printf(" %" PRIu32, *matrix++);
		}
		printf("\n");
	}
}

/**
 * Displays given matrix row
 */
void display_row(register uint32_t *matrix, const ssize_t row)
{
	matrix += row * g_width;
	printf("%" PRIu32 " ", *matrix++);
	for (register uint32_t i = g_width - 1; i--;)
	{
		printf("%"  PRIu32 " ", *matrix++);
	}
	printf("\n");
}


/**
 * Displays given matrix column
 */
void display_column(register uint32_t *matrix, const ssize_t column)
{
	matrix += column;
	for(register uint32_t rows_remaining = g_height; rows_remaining--;)
	{
		printf("%" PRIu32 "\n", *matrix);
		matrix += g_width;
	}
}

/**
 * Displays the value stored at the given element index
 */
void display_element(const uint32_t *matrix, const ssize_t row, const ssize_t column)
{
	printf("%" PRIu32 "\n", matrix[row * g_width + column]);
}

////////////////////////////////
///   MATRIX INITALISATIONS  ///
////////////////////////////////

/**
 * Returns new matrix with all elements set to zero
 */
inline static uint32_t *new_matrix(void)
{
	return calloc(g_elements + 4, sizeof(uint32_t));
}

/**
 * Returns new matrix without setting elements
 */
inline static uint32_t *new_matrix_malloc(void)
{
	return malloc((g_elements + 4) * sizeof(uint32_t));
}

/**
 * Returns new identity matrix
 */

///* Serial identity
static inline uint32_t *identity_matrix_serial(void)
{
	uint32_t *matrix = new_matrix();

	register uint32_t *matrix_cpy = matrix;
	for(register uint32_t i = g_height; i--;)
	{
		*matrix_cpy = 1;
		matrix_cpy += g_width + 1;
	}

	SET_MIN(matrix, 0);
	SET_MAX(matrix, 1);
	SET_SUM(matrix, g_height);

	return matrix;
}
// */

// /* Parallel identity
struct identity_argument
{
	uint32_t *matrix;
	uint32_t start_row;
	uint32_t num_rows;
};

static inline void *identity_worker(void *arg)
{
	struct identity_argument *arguments = (struct identity_argument *)arg;
	register uint32_t *matrix = arguments->matrix;
	matrix += arguments->start_row * g_width + arguments->start_row;

	for(register uint32_t i = arguments->num_rows; i--;)
	{
		*matrix = 1;
		matrix += g_width + 1;
	}
	return NULL;
}

inline uint32_t *identity_matrix(void)
{
	if(g_nthreads == 1 || g_width < 200)
	{
		return identity_matrix_serial();
	}

	uint32_t *matrix = new_matrix();

	pthread_t thread_ids[g_nthreads];

	struct identity_argument *args = malloc(sizeof(struct identity_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct identity_argument)
		{
            .matrix = matrix,
            .start_row = start_row,
            .num_rows = this_rows
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_create(thread_ids + i, NULL, identity_worker, args + i);
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
    }

	SET_MIN(matrix, 0);
	SET_MAX(matrix, 1);
	SET_SUM(matrix, g_height);

	free(args);

	return matrix;
}
// */

/**
 * Returns new matrix with elements generated at random using given seed
 */

inline uint32_t *random_matrix(const uint32_t seed)
{
	register uint32_t *matrix = new_matrix_malloc();
	register uint32_t *matrix_cpy = matrix;

	set_seed(seed);

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	for(register uint32_t i = g_elements; i--;)
	{
		*matrix_cpy = fast_rand();
		if(*matrix_cpy < min) min = *matrix_cpy;
		if(*matrix_cpy > max) max = *matrix_cpy;
		sum += *matrix_cpy;
		++matrix_cpy;
	}

	SET_MIN(matrix, min);
	SET_MAX(matrix, max);
	SET_SUM(matrix, sum);

	return matrix;
}


/**
 * Returns new matrix with all elements set to given value
*/
// /* Serial uniform implementation
static inline uint32_t *uniform_matrix_serial(register uint32_t value)
{
	if(value == 0)
	{
		return new_matrix();
	}

	// Try memset ======================================================================================================

	uint32_t *matrix = new_matrix_malloc();
	register uint32_t *matrix_cpy = matrix;

	for(register uint32_t i = g_elements; i--;)
	{
		*matrix_cpy++ = value;
	}

	SET_MIN(matrix, value);
	SET_MAX(matrix, value);
	SET_SUM(matrix, value * g_elements);

	return matrix;
}
// */
// /* Parallel uniform implementaion
struct uniform_argument
{
	uint32_t *matrix;
	uint32_t value;
	uint32_t start_row;
	uint32_t num_rows;
};

static inline void *uniform_worker(void *arg)
{
	struct uniform_argument *arguments = (struct uniform_argument *)arg;
	register uint32_t *matrix = arguments->matrix;
	register uint32_t value = arguments->value;
	matrix += arguments->start_row * g_width;

	for(register uint32_t i = arguments->num_rows * g_width; i--;)
	{
		*matrix++ = value;
	}

	return NULL;
}

inline uint32_t *uniform_matrix(register uint32_t value)
{
	if(value == 0)
	{
		return new_matrix();
	}

	// Single thread or threshold
	if(g_nthreads == 1 || g_width < 200)
	{
		return uniform_matrix_serial(value);
	}

	uint32_t *matrix = new_matrix_malloc();

	pthread_t thread_ids[g_nthreads];

	struct uniform_argument *args = malloc(sizeof(struct uniform_argument) * g_nthreads);

	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct uniform_argument)
		{
            .matrix = matrix,
            .start_row = start_row,
            .num_rows = this_rows,
			.value = value
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_create(thread_ids + i, NULL, uniform_worker, args + i);
    }

	SET_MIN(matrix, value);
	SET_MAX(matrix, value);
	SET_SUM(matrix, value * g_elements);

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
    }

	return matrix;
}
// */

/**
 * Returns new matrix with elements in sequence from given start and step
 */
static inline uint32_t *sequence_matrix_serial(const uint32_t start, const register uint32_t step)
{
	uint32_t *matrix = new_matrix_malloc();
	register uint32_t *matrix_cpy = matrix;

	register uint32_t curr_value = start;

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	for(register uint32_t i = g_elements; i--;)
	{
		*matrix_cpy = curr_value;
		if(*matrix_cpy < min) min = *matrix_cpy;
		if(*matrix_cpy > max) max = *matrix_cpy;
		sum += *matrix_cpy;
		++matrix_cpy;
		curr_value += step;
	}

	SET_MIN(matrix, min);
	SET_MAX(matrix, max);
	SET_SUM(matrix, sum);


	return matrix;
}

struct sequence_argument
{
	uint32_t *matrix;
	uint32_t start_value;
	uint32_t increment;
	uint32_t start_row;
	uint32_t num_rows;
	uint32_t *mins;
	uint32_t *maxes;
	uint32_t *sums;
	uint32_t id;
};

static inline void *sequence_worker(void *arg)
{
	struct sequence_argument *arguments = (struct sequence_argument *)arg;
	register uint32_t *matrix = arguments->matrix;
	register uint32_t increment = arguments->increment;
	register uint32_t curr_value = arguments->start_value + increment * arguments->start_row * g_width;
	matrix += arguments->start_row * g_width;

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	for(register uint32_t i = arguments->num_rows * g_width; i--;)
	{
		*matrix = curr_value;
		if(*matrix < min) min = *matrix;
		if(*matrix > max) max = *matrix;
		sum += *matrix;
		++matrix;
		curr_value += increment;
	}

	*(arguments->mins + arguments->id) = min;
	*(arguments->maxes + arguments->id) = max;
	*(arguments->sums + arguments->id) = sum;

	return NULL;
}

inline uint32_t *sequence_matrix(const uint32_t start, const uint32_t step)
{
	if(step == 0)
	{
		if(start == 0)
		{
			return new_matrix();
		}
		return uniform_matrix(start);
	}

	if(g_nthreads == 1 || g_width < 200)
	{
		return sequence_matrix_serial(start, step);
	}

	struct sequence_argument *args = malloc(sizeof(struct sequence_argument) * g_nthreads);
	uint32_t *matrix = new_matrix_malloc();

	register uint32_t *mins = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *maxes = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *sums = malloc(sizeof(uint32_t) * g_nthreads);

	pthread_t thread_ids[g_nthreads];

	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct sequence_argument)
		{
            .matrix = matrix,
            .start_row = start_row,
            .num_rows = this_rows,
			.start_value = start,
			.increment = step,
			.mins = mins,
			.maxes = maxes,
			.sums = sums,
			.id = i
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_create(thread_ids + i, NULL, sequence_worker, args + i);
    }

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
		sum += *(sums + i);
		if(*(mins + i) < min) min = *(mins + i);
		if(*(maxes + i) > max) max = *(maxes + i);
    }

	SET_MIN(matrix, min);
	SET_MAX(matrix, max);
	SET_SUM(matrix, sum);

	free(args);

	return matrix;
}

////////////////////////////////
///     MATRIX OPERATIONS    ///
////////////////////////////////

/**
 * Returns new matrix with elements cloned from given matrix
 */
static inline uint32_t *cloned_serial(register uint32_t *matrix)
{
	register uint32_t *result = new_matrix_malloc();
	memcpy((void *)result, (void *)matrix, g_elements * sizeof(uint32_t));

	SET_MIN(result, GET_MIN(matrix));
	SET_MAX(result, GET_MAX(matrix));
	SET_SUM(result, GET_SUM(matrix));

	return result;
}

struct clone_argument
{
	uint32_t *matrix;
	uint32_t *result;
	uint32_t start_row;
	uint32_t num_rows;
};

static inline void *clone_worker(void *arg)
{
	struct clone_argument *arguments = (struct clone_argument *)arg;
	register uint32_t *matrix = arguments->matrix;
	register uint32_t *result = arguments->result;

	matrix += arguments->start_row * g_width;
	result += arguments->start_row * g_width;

	for(register uint32_t i = arguments->num_rows * g_width; i--;)
	{
		*result++ = *matrix++;
	}

	// memcpy is actually slower... wtf?
	//memcpy((void *)(result + arguments->start_row * g_width), (void *)(matrix + arguments->start_row * g_width), arguments->num_rows * g_width * sizeof(uint32_t));



	return NULL;
}

inline uint32_t *cloned(register uint32_t *matrix) {

	if(g_nthreads == 1)
	{
		return cloned_serial(matrix);
	}

	register uint32_t *result = new_matrix_malloc();

	pthread_t thread_ids[g_nthreads];

	struct clone_argument *args = malloc(sizeof(struct clone_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct clone_argument)
		{
            .matrix = matrix,
			.result = result,
            .start_row = start_row,
            .num_rows = this_rows
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_create(thread_ids + i, NULL, clone_worker, args + i);
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
    }

	SET_MIN(result, GET_MIN(matrix));
	SET_MAX(result, GET_MAX(matrix));
	SET_SUM(result, GET_SUM(matrix));

	free(args);

	return result;
}

/**
 * Returns new matrix with elements ordered in reverse
 */

static inline uint32_t *reversed_serial(uint32_t *matrix)
{
	register uint32_t *matrix_cpy = matrix;
	register uint32_t *result = new_matrix_malloc();
	matrix += g_elements - 1;

	for(register uint32_t i = g_elements; i--;)
	{
		*result++ = *matrix_cpy--;
	}

	SET_MIN(result, GET_MIN(matrix));
	SET_MAX(result, GET_MAX(matrix));
	SET_SUM(result, GET_SUM(matrix));

	return result;
}

struct reverse_argument
{
	uint32_t *result;
	uint32_t *matrix;
	uint32_t num_rows;
	uint32_t start_row;
};

static inline void *reverse_worker(void *arg)
{
	struct reverse_argument *arguments = (struct reverse_argument *)arg;
	register uint32_t *matrix = arguments->matrix;
	register uint32_t *result = arguments->result;
	result += arguments->start_row * g_width;
	matrix += g_elements - arguments->start_row * g_width - 1;

	for(register uint32_t i = arguments->num_rows * g_width; i--;)
	{
		*result++ = *matrix--;
	}

	return NULL;
}

inline uint32_t *reversed(uint32_t *matrix)
{
	if(g_nthreads == 1 || g_width < 200)
	{
		return reversed_serial(matrix);
	}

	uint32_t *result = new_matrix_malloc();

	pthread_t thread_ids[g_nthreads];

	struct reverse_argument *args = malloc(sizeof(struct reverse_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct reverse_argument)
		{
            .matrix = matrix,
			.result = result,
            .start_row = start_row,
            .num_rows = this_rows
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_create(thread_ids + i, NULL, reverse_worker, args + i);
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
    }

	SET_MIN(result, GET_MIN(matrix));
	SET_MAX(result, GET_MAX(matrix));
	SET_SUM(result, GET_SUM(matrix));

	free(args);

	return result;
}

/**
 * Returns new transposed matrix
 */

struct transpose_argument
{
	uint32_t *matrix;
	uint32_t *result;
	uint32_t num_rows;
	uint32_t start_row;
};

static inline void *transpose_worker(void *arg)
{
	struct transpose_argument *arguments = (struct transpose_argument *)arg;
	register uint32_t *matrix = arguments->matrix;
	register uint32_t *result = arguments->result;

	register uint32_t curr_y = arguments->start_row;
	for(register uint32_t num_rows = arguments->num_rows; num_rows--;)
	{
		register uint32_t curr_x = 0;
		for(register uint32_t todo_x = g_width; todo_x--;)
		{
			result[curr_x * g_width + curr_y] = matrix[curr_y * g_width + curr_x];
			++curr_x;
		}
		++curr_y;
	}
	return NULL;
}

inline uint32_t *transposed(register uint32_t* matrix)
{
	register uint32_t *identity = identity_matrix();
	if(memcmp(matrix, identity, sizeof(uint32_t) * g_elements) == 0)
	{
		return cloned(matrix);
	}

	uint32_t *result = new_matrix_malloc();
	pthread_t thread_ids[g_nthreads];

	struct transpose_argument *args = malloc(sizeof(struct transpose_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct transpose_argument)
		{
            .matrix = matrix,
			.result = result,
            .start_row = start_row,
            .num_rows = this_rows
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_create(thread_ids + i, NULL, transpose_worker, args + i);
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
    }

	SET_MIN(result, GET_MIN(matrix));
	SET_MAX(result, GET_MAX(matrix));
	SET_SUM(result, GET_SUM(matrix));

	free(args);

	return result;
}

/**
 * Returns new matrix with scalar added to each element
 */

static inline uint32_t *scalar_add_serial(uint32_t *matrix, register uint32_t scalar)
{
	register uint32_t *result = new_matrix_malloc();
	register uint32_t *result_cpy = result;

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	for(register uint32_t i = g_elements; i--;)
	{
		*result_cpy = *matrix++ + scalar;
		if(*result_cpy < min) min = *result_cpy;
		if(*result_cpy > max) max = *result_cpy;
		sum += *result_cpy;
		++result_cpy;
	}

	SET_MIN(result, min);
	SET_MAX(result, max);
	SET_SUM(result, sum);

	return result;
}

struct scalar_add_argument
{
	uint32_t *matrix;
	uint32_t *result;
	uint32_t *mins;
	uint32_t *maxes;
	uint32_t *sums;
	uint32_t scalar;
	uint32_t num_rows;
	uint32_t start_row;
	uint32_t id;
};

static inline void *scalar_add_worker(void *arg)
{
	struct scalar_add_argument *arguments = (struct scalar_add_argument *)arg;
	register uint32_t *matrix = arguments->matrix;
	register uint32_t *result = arguments->result;
	const register uint32_t scalar = arguments->scalar;

	matrix += arguments->start_row * g_width;
	result += arguments->start_row * g_width;

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	for(register uint32_t i = arguments->num_rows * g_width; i--;)
	{
		*result = *matrix++ + scalar;
		if(*result < min) min = *result;
		if(*result > max) max = *result;
		sum += *result;
		++result;
	}

	*(arguments->mins + arguments->id) = min;
	*(arguments->maxes + arguments->id) = max;
	*(arguments->sums + arguments->id) = sum;

	return NULL;
}

inline uint32_t *scalar_add(register uint32_t *matrix, const register uint32_t scalar)
{
	if(g_nthreads == 1 || g_width < 200)
	{
		return scalar_add_serial(matrix, scalar);
	}

	register uint32_t *result = new_matrix_malloc();

	pthread_t thread_ids[g_nthreads];

	register uint32_t *mins = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *maxes = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *sums = malloc(sizeof(uint32_t) * g_nthreads);

	struct scalar_add_argument *args = malloc(sizeof(struct scalar_add_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct scalar_add_argument) {
            .matrix = matrix,
			.result = result,
            .start_row = start_row,
            .num_rows = this_rows,
			.scalar = scalar,
			.mins = mins,
			.maxes = maxes,
			.sums = sums,
			.id = i
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_create(thread_ids + i, NULL, scalar_add_worker, args + i);
    }

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
		sum += *(sums + i);
		if(*(mins + i) < min) min = *(mins + i);
		if(*(maxes + i) > max) max = *(maxes + i);
    }

	SET_MIN(result, min);
	SET_MAX(result, max);
	SET_SUM(result, sum);

	free(args);

	return result;
}

/**
 * Returns new matrix with scalar multiplied to each element
 */
struct scalar_mul_argument
{
	uint32_t *matrix;
	uint32_t *result;
	uint32_t *mins;
	uint32_t *maxes;
	uint32_t *sums;
	uint32_t scalar;
	uint32_t num_rows;
	uint32_t start_row;
	uint32_t id;
};

static inline void *scalar_mul_worker(void *arg)
{
	struct scalar_mul_argument *arguments = (struct scalar_mul_argument *)arg;
	register uint32_t *matrix = arguments->matrix;
	register uint32_t *result = arguments->result;
	const register uint32_t scalar = arguments->scalar;

	matrix += arguments->start_row * g_width;
	result += arguments->start_row * g_width;

	register uint32_t min = *matrix;
	register uint32_t max = *matrix;
	register uint32_t sum = 0;

	for(register uint32_t i = arguments->num_rows * g_width; i--;)
	{
		*result = *matrix++ * scalar;
		if(*result < min) min = *result;
		if(*result > max) max = *result;
		sum += *result;
		++result;
	}

	*(arguments->mins + arguments->id) = min;
	*(arguments->maxes + arguments->id) = max;
	*(arguments->sums + arguments->id) = sum;

	return NULL;
}

inline uint32_t *scalar_mul(register uint32_t *matrix, const register uint32_t scalar)
{
	register uint32_t *result = new_matrix_malloc();

	pthread_t thread_ids[g_nthreads];

	register uint32_t *mins = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *maxes = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *sums = malloc(sizeof(uint32_t) * g_nthreads);

	struct scalar_mul_argument *args = malloc(sizeof(struct scalar_mul_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct scalar_mul_argument) {
            .matrix = matrix,
			.result = result,
            .start_row = start_row,
            .num_rows = this_rows,
			.scalar = scalar,
			.mins = mins,
			.maxes = maxes,
			.sums = sums,
			.id = i
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_create(thread_ids + i, NULL, scalar_mul_worker, args + i);
    }

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;


	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
		sum += *(sums + i);
		if(*(mins + i) < min) min = *(mins + i);
		if(*(maxes + i) > max) max = *(maxes + i);
    }

	SET_MIN(result, min);
	SET_MAX(result, max);
	SET_SUM(result, sum);

	free(args);

	return result;
}

/**
 * Returns new matrix with elements added at the same index
 */
struct matrix_add_argument
{
	uint32_t *matrix_a;
	uint32_t *matrix_b;
	uint32_t *result;
	uint32_t *mins;
	uint32_t *maxes;
	uint32_t *sums;
	uint32_t num_rows;
	uint32_t start_row;
	uint32_t id;
};

static inline void *matrix_add_worker(void *arg)
{
	struct matrix_add_argument *arguments = (struct matrix_add_argument *)arg;
	register uint32_t *matrix_a = arguments->matrix_a;
	register uint32_t *matrix_b = arguments->matrix_b;
	register uint32_t *result = arguments->result;

	matrix_a += arguments->start_row * g_width;
	matrix_b += arguments->start_row * g_width;
	result += arguments->start_row * g_width;

	register uint32_t min = *matrix_a + *matrix_b;
	register uint32_t max = *matrix_a + *matrix_b;
	register uint32_t sum = 0;

	for(register uint32_t i = arguments->num_rows * g_width; i--;)
	{
		*result = ((*matrix_a++) + (*matrix_b++));
		if(*result < min) min = *result;
		if(*result > max) max = *result;
		sum += *result;
		++result;
	}

	*(arguments->mins + arguments->id) = min;
	*(arguments->maxes + arguments->id) = max;
	*(arguments->sums + arguments->id) = sum;

	return NULL;
}

inline uint32_t *matrix_add(uint32_t *matrix_a, uint32_t *matrix_b)
{
	uint32_t *result = new_matrix_malloc();

	pthread_t thread_ids[g_nthreads];

	register uint32_t *mins = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *maxes = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *sums = malloc(sizeof(uint32_t) * g_nthreads);

	struct matrix_add_argument *args = malloc(sizeof(struct matrix_add_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct matrix_add_argument)
		{
            .matrix_a = matrix_a,
            .matrix_b = matrix_b,
			.result = result,
            .start_row = start_row,
            .num_rows = this_rows,
			.mins = mins,
			.maxes = maxes,
			.sums = sums,
			.id = i
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_create(thread_ids + i, NULL, matrix_add_worker, args + i);
    }

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;


	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
		sum += *(sums + i);
		if(*(mins + i) < min) min = *(mins + i);
		if(*(maxes + i) > max) max = *(maxes + i);
    }

	SET_MIN(result, min);
	SET_MAX(result, max);
	SET_SUM(result, sum);

	free(args);

	return result;
}

/**
 * Returns new matrix, multiplying the two matrices together
 */

struct matrix_mul_argument
{
	uint32_t *matrix_a;
	uint32_t *matrix_b;
	uint32_t *result;
	uint32_t *mins;
	uint32_t *maxes;
	uint32_t *sums;
	uint32_t num_rows;
	uint32_t start_row;
	uint32_t id;
};

// /* Regular worker
static inline void *matrix_mul_worker(void *arg)
{
	struct matrix_mul_argument *arguments = (struct matrix_mul_argument *)arg;
	register uint32_t *matrix_a = arguments->matrix_a;
	register uint32_t *matrix_b = arguments->matrix_b;
	register uint32_t *result = arguments->result;

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	// /* Transposed implementation

	register uint32_t curr_y = arguments->start_row;
	for(register uint32_t y = arguments->num_rows; y--;)
	{
		register uint32_t curr_x = 0;
		for(register uint32_t x = g_width; x--;)
		{
			register uint32_t total = 0;
			for(register uint32_t z = g_width; z--;)
			{
				total += matrix_a[z + curr_y * g_width] * matrix_b[curr_x * g_width + z];
			}
			if(total < min) min = total;
			if(total > max) max = total;
			sum += total;
			result[curr_y * g_width + curr_x] = total;
			++curr_x;
		}
		++curr_y;
	}

	*(arguments->mins + arguments->id) = min;
	*(arguments->maxes + arguments->id) = max;
	*(arguments->sums + arguments->id) = sum;

	// */

	/* Regular implementation
	register uint32_t curr_y = arguments->start_row;
	for(register uint32_t y = arguments->num_rows; y--;)
	{
		register uint32_t curr_x = 0;
		for(register uint32_t x = g_width; x--;)
		{
			register uint32_t total = 0;
			for(register uint32_t z = g_width; z--;)
			{
				total += matrix_a[z + curr_y * g_width] * matrix_b[curr_x + g_width * z];
			}
			result[curr_y * g_width + curr_x] = total;
			++curr_x;
		}
		++curr_y;
	}
	*/

	return NULL;
}
// */

// /* SSE worker


// */
// /*
inline uint32_t *matrix_mul(register uint32_t *matrix_a, register uint32_t *matrix_b)
{
	uint32_t *result = new_matrix_malloc();
	uint32_t *matrix_b_t = transposed(matrix_b); // remove for std

	register uint32_t *mins = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *maxes = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *sums = malloc(sizeof(uint32_t) * g_nthreads);

	pthread_t thread_ids[g_nthreads];

	struct matrix_mul_argument *args = malloc(sizeof(struct matrix_mul_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct matrix_mul_argument) {
            .matrix_a = matrix_a,
            .matrix_b = matrix_b_t, // matrix_b
			.result = result,
            .start_row = start_row,
            .num_rows = this_rows,
            .mins = mins,
            .maxes = maxes,
            .sums = sums,
			.id = i
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_create(thread_ids + i, NULL, matrix_mul_worker, args + i);
    }

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;


	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
		sum += *(sums + i);
		if(*(mins + i) < min) min = *(mins + i);
		if(*(maxes + i) > max) max = *(maxes + i);
    }

	SET_MIN(result, min);
	SET_MAX(result, max);
	SET_SUM(result, sum);

	free(args);

	return result;

}
// */

/**
 * Returns new matrix, powering the matrix to the exponent
 */
void pow_rubbish_add(uint32_t *garbage)
{
	pow_rubbish[rubbish_counter++] = garbage;
}

void empty_rubbish(uint32_t *exception)
{
	for(uint32_t i = rubbish_counter; i--;)
	{
		if(pow_rubbish[i] && pow_rubbish[i] != exception)
		{
			for(uint32_t j = rubbish_counter; j--;)
			{
				if(pow_rubbish[i] == pow_rubbish[j] && i != j)
				{
					pow_rubbish[j] = 0;
				}
			}
			free(pow_rubbish[i]);
			pow_rubbish[i] = 0;
		}

	}
	rubbish_counter = 0;
}

uint32_t *m_pow(register uint32_t *matrix, register uint32_t exponent)
{
	if(exponent == 1)
	{
		return matrix;
	}
	else
	{
		register uint32_t *identity = identity_matrix();
		if(memcmp(matrix, identity, g_elements * sizeof(uint32_t)) == 0)
		{
			return identity;
		}
		register uint32_t *ret = m_pow(matrix, exponent >> 1);
		if(ret != matrix)
		{
			pow_rubbish_add(ret);
		}
		if((exponent & 1) == 0)
		{
			register uint32_t *passon = matrix_mul(ret, ret);
			pow_rubbish_add(passon);
			return passon;
		}
		else
		{
			register uint32_t *passon_inside = matrix_mul(ret, ret);
			pow_rubbish_add(passon_inside);
			register uint32_t *passon = matrix_mul(matrix, passon_inside);
			pow_rubbish_add(passon);
			return passon;
		}
	}
}



uint32_t *matrix_pow(uint32_t *matrix, const uint32_t exponent)
{
	if(exponent == 1)
	{
		return cloned(matrix);
	}

	if(!exponent)
	{
		return identity_matrix();
	}

	register uint32_t *identity = identity_matrix();
	if(memcmp(matrix, identity, g_elements * sizeof(uint32_t)) == 0)
	{
		return identity_matrix();
	}


	register uint32_t *ret = m_pow(matrix, exponent);
	empty_rubbish(ret);
	return ret;

}

////////////////////////////////
///       COMPUTATIONS       ///
////////////////////////////////

/**
 * Returns the sum of all elements
 */
struct get_sum_argument
{
	uint32_t *matrix;
	uint32_t *result;
	uint32_t num_rows;
	uint32_t start_row;
	uint32_t id;
};
/*
static inline void *get_sum_worker(void *arg)
{
	struct get_sum_argument *arguments = (struct get_sum_argument *)arg;
	register uint32_t *matrix = arguments->matrix;
	matrix += arguments->start_row * g_width;

	register uint32_t total = 0;
	for(register uint32_t i = arguments->num_rows * g_width; i--;)
	{
		total += *matrix++;
	}
	arguments->result[arguments->id] = total;

	return NULL;
}
*/
inline uint32_t get_sum(register uint32_t *matrix)
{
	return GET_SUM(matrix);
	/*
	register uint32_t *result = malloc(g_nthreads * sizeof(uint32_t));

	pthread_t thread_ids[g_nthreads];

	struct get_sum_argument *args = malloc(sizeof(struct get_sum_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct get_sum_argument) {
            .matrix = matrix,
			.result = result,
            .start_row = start_row,
            .num_rows = this_rows,
			.id = i
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_create(thread_ids + i, NULL, get_sum_worker, args + i);
    }

	register uint32_t total = 0;

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
		total += *(result + i);
    }

	free(args);
	free(result);

	return total;
	*/

}

/**
 * Returns the trace of the matrix
 */
inline uint32_t get_trace(register uint32_t *matrix)
{
	register uint32_t total = 0;
	register uint32_t gap = g_width + 1;
	register uint32_t i = g_height;

	while(i--)
	{
		total += *matrix;
		matrix += gap;
	}

	return total;
}

/**
 * Returns the smallest value in the matrix
 */
struct get_min_argument
{
	uint32_t *matrix;
	uint32_t *result;
	uint32_t num_rows;
	uint32_t start_row;
	uint32_t id;
};
/*
static inline void *get_min_worker(void *arg)
{
	struct get_min_argument *arguments = (struct get_min_argument *)arg;
	register uint32_t *matrix = arguments->matrix;
	matrix += arguments->start_row * g_width;
	register uint32_t min = *matrix;
	for(register uint32_t i = arguments->num_rows * g_width; i--;)
	{
		min = *matrix < min ? *matrix : min;
		++matrix;
	}
	arguments->result[arguments->id] = min;
	return NULL;
}
*/
inline uint32_t get_minimum(register uint32_t *matrix)
{
	return GET_MIN(matrix);
	/*
	register uint32_t *result = malloc(g_nthreads * sizeof(uint32_t));

	pthread_t thread_ids[g_nthreads];

	struct get_min_argument *args = malloc(sizeof(struct get_min_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct get_min_argument) {
            .matrix = matrix,
			.result = result,
            .start_row = start_row,
            .num_rows = this_rows,
			.id = i
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_create(thread_ids + i, NULL, get_min_worker, args + i);
    }

	register uint32_t min = *matrix;

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
		min = *(result + i) < min ? *(result + i) : min;
    }

	free(result);

	return min;
	*/
}

/**
 * Returns the largest value in the matrix
 */

struct get_max_argument
{
	uint32_t *matrix;
	uint32_t *result;
	uint32_t num_rows;
	uint32_t start_row;
	uint32_t id;
};
/*
static inline void *get_max_worker(void *arg)
{
	struct get_max_argument *arguments = (struct get_max_argument *)arg;
	register uint32_t *matrix = arguments->matrix;
	matrix += arguments->start_row * g_width;
	register uint32_t max = *matrix;
	for(register uint32_t i = arguments->num_rows * g_width; i--;)
	{
		max = *matrix > max ? *matrix : max;
		++matrix;
	}
	arguments->result[arguments->id] = max;
	return NULL;
}
*/
inline uint32_t get_maximum(register uint32_t *matrix)
{
	return GET_MAX(matrix);
	/*
	register uint32_t *result = malloc(g_nthreads * sizeof(uint32_t));

	pthread_t thread_ids[g_nthreads];

	struct get_max_argument *args = malloc(sizeof(struct get_max_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct get_max_argument) {
            .matrix = matrix,
			.result = result,
            .start_row = start_row,
            .num_rows = this_rows,
			.id = i
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_create(thread_ids + i, NULL, get_max_worker, args + i);
    }

	register uint32_t max = *matrix;

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
		max = *(result + i) > max ? *(result + i) : max;
    }

	free(result);

	return max;
	*/
}

/**
 * Returns the frequency of the value in the matrix
 */


struct get_cmpe_argument
{
	uint32_t *matrix;
	uint32_t *result;
	uint32_t num_rows;
	uint32_t start_row;
	uint32_t id;
	uint32_t value;
};

static inline void *get_cmpe_worker(void *arg)
{
	struct get_cmpe_argument *arguments = (struct get_cmpe_argument *)arg;
	register uint32_t *matrix = arguments->matrix;
	matrix += arguments->start_row * g_width;
	register uint32_t value = arguments->value;
	register uint32_t count = 0;
	for(register uint32_t i = arguments->num_rows * g_width; i--;)
	{
		count += value == *matrix++;
	}
	arguments->result[arguments->id] = count;
	return NULL;
}

inline uint32_t get_frequency(register uint32_t *matrix, register uint32_t value)
{
	register uint32_t *result = malloc(g_nthreads * sizeof(uint32_t));

	pthread_t thread_ids[g_nthreads];

	struct get_cmpe_argument *args = malloc(sizeof(struct get_cmpe_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct get_cmpe_argument) {
            .matrix = matrix,
			.result = result,
            .start_row = start_row,
            .num_rows = this_rows,
			.id = i,
			.value = value
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_create(thread_ids + i, NULL, get_cmpe_worker, args + i);
    }

	register uint32_t count = 0;

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
		count += *(result + i);
    }

	free(result);

	return count;
}
