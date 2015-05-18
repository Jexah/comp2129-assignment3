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

static ssize_t g_width = 0;
static ssize_t g_height = 0;
static ssize_t g_elements = 0;

static matrix_t *pow_rubbish[255];
static uint32_t rubbish_counter = 0;

static ssize_t g_nthreads = 1;

static uint32_t g_seed = 0;
/*
static inline void new_occurances(void)
{

}
*/
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

static inline uint32_t fast_rand_seed(register uint32_t *seed)
{
    *seed = (214013 * (*seed) + 2531011);
    return (*seed >> 16) & 0x7FFF;
}

static inline uint32_t int_pow(register uint32_t num, register uint32_t pow)
{
	if(pow == 0) return 1;
	return num * int_pow(num, pow - 1);
}

static inline uint32_t get_pow_sum(register uint32_t num, register uint32_t pow)
{
	if(pow == 0)
	{
		return 1;
	}
	return int_pow(num, pow) + get_pow_sum(num, pow - 1);
}

static inline uint32_t get_seed(register uint32_t n, register uint32_t base_seed)
{
	if(n == 0)
	{
		return base_seed;
	}
	return (int_pow(214013, n) * base_seed) + (2531011 * get_pow_sum(214013, n - 1));
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
void display(register matrix_t *matrix_obj)
{
	register uint32_t *matrix = matrix_obj->data;
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
void display_row(register matrix_t *matrix_obj, const ssize_t row)
{
	register uint32_t *matrix = matrix_obj->data;
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
void display_column(register matrix_t *matrix_obj, const ssize_t column)
{
	register uint32_t *matrix = matrix_obj->data;
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
void display_element(const matrix_t *matrix_obj, const ssize_t row, const ssize_t column)
{
	printf("%" PRIu32 "\n", matrix_obj->data[row * g_width + column]);
}

//static inline  new_occurances

////////////////////////////////
///   MATRIX INITALISATIONS  ///
////////////////////////////////

/**
 * Returns new matrix with all elements set to zero
 */
inline static matrix_t *new_matrix(void)
{
	matrix_t *matrix_obj = calloc(1, sizeof(matrix_t));
	matrix_obj->data = calloc(g_elements, sizeof(uint32_t));
	matrix_obj->occurances = calloc(g_elements, sizeof(occurances_t));
	return matrix_obj;
}

/**
 * Returns new matrix without setting elements
 */
inline static matrix_t *new_matrix_malloc(void)
{
	matrix_t *matrix_obj = malloc(sizeof(matrix_t));
	matrix_obj->data = malloc(g_elements * sizeof(uint32_t));
	matrix_obj->occurances = malloc(g_elements * sizeof(occurances_t));
	return matrix_obj;
}

/**
 * Returns new identity matrix
 */

///* Serial identity
static inline matrix_t *identity_matrix_serial(void)
{
	matrix_t *matrix_obj = new_matrix();

	register uint32_t *matrix_cpy = matrix_obj->data;
	for(register uint32_t i = g_height; i--;)
	{
		*matrix_cpy = 1;
		matrix_cpy += g_width + 1;
	}

	matrix_obj->min = 0;
	matrix_obj->max = 1;
	matrix_obj->sum = g_height;

	return matrix_obj;
}
// */

// /* Parallel identity
struct identity_argument
{
	matrix_t *matrix_obj;
	uint32_t start_row;
	uint32_t num_rows;
};

static inline void *identity_worker(void *arg)
{
	struct identity_argument *arguments = (struct identity_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	matrix += arguments->start_row * g_width + arguments->start_row;

	for(register uint32_t i = arguments->num_rows; i--;)
	{
		*matrix = 1;
		matrix += g_width + 1;
	}
	return NULL;
}

matrix_t *identity_matrix(void)
{
	if(g_nthreads == 1 || g_width < 200)
	{
		return identity_matrix_serial();
	}

	matrix_t *matrix_obj = new_matrix();

	pthread_t thread_ids[g_nthreads];

	struct identity_argument *args = malloc(sizeof(struct identity_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct identity_argument)
		{
            .matrix_obj = matrix_obj,
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

	matrix_obj->min = 0;
	matrix_obj->max = 1;
	matrix_obj->sum = g_height;

	free(args);

	return matrix_obj;
}
// */

/**
 * Returns new matrix with elements generated at random using given seed
 */
// /* Serial random matrix
matrix_t *random_matrix_serial(register uint32_t seed)
{
	register matrix_t *matrix_obj = new_matrix_malloc();
	register uint32_t *matrix_cpy = matrix_obj->data;

	g_seed = seed;

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

	matrix_obj->min = min;
	matrix_obj->max = max;
	matrix_obj->sum = sum;

	return matrix_obj;
}
// */

struct random_argument
{
	matrix_t *matrix_obj;
	uint32_t start_row;
	uint32_t num_rows;
	uint32_t seed;
};

static inline void *random_worker(void *arg)
{
	struct random_argument *arguments = (struct random_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	matrix += arguments->start_row * g_width;

	uint32_t seed = get_seed(arguments->start_row * g_width, arguments->seed);
	register uint32_t *seed_ptr = &seed;

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	for(register uint32_t i = arguments->num_rows * g_width; i--;)
	{
		*matrix = fast_rand_seed(seed_ptr);
		if(*matrix < min) min = *matrix;
		if(*matrix > max) max = *matrix;
		sum += *matrix;
		++matrix;
	}

	arguments->matrix_obj->min = min;
	arguments->matrix_obj->max = max;
	arguments->matrix_obj->sum = sum;

	return NULL;
}


matrix_t *random_matrix(register uint32_t seed)
{
	if(g_nthreads == 1 || g_width < 200)
	{
		return random_matrix_serial(seed);
	}

	matrix_t *matrix_obj = new_matrix();

	register uint32_t *mins = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *maxes = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *sums = malloc(sizeof(uint32_t) * g_nthreads);

	pthread_t thread_ids[g_nthreads];

	struct random_argument *args = malloc(sizeof(struct random_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct random_argument)
		{
            .matrix_obj = matrix_obj,
            .start_row = start_row,
            .num_rows = this_rows,
			.seed = seed
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_create(thread_ids + i, NULL, random_worker, args + i);
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

	matrix_obj->min = min;
	matrix_obj->max = max;
	matrix_obj->sum = sum;

	free(args);

	return matrix_obj;
}


/**
 * Returns new matrix with all elements set to given value
*/
// /* Serial uniform implementation
static inline matrix_t *uniform_matrix_serial(register uint32_t value)
{
	if(value == 0)
	{
		return new_matrix();
	}

	matrix_t *matrix_obj = new_matrix_malloc();
	register uint32_t *matrix_cpy = matrix_obj->data;

	for(register uint32_t i = g_elements; i--;)
	{
		*matrix_cpy++ = value;
	}

	matrix_obj->min = value;
	matrix_obj->max = value;
	matrix_obj->sum = value * g_elements;

	return matrix_obj;
}
// */
// /* Parallel uniform implementaion
struct uniform_argument
{
	matrix_t *matrix_obj;
	uint32_t value;
	uint32_t start_row;
	uint32_t num_rows;
};

static inline void *uniform_worker(void *arg)
{
	struct uniform_argument *arguments = (struct uniform_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	register uint32_t value = arguments->value;
	matrix += arguments->start_row * g_width;

	for(register uint32_t i = arguments->num_rows * g_width; i--;)
	{
		*matrix++ = value;
	}

	return NULL;
}

matrix_t *uniform_matrix(register uint32_t value)
{
	if(value == 0)
	{
		return new_matrix();
	}

	if(g_nthreads == 1 || g_width < 200)
	{
		return uniform_matrix_serial(value);
	}

	matrix_t *matrix_obj = new_matrix_malloc();

	pthread_t thread_ids[g_nthreads];

	struct uniform_argument *args = malloc(sizeof(struct uniform_argument) * g_nthreads);

	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct uniform_argument)
		{
            .matrix_obj = matrix_obj,
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

	matrix_obj->min = value;
	matrix_obj->max = value;
	matrix_obj->sum = value * g_elements;

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
    }

	return matrix_obj;
}
// */

/**
 * Returns new matrix with elements in sequence from given start and step
 */
static inline matrix_t *sequence_matrix_serial(const uint32_t start, const register uint32_t step)
{
	matrix_t *matrix_obj = new_matrix_malloc();
	register uint32_t *matrix_cpy = matrix_obj->data;

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

	matrix_obj->min = min;
	matrix_obj->max = max;
	matrix_obj->sum = sum;


	return matrix_obj;
}

struct sequence_argument
{
	matrix_t *matrix_obj;
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
	register uint32_t *matrix = arguments->matrix_obj->data;
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

matrix_t *sequence_matrix(const uint32_t start, const uint32_t step)
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
	matrix_t *matrix_obj = new_matrix_malloc();

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
            .matrix_obj = matrix_obj,
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

	matrix_obj->min = min;
	matrix_obj->max = max;
	matrix_obj->sum = sum;

	free(args);

	return matrix_obj;
}

////////////////////////////////
///     MATRIX OPERATIONS    ///
////////////////////////////////

/**
 * Returns new matrix with elements cloned from given matrix
 */
static inline matrix_t *cloned_serial(register matrix_t *matrix_obj)
{
	register matrix_t *result_obj = new_matrix_malloc();
	memcpy((void *)result_obj->data, (void *)matrix_obj->data, g_elements * sizeof(uint32_t));

	result_obj->min = matrix_obj->min;
	result_obj->max = matrix_obj->max;
	result_obj->sum = matrix_obj->sum;

	return result_obj;
}

struct clone_argument
{
	matrix_t *matrix_obj;
	matrix_t *result_obj;
	uint32_t start_row;
	uint32_t num_rows;
};

static inline void *clone_worker(void *arg)
{
	struct clone_argument *arguments = (struct clone_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	register uint32_t *result = arguments->result_obj->data;

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

matrix_t *cloned(register matrix_t *matrix_obj) {

	if(g_nthreads == 1)
	{
		return cloned_serial(matrix_obj);
	}

	register matrix_t *result_obj = new_matrix_malloc();

	pthread_t thread_ids[g_nthreads];

	struct clone_argument *args = malloc(sizeof(struct clone_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct clone_argument)
		{
            .matrix_obj = matrix_obj,
			.result_obj = result_obj,
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

	result_obj->min = matrix_obj->min;
	result_obj->max = matrix_obj->max;
	result_obj->sum = matrix_obj->sum;

	free(args);

	return result_obj;
}

/**
 * Returns new matrix with elements ordered in reverse
 */

static inline matrix_t *reversed_serial(matrix_t *matrix_obj)
{
	register matrix_t *result_obj = new_matrix_malloc();
	register uint32_t *result = result_obj->data;
	register uint32_t *matrix_cpy = matrix_obj->data;
	matrix_cpy += g_elements - 1;

	for(register uint32_t i = g_elements; i--;)
	{
		*result++ = *matrix_cpy--;
	}

	result_obj->min = matrix_obj->min;
	result_obj->max = matrix_obj->max;
	result_obj->sum = matrix_obj->sum;

	return result_obj;
}

struct reverse_argument
{
	matrix_t *result_obj;
	matrix_t *matrix_obj;
	uint32_t num_rows;
	uint32_t start_row;
};

static inline void *reverse_worker(void *arg)
{
	struct reverse_argument *arguments = (struct reverse_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	register uint32_t *result = arguments->result_obj->data;
	result += arguments->start_row * g_width;
	matrix += g_elements - arguments->start_row * g_width - 1;

	for(register uint32_t i = arguments->num_rows * g_width; i--;)
	{
		*result++ = *matrix--;
	}

	return NULL;
}

matrix_t *reversed(matrix_t *matrix_obj)
{
	if(g_nthreads == 1 || g_width < 200)
	{
		return reversed_serial(matrix_obj);
	}

	matrix_t *result_obj = new_matrix_malloc();

	pthread_t thread_ids[g_nthreads];

	struct reverse_argument *args = malloc(sizeof(struct reverse_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct reverse_argument)
		{
            .matrix_obj = matrix_obj,
			.result_obj = result_obj,
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

	result_obj->min = matrix_obj->min;
	result_obj->max = matrix_obj->max;
	result_obj->sum = matrix_obj->sum;

	free(args);

	return result_obj;
}

/**
 * Returns new transposed matrix
 */

struct transpose_argument
{
	matrix_t *matrix_obj;
	matrix_t *result_obj;
	uint32_t num_rows;
	uint32_t start_row;
};

static inline void *transpose_worker(void *arg)
{
	struct transpose_argument *arguments = (struct transpose_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	register uint32_t *result = arguments->result_obj->data;

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

matrix_t *transposed(register matrix_t *matrix_obj)
{
	register matrix_t *identity_obj = identity_matrix();
	if(memcmp(matrix_obj->data, identity_obj->data, sizeof(uint32_t) * g_elements) == 0)
	{
		return cloned(matrix_obj);
	}

	matrix_t *result_obj = new_matrix_malloc();
	pthread_t thread_ids[g_nthreads];

	struct transpose_argument *args = malloc(sizeof(struct transpose_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct transpose_argument)
		{
            .matrix_obj = matrix_obj,
			.result_obj = result_obj,
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

	result_obj->min = matrix_obj->min;
	result_obj->max = matrix_obj->max;
	result_obj->sum = matrix_obj->sum;

	free(args);

	return result_obj;
}

/**
 * Returns new matrix with scalar added to each element
 */

static inline matrix_t *scalar_add_serial(matrix_t *matrix_obj, register uint32_t scalar)
{
	register matrix_t *result_obj = new_matrix_malloc();
	register uint32_t *result_cpy = result_obj->data;
	register uint32_t *matrix = matrix_obj->data;

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

	result_obj->min = min;
	result_obj->max = max;
	result_obj->sum = sum;

	return result_obj;
}

struct scalar_add_argument
{
	matrix_t *matrix_obj;
	matrix_t *result_obj;
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
	register uint32_t *matrix = arguments->matrix_obj->data;
	register uint32_t *result = arguments->result_obj->data;
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

matrix_t *scalar_add(register matrix_t *matrix_obj, const register uint32_t scalar)
{
	if(g_nthreads == 1 || g_width < 200)
	{
		return scalar_add_serial(matrix_obj, scalar);
	}

	register matrix_t *result_obj = new_matrix_malloc();

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
            .matrix_obj = matrix_obj,
			.result_obj = result_obj,
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

	result_obj->min = min;
	result_obj->max = max;
	result_obj->sum = sum;

	free(args);

	return result_obj;
}

/**
 * Returns new matrix with scalar multiplied to each element
 */
struct scalar_mul_argument
{
	matrix_t *matrix_obj;
	matrix_t *result_obj;
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
	register uint32_t *matrix = arguments->matrix_obj->data;
	register uint32_t *result = arguments->result_obj->data;
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

matrix_t *scalar_mul(register matrix_t *matrix_obj, const register uint32_t scalar)
{
	register matrix_t *result_obj = new_matrix_malloc();

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
            .matrix_obj = matrix_obj,
			.result_obj = result_obj,
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

	result_obj->min = min;
	result_obj->max = max;
	result_obj->sum = sum;

	free(args);

	return result_obj;
}

/**
 * Returns new matrix with elements added at the same index
 */
struct matrix_add_argument
{
	matrix_t *matrix_a_obj;
	matrix_t *matrix_b_obj;
	matrix_t *result_obj;
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
	register uint32_t *matrix_a = arguments->matrix_a_obj->data;
	register uint32_t *matrix_b = arguments->matrix_b_obj->data;
	register uint32_t *result = arguments->result_obj->data;

	matrix_a += arguments->start_row * g_width;
	matrix_b += arguments->start_row * g_width;
	result += arguments->start_row * g_width;

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
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

matrix_t *matrix_add(matrix_t *matrix_a_obj, matrix_t *matrix_b_obj)
{
	matrix_t *result_obj = new_matrix_malloc();

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
            .matrix_a_obj = matrix_a_obj,
            .matrix_b_obj = matrix_b_obj,
			.result_obj = result_obj,
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

	result_obj->min = min;
	result_obj->max = max;
	result_obj->sum = sum;

	free(args);

	return result_obj;
}

/**
 * Returns new matrix, multiplying the two matrices together
 */

struct matrix_mul_argument
{
	matrix_t *matrix_a_obj;
	matrix_t *matrix_b_obj;
	matrix_t *result_obj;
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
	register uint32_t *matrix_a = arguments->matrix_a_obj->data;
	register uint32_t *matrix_b = arguments->matrix_b_obj->data;
	register uint32_t *result = arguments->result_obj->data;

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

// /* Add SSE worker


// */
// /*
matrix_t *matrix_mul(register matrix_t *matrix_a_obj, register matrix_t *matrix_b_obj)
{
	matrix_t *result_obj = new_matrix_malloc();
	matrix_t *matrix_b_t_obj = transposed(matrix_b_obj); // remove for std

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
            .matrix_a_obj = matrix_a_obj,
            .matrix_b_obj = matrix_b_t_obj, // matrix_b
			.result_obj = result_obj,
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

	result_obj->min = min;
	result_obj->max = max;
	result_obj->sum = sum;

	free(args);

	return result_obj;

}
// */

/**
 * Returns new matrix, powering the matrix to the exponent
 */
static inline void pow_rubbish_add(matrix_t *garbage)
{
	pow_rubbish[rubbish_counter++] = garbage;
}

static inline void empty_rubbish(matrix_t *exception)
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
			free(pow_rubbish[i]->data);
			free(pow_rubbish[i]);
			pow_rubbish[i] = 0;
		}

	}
	rubbish_counter = 0;
}

static inline matrix_t *m_pow(register matrix_t *matrix_obj, register uint32_t exponent)
{
	if(exponent == 1)
	{
		return matrix_obj;
	}
	else
	{
		register matrix_t *identity_obj = identity_matrix();
		if(memcmp(matrix_obj->data, identity_obj->data, g_elements * sizeof(uint32_t)) == 0)
		{
			return identity_obj;
		}
		register matrix_t *ret = m_pow(matrix_obj, exponent >> 1);
		if(ret != matrix_obj)
		{
			pow_rubbish_add(ret);
		}
		if((exponent & 1) == 0)
		{
			register matrix_t *passon = matrix_mul(ret, ret);
			pow_rubbish_add(passon);
			return passon;
		}
		else
		{
			register matrix_t *passon_inside = matrix_mul(ret, ret);
			pow_rubbish_add(passon_inside);
			register matrix_t *passon = matrix_mul(matrix_obj, passon_inside);
			pow_rubbish_add(passon);
			return passon;
		}
	}
}



matrix_t *matrix_pow(matrix_t *matrix_obj, const uint32_t exponent)
{
	if(exponent == 1)
	{
		return cloned(matrix_obj);
	}

	if(!exponent)
	{
		return identity_matrix();
	}

	register matrix_t *identity_obj = identity_matrix();
	if(memcmp(matrix_obj->data, identity_obj->data, g_elements * sizeof(uint32_t)) == 0)
	{
		return identity_matrix();
	}


	register matrix_t *ret = m_pow(matrix_obj, exponent);
	empty_rubbish(ret);
	return ret;

}

////////////////////////////////
///       COMPUTATIONS       ///
////////////////////////////////

/**
 * Returns the sum of all elements
 */

uint32_t get_sum(register matrix_t *matrix_obj)
{
	return matrix_obj->sum;
}

/**
 * Returns the trace of the matrix
 */
uint32_t get_trace(register matrix_t *matrix_obj)
{
	register uint32_t total = 0;
	register uint32_t gap = g_width + 1;
	register uint32_t *matrix = matrix_obj->data;

	for(register uint32_t i = g_height; i--;)
	{
		total += *matrix;
		matrix += gap;
	}

	return total;
}

/**
 * Returns the smallest value in the matrix
 */

uint32_t get_minimum(register matrix_t *matrix_obj)
{
	return matrix_obj->min;
}

/**
 * Returns the largest value in the matrix
 */
uint32_t get_maximum(register matrix_t *matrix_obj)
{
	return matrix_obj->max;
}

/**
 * Returns the frequency of the value in the matrix
 */

struct get_cmpe_argument
{
	matrix_t *matrix_obj;
	uint32_t *result;
	uint32_t num_rows;
	uint32_t start_row;
	uint32_t id;
	uint32_t value;
};

static inline void *get_cmpe_worker(void *arg)
{
	struct get_cmpe_argument *arguments = (struct get_cmpe_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
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

uint32_t get_frequency(register matrix_t *matrix_obj, register uint32_t value)
{




	register uint32_t *result = malloc(g_nthreads * sizeof(uint32_t));

	pthread_t thread_ids[g_nthreads];

	struct get_cmpe_argument *args = malloc(sizeof(struct get_cmpe_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct get_cmpe_argument) {
            .matrix_obj = matrix_obj,
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
