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
#define MAX_RAND_VALUE 32767
enum
{
	NOP, SEQUENCE, UNIFORM, IDENTITY, RANDOM, SCALAR_MUL_2, SOLVED
};

static ssize_t g_hard_width = 0;
static ssize_t g_soft_width = 0;
static ssize_t g_height = 0;
static ssize_t g_hard_elements = 0;
static ssize_t g_soft_elements = 0;
static ssize_t g_padding = 0;

static matrix_t *pow_rubbish[255];
static uint32_t rubbish_counter = 0;

static ssize_t g_nthreads = 1;

static uint32_t g_seed = 0;

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
/*
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
*/
/*
static inline uint32_t get_seed(register uint32_t n, register uint32_t base_seed)
{
	if(n == 0)
	{
		return base_seed;
	}
	return (int_pow(214013, n) * base_seed) + (2531011 * get_pow_sum(214013, n - 1));
}
*/

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
	g_padding = 4 - (order % 4 == 0 ? 4 : order % 4);
	g_soft_width = order;
	g_hard_width = order + g_padding;
	g_height = order;

	g_soft_elements = g_soft_width * g_height;
	g_hard_elements = g_hard_width * g_height;
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
		for (register uint32_t i = g_soft_width - 1; i--;)
		{
			printf(" %" PRIu32, *matrix++);
		}
		matrix += g_padding;
		printf("\n");
	}
}

/**
 * Displays given matrix row
 */
void display_row(register matrix_t *matrix_obj, const ssize_t row)
{
	register uint32_t *matrix = matrix_obj->data;
	matrix += row * g_hard_width;
	printf("%" PRIu32 " ", *matrix++);
	for (register uint32_t i = g_soft_width - 1; i--;)
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
		matrix += g_hard_width;
	}
}

/**
 * Displays the value stored at the given element index
 */
void display_element(const matrix_t *matrix_obj, const ssize_t row, const ssize_t column)
{
	printf("%" PRIu32 "\n", matrix_obj->data[row * g_hard_width + column]);
}

//static inline  new_occurances


static inline void reset_occurances(register matrix_t *matrix_obj)
{
	matrix_obj->occurances->prev_operation = NOP;
}

/*
static inline void set_occurances(register matrix_t *matrix_obj, register char prev_operation, register uint32_t *data)
{
	memset(matrix_obj->occurances->data, 0, MAX_RAND_VALUE + 1);
	matrix_obj->occurances->data = data;
}
*/

static inline void copy_occurances(register matrix_t *target_obj, register matrix_t *source_obj)
{
	if(target_obj == source_obj) return;
	memcpy(target_obj->occurances->data, source_obj->occurances->data, (MAX_RAND_VALUE + 1) * sizeof(uint32_t));
	target_obj->occurances->prev_operation = source_obj->occurances->prev_operation;
}

static inline void release_matrix_obj(register matrix_t *matrix_obj)
{
	free(matrix_obj->occurances->data);
	free(matrix_obj->occurances);
	free(matrix_obj->data);
	free(matrix_obj);
}

////////////////////////////////
///   MATRIX INITALISATIONS  ///
////////////////////////////////

/**
 * Returns new matrix with all elements set to zero
 */
inline static matrix_t *new_matrix(void)
{
	matrix_t *matrix_obj = calloc(1, sizeof(matrix_t));
	matrix_obj->data = calloc(g_hard_elements, sizeof(uint32_t));
	matrix_obj->occurances = calloc(1, sizeof(occurances_t));
	matrix_obj->occurances->prev_operation = NOP;
	matrix_obj->occurances->data = calloc(MAX_RAND_VALUE + 1, sizeof(uint32_t));
	return matrix_obj;
}

/**
 * Returns new identity matrix
 */

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
	matrix += arguments->start_row * g_hard_width + arguments->start_row;

	for(register uint32_t i = arguments->num_rows; i--;)
	{
		*matrix = 1;
		matrix += g_hard_width + 1;
	}
	return NULL;
}

matrix_t *identity_matrix(void)
{
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

	matrix_obj->occurances->prev_operation = IDENTITY;

	matrix_obj->min = 0;
	matrix_obj->max = 1;
	matrix_obj->sum = g_height;

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
    }

	free(args);

	return matrix_obj;
}
// */

/**
 * Returns new matrix with elements generated at random using given seed
 */
// /* Serial random matrix
matrix_t *random_matrix(register uint32_t seed)
{
	register matrix_t *matrix_obj = new_matrix();
	register uint32_t *matrix_cpy = matrix_obj->data;

	register uint32_t *occurances = matrix_obj->occurances->data;

	g_seed = seed;

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	for(register uint32_t y = g_height; y--;)
	{
		for(register uint32_t x = g_soft_width; x--;)
		{
			*matrix_cpy = fast_rand();
			if(*matrix_cpy < min) min = *matrix_cpy;
			if(*matrix_cpy > max) max = *matrix_cpy;
			sum += *matrix_cpy;
			occurances[*matrix_cpy]++;
			++matrix_cpy;
		}
		matrix_cpy += g_padding;
	}

	matrix_obj->occurances->prev_operation = RANDOM;

	matrix_obj->min = min;
	matrix_obj->max = max;
	matrix_obj->sum = sum;

	return matrix_obj;
}
// */
/*
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
	matrix += arguments->start_row * g_hard_width;

	uint32_t seed = get_seed(arguments->start_row * g_soft_width, arguments->seed);
	register uint32_t *seed_ptr = &seed;

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	for(register uint32_t y = g_height; y--;)
	{
		for(register uint32_t x = g_soft_width; x--;)
		{
			*matrix = fast_rand_seed(seed_ptr);
			if(*matrix < min) min = *matrix;
			if(*matrix > max) max = *matrix;
			sum += *matrix;
			++matrix;
		}
		matrix += g_padding;
	}

	arguments->matrix_obj->min = min;
	arguments->matrix_obj->max = max;
	arguments->matrix_obj->sum = sum;

	return NULL;
}


matrix_t *random_matrix(register uint32_t seed)
{
	//if(g_nthreads == 1 || g_hard_width < 200)
	//{
		return random_matrix_serial(seed);
	//}

	matrix_t *matrix_obj = new_matrix();

	register uint32_t *mins = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *maxes = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *sums = malloc(sizeof(uint32_t) * g_nthreads);
	//register uint32_t *occurances = malloc(sizeof(uint32_t) * g_nthreads);

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

	free(mins);
	free(maxes);
	free(sums);

	free(args);

	return matrix_obj;
}
*/

/**
 * Returns new matrix with all elements set to given value
*/
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
	matrix += arguments->start_row * g_hard_width;

	__m128i fill = _mm_set_epi32(value, value, value, value);

	for(register uint32_t i = arguments->num_rows * g_hard_width / 4; i--;)
	{
		_mm_store_si128((__m128i *)matrix, fill);
		matrix += 4;
	}

	return NULL;
}

matrix_t *uniform_matrix(register uint32_t value)
{
	if(value == 0)
	{
		register matrix_t *matrix_obj = new_matrix();

		matrix_obj->occurances->prev_operation = UNIFORM;

		return matrix_obj;
	}

	matrix_t *matrix_obj = new_matrix();

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


	matrix_obj->occurances->prev_operation = UNIFORM;
	*(matrix_obj->occurances->data) = value;

	matrix_obj->min = value;
	matrix_obj->max = value;
	matrix_obj->sum = value * g_soft_elements;

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
	//register uint32_t curr_value = arguments->start_value + increment * arguments->start_row * g_hard_width;
	matrix += arguments->start_row * g_hard_width;

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	__m128i vmins = _mm_set_epi32(UINT32_MAX, UINT32_MAX, UINT32_MAX, UINT32_MAX);
	__m128i vmaxes = _mm_setzero_si128();
	__m128i vsum = _mm_setzero_si128();

	__m128i vcurr = _mm_set_epi32(
		arguments->start_value + increment * (3 + arguments->start_row * g_soft_width),
		arguments->start_value + increment * (2 + arguments->start_row * g_soft_width),
		arguments->start_value + increment * (1 + arguments->start_row * g_soft_width),
		arguments->start_value + increment * arguments->start_row * g_soft_width
	);
	__m128i vinc = _mm_set_epi32(increment * 4, increment * 4, increment * 4, increment * 4);
	__m128i vpad = _mm_set_epi32(increment * g_padding, increment * g_padding, increment * g_padding, increment * g_padding);

	register uint32_t m_max = g_hard_width / 4;

	for(register uint32_t y = arguments->num_rows; y--;)
	{
		uint32_t ret[4];
		for(register uint32_t x = m_max; x--;)
		{
			_mm_store_si128((__m128i *)matrix, vcurr);
			vmins = _mm_min_epu32(vmins, vcurr);

			_mm_store_si128((__m128i *)ret, vcurr);

			vmaxes = _mm_max_epu32(vmaxes, vcurr);
			vsum = _mm_add_epi32(vsum, vcurr);
			vcurr = _mm_add_epi32(vcurr, vinc);
			matrix += 4;
		}
		vcurr = _mm_sub_epi32(vcurr, vpad);
	}

	__m128i vmin_s = _mm_shuffle_epi32(vmins, _MM_SHUFFLE(0, 0, 3, 2));
	vmins = _mm_min_epu32(vmins, vmin_s);
	vmin_s = _mm_shuffle_epi32(vmins, _MM_SHUFFLE(0, 0, 0, 1));
	vmins = _mm_min_epu32(vmins, vmin_s);
	min = _mm_cvtsi128_si32(vmins);

	__m128i vmax_s = _mm_shuffle_epi32(vmaxes, _MM_SHUFFLE(0, 0, 3, 2));
	vmaxes = _mm_max_epu32(vmaxes, vmax_s);
	vmax_s = _mm_shuffle_epi32(vmaxes, _MM_SHUFFLE(0, 0, 0, 1));
	vmaxes = _mm_max_epu32(vmaxes, vmax_s);
	max = _mm_cvtsi128_si32(vmaxes);

	__m128i vsum_s = _mm_shuffle_epi32(vsum, _MM_SHUFFLE(0, 0, 3, 2));
	vsum = _mm_add_epi32(vsum, vsum_s);
	vsum_s = _mm_shuffle_epi32(vsum, _MM_SHUFFLE(0, 0, 0, 1));
	vsum = _mm_add_epi32(vsum, vsum_s);
	sum = _mm_cvtsi128_si32(vsum);
	/*
	for(register uint32_t y = arguments->num_rows; y--;)
	{
		for(register uint32_t x = g_soft_width; x--;)
		{
			*matrix = curr_value;
			if(*matrix < min) min = *matrix;
			if(*matrix > max) max = *matrix;
			sum += *matrix;
			++matrix;
			curr_value += increment;
		}
		matrix += g_padding;
	}
	*/

	*(arguments->mins + arguments->id) = min;
	*(arguments->maxes + arguments->id) = max;
	*(arguments->sums + arguments->id) = sum;

	return NULL;
}

matrix_t *sequence_matrix(const uint32_t start, const uint32_t step)
{
	if(!step)
	{
		return uniform_matrix(start);
	}

	struct sequence_argument *args = malloc(sizeof(struct sequence_argument) * g_nthreads);
	matrix_t *matrix_obj = new_matrix();

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


	matrix_obj->occurances->prev_operation = SEQUENCE;
	*(matrix_obj->occurances->data) = start;
	*(matrix_obj->occurances->data + 1) = step;

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

	matrix += arguments->start_row * g_hard_width;
	result += arguments->start_row * g_hard_width;

	for(register uint32_t i = arguments->num_rows * g_hard_width / 4; i--;)
	{
		__m128i vput = _mm_load_si128((__m128i *)matrix);
		_mm_store_si128((__m128i *)result, vput);
		matrix += 4;
		result += 4;
	}

	// memcpy is actually slower... wtf?
	//memcpy((void *)(result + arguments->start_row * g_width), (void *)(matrix + arguments->start_row * g_width), arguments->num_rows * g_width * sizeof(uint32_t));



	return NULL;
}

matrix_t *cloned(register matrix_t *matrix_obj) {

	if(matrix_obj->occurances->prev_operation == IDENTITY)
	{
		return identity_matrix();
	}

	register matrix_t *result_obj = new_matrix();

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

	result_obj->min = matrix_obj->min;
	result_obj->max = matrix_obj->max;
	result_obj->sum = matrix_obj->sum;

	copy_occurances(result_obj, matrix_obj);

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
    }

	free(args);

	return result_obj;
}

/**
 * Returns new matrix with elements ordered in reverse
 */

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
	result += arguments->start_row * g_hard_width;
	matrix += g_hard_elements - arguments->start_row * g_hard_width - 1;

	for(register uint32_t y = arguments->num_rows; y--;)
	{
		for(register uint32_t x = g_soft_width; x--;)
		{
			*result++ = *matrix--;
		}
		result += g_padding;
		matrix -= g_padding;
	}

	return NULL;
}

matrix_t *reversed(matrix_t *matrix_obj)
{
	if(matrix_obj->occurances->prev_operation == IDENTITY || matrix_obj->occurances->prev_operation == UNIFORM)
	{
		return cloned(matrix_obj);
	}

	matrix_t *result_obj = new_matrix();

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

	copy_occurances(result_obj, matrix_obj);

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
		for(register uint32_t todo_x = g_soft_width; todo_x--;)
		{
			result[curr_x * g_hard_width + curr_y] = matrix[curr_y * g_hard_width + curr_x];
			++curr_x;
		}
		++curr_y;
	}
	return NULL;
}

matrix_t *transposed(register matrix_t *matrix_obj)
{
	if(matrix_obj->occurances->prev_operation == IDENTITY || matrix_obj->occurances->prev_operation == UNIFORM)
	{
		return cloned(matrix_obj);
	}

	matrix_t *result_obj = new_matrix();
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

	result_obj->min = matrix_obj->min;
	result_obj->max = matrix_obj->max;
	result_obj->sum = matrix_obj->sum;

	copy_occurances(result_obj, matrix_obj);

	for(register uint32_t i = g_nthreads; i--;)
	{
        pthread_join(*(thread_ids + i), NULL);
    }

	free(args);

	return result_obj;
}

/**
 * Returns new matrix with scalar added to each element
 */

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
	uint32_t do_min_max_sum;
};

static inline void *scalar_add_worker(void *arg)
{
	struct scalar_add_argument *arguments = (struct scalar_add_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	register uint32_t *result = arguments->result_obj->data;
	const register uint32_t scalar = arguments->scalar;

	matrix += arguments->start_row * g_hard_width;
	result += arguments->start_row * g_hard_width;

	if(arguments->do_min_max_sum)
	{
		register uint32_t min = UINT32_MAX;
		register uint32_t max = 0;
		register uint32_t sum = 0;

		for(register uint32_t y = arguments->num_rows; y--;)
		{
			for(register uint32_t x = g_soft_width; x--;)
			{
				*result = *matrix++ + scalar;
				if(*result < min) min = *result;
				if(*result > max) max = *result;
				sum += *result;
				++result;
			}
			matrix += g_padding;
			result += g_padding;
		}

		*(arguments->mins + arguments->id) = min;
		*(arguments->maxes + arguments->id) = max;
		*(arguments->sums + arguments->id) = sum;
	}
	else
	{
		for(register uint32_t y = arguments->num_rows; y--;)
		{
			for(register uint32_t x = g_soft_width; x--;)
			{
				*result = *matrix++ + scalar;
				++result;
			}
			matrix += g_padding;
			result += g_padding;
		}
	}

	return NULL;
}

matrix_t *scalar_add(register matrix_t *matrix_obj, const register uint32_t scalar)
{
	if(!scalar)
	{
		return cloned(matrix_obj);
	}

	register matrix_t *result_obj = new_matrix();

	pthread_t thread_ids[g_nthreads];

	register uint32_t do_min_max_sum = 1;

	if(scalar > 0)
	{
		if(matrix_obj->max + scalar > matrix_obj->max && matrix_obj->min + scalar > matrix_obj->min)
		{
			do_min_max_sum = 0;
		}
	}
	else
	{
		if(matrix_obj->max + scalar < matrix_obj->max && matrix_obj->min + scalar < matrix_obj->min)
		{
			do_min_max_sum = 0;
		}
	}

	register uint32_t *mins = NULL;
	register uint32_t *maxes = NULL;
	register uint32_t *sums = NULL;

	if(do_min_max_sum)
	{
		mins = malloc(sizeof(uint32_t) * g_nthreads);
		maxes = malloc(sizeof(uint32_t) * g_nthreads);
		sums = malloc(sizeof(uint32_t) * g_nthreads);
	}

	struct scalar_add_argument *args = malloc(sizeof(struct scalar_add_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct scalar_add_argument)
		{
            .matrix_obj = matrix_obj,
			.result_obj = result_obj,
            .start_row = start_row,
            .num_rows = this_rows,
			.scalar = scalar,
			.mins = mins,
			.maxes = maxes,
			.sums = sums,
			.id = i,
			.do_min_max_sum = do_min_max_sum
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
	reset_occurances(result_obj);

	if(do_min_max_sum)
	{
		for(register uint32_t i = g_nthreads; i--;)
		{
			pthread_join(*(thread_ids + i), NULL);
			sum += *(sums + i);
			if(*(mins + i) < min) min = *(mins + i);
			if(*(maxes + i) > max) max = *(maxes + i);
		}
	}
	else
	{
		min = matrix_obj->min + scalar;
		max = matrix_obj->max + scalar;
		sum = matrix_obj->sum + g_soft_elements * scalar;
		for(register uint32_t i = g_nthreads; i--;)
		{
			pthread_join(*(thread_ids + i), NULL);
		}
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

//// IF YOU GET MMAX FAILURE, REMOVE THE DO_MIN_MAX_SUM CHECKS FROM SCALAR MUL SINCE THEY'RE NOT SAFE!!

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

	matrix += arguments->start_row * g_hard_width;
	result += arguments->start_row * g_hard_width;

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	for(register uint32_t y = arguments->num_rows; y--;)
	{
		for(register uint32_t x = g_soft_width; x--;)
		{
			*result = *matrix++ * scalar;
			if(*result < min) min = *result;
			if(*result > max) max = *result;
			sum += *result;
			++result;
		}
		matrix += g_padding;
		result += g_padding;
	}

	*(arguments->mins + arguments->id) = min;
	*(arguments->maxes + arguments->id) = max;
	*(arguments->sums + arguments->id) = sum;


	return NULL;
}

matrix_t *scalar_mul(register matrix_t *matrix_obj, const register uint32_t scalar)
{
	if(scalar == 0)
	{
		return new_matrix();
	}
	if(scalar == 1)
	{
		return cloned(matrix_obj);
	}

	register matrix_t *result_obj = new_matrix();

	pthread_t thread_ids[g_nthreads];

	register uint32_t *mins = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *maxes = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *sums = malloc(sizeof(uint32_t) * g_nthreads);

	struct scalar_mul_argument *args = malloc(sizeof(struct scalar_mul_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct scalar_mul_argument)
		{
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

	if(!(scalar % 2))
	{
		result_obj->occurances->prev_operation = SCALAR_MUL_2;
	}

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
	uint32_t is_identity;
};

static inline void *matrix_add_worker(void *arg)
{
	struct matrix_add_argument *arguments = (struct matrix_add_argument *)arg;
	register uint32_t *matrix_a = arguments->matrix_a_obj->data;
	register uint32_t *matrix_b = arguments->matrix_b_obj->data;
	register uint32_t *result = arguments->result_obj->data;

	matrix_a += arguments->start_row * g_hard_width;
	matrix_b += arguments->start_row * g_hard_width;
	result += arguments->start_row * g_hard_width;

	if(arguments->is_identity)
	{
		result += arguments->start_row;
		register uint32_t gap = g_hard_width + 1;

		for(register uint32_t i = arguments->num_rows; i--;)
		{
			*result += 1;
			result += gap;
		}

		return NULL;
	}

	// /*

	register uint32_t min;
	register uint32_t max;
	register uint32_t sum;

	__m128i vsum = _mm_setzero_si128();
	__m128i vmins = _mm_set_epi32(UINT32_MAX, UINT32_MAX, UINT32_MAX, UINT32_MAX);
	__m128i vmaxes = _mm_setzero_si128();
	__m128i vsums = _mm_setzero_si128();

	register uint32_t x_max = g_hard_width / 4;

	for(register uint32_t y = arguments->num_rows; y--;)
	{
		for(register uint32_t x = x_max; x--;)
		{
			__m128i vma = _mm_load_si128((__m128i *)matrix_a);
			__m128i vmb = _mm_load_si128((__m128i *)matrix_b);
			__m128i vresult = _mm_add_epi32(vma, vmb);
			_mm_store_si128((__m128i *)result, vresult);

			vmins = _mm_min_epu32(vmins, vresult);
			vmaxes = _mm_max_epu32(vmaxes, vresult);
			vsums = _mm_add_epi32(vsums, vresult);

			matrix_a += 4;
			matrix_b += 4;
			result += 4;
		}
	}
	/*
	movhlps xmm1,xmm0         ; Move top two floats to lower part of xmm1
	maxps   xmm0,xmm1         ; Get maximum of the two sets of floats
	pshufd  xmm1,xmm0,$55     ; Move second float to lower part of xmm1
	maxps   xmm0,xmm1         ; Get minimum of the two remaining floats
	*/
	__m128i vmin_s = _mm_shuffle_epi32(vmins, _MM_SHUFFLE(0, 0, 3, 2));
	vmins = _mm_min_epu32(vmins, vmin_s);
	vmin_s = _mm_shuffle_epi32(vmins, _MM_SHUFFLE(0, 0, 0, 1));
	vmins = _mm_min_epu32(vmins, vmin_s);
	min = _mm_cvtsi128_si32(vmins);

	__m128i vmax_s = _mm_shuffle_epi32(vmaxes, _MM_SHUFFLE(0, 0, 3, 2));
	vmaxes = _mm_max_epu32(vmaxes, vmax_s);
	vmax_s = _mm_shuffle_epi32(vmaxes, _MM_SHUFFLE(0, 0, 0, 1));
	vmaxes = _mm_max_epu32(vmaxes, vmax_s);
	max = _mm_cvtsi128_si32(vmaxes);

	__m128i vsum_s = _mm_shuffle_epi32(vsum, _MM_SHUFFLE(0, 0, 3, 2));
	vsum = _mm_add_epi32(vsum, vsum_s);
	vsum_s = _mm_shuffle_epi32(vsum, _MM_SHUFFLE(0, 0, 0, 1));
	vsum = _mm_add_epi32(vsum, vsum_s);
	sum = _mm_cvtsi128_si32(vsum);

	// */

	/*

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	for(register uint32_t y = arguments->num_rows; y--;)
	{
		for(register uint32_t x = g_soft_width; x--;)
		{
			*result = ((*matrix_a++) + (*matrix_b++));
			if(*result < min) min = *result;
			if(*result > max) max = *result;
			sum += *result;
			++result;
		}
		result += g_padding;
		matrix_a += g_padding;
		matrix_b += g_padding;
	}
	// */

	*(arguments->mins + arguments->id) = min;
	*(arguments->maxes + arguments->id) = max;
	*(arguments->sums + arguments->id) = sum;

	return NULL;
}

matrix_t *matrix_add(matrix_t *matrix_a_obj, matrix_t *matrix_b_obj)
{
	if(matrix_a_obj->occurances->prev_operation == UNIFORM && !*(matrix_a_obj->occurances->data))
	{
		return cloned(matrix_b_obj);
	}

	if(matrix_b_obj->occurances->prev_operation == UNIFORM && !*(matrix_b_obj->occurances->data))
	{
		return cloned(matrix_b_obj);
	}

	register uint32_t is_identity;
	matrix_t *result_obj;
	if(matrix_a_obj->occurances->prev_operation == IDENTITY)
	{
		is_identity = 1;
		result_obj = cloned(matrix_b_obj);
	}
	else if(matrix_a_obj->occurances->prev_operation == IDENTITY)
	{
		is_identity = 1;
		result_obj = cloned(matrix_a_obj);
	}
	else
	{
		is_identity = 0;
		result_obj = new_matrix();
	}

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
			.id = i,
			.is_identity = is_identity
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

	reset_occurances(result_obj);

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

	free(mins);
	free(maxes);
	free(sums);

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

	register uint32_t x_share_num = 0;
	register uint32_t y_share_num = 0;
	//register uint32_t x_diff_same = 0;
	//register uint32_t y_diff_same = 0;

	register uint32_t a = arguments->matrix_a_obj->occurances->prev_operation;
	register uint32_t b = arguments->matrix_b_obj->occurances->prev_operation;

	if(a == UNIFORM || b == UNIFORM)
	{
		if(a == UNIFORM)
		{
			y_share_num = 1;
			if(b == SEQUENCE)
			{
				//x_diff_same = 1;
			}
		}
		else if(b == UNIFORM)
		{
			x_share_num = 1;
			if(a == SEQUENCE)
			{
				//y_diff_same = 1;
			}
		}
	}
	else if(a == SEQUENCE && b == SEQUENCE)
	{
		//y_diff_same = 1;
		//x_diff_same = 1;
	}

	if(x_share_num)
	{
		register uint32_t curr_y = arguments->start_row;
		register uint32_t max_x = g_hard_width / 4;
		for(register uint32_t y = arguments->num_rows; y--;)
		{
			__m128i vx_same = _mm_setzero_si128();
			for(register uint32_t z = max_x; z--;)
			{
				vx_same = _mm_add_epi32(vx_same, _mm_mullo_epi32(*(__m128i *)(matrix_a + z * 4 + curr_y * g_hard_width), *(__m128i *)(matrix_b + z * 4)));
			}
			__m128i vsum_s = _mm_shuffle_epi32(vx_same, _MM_SHUFFLE(0, 0, 3, 2));
			vx_same = _mm_add_epi32(vx_same, vsum_s);
			vsum_s = _mm_shuffle_epi32(vx_same, _MM_SHUFFLE(0, 0, 0, 1));
			vx_same = _mm_add_epi32(vx_same, vsum_s);
			register uint32_t x_same = _mm_cvtsi128_si32(vx_same);
			if(x_same < min) min = x_same;
			if(x_same > max) max = x_same;
			sum += x_same * g_soft_width;

			register uint32_t curr_x = 0;
			for(register uint32_t x = g_soft_width; x--;)
			{
    			result[curr_y * g_hard_width + curr_x] = x_same;
				++curr_x;
			}
			++curr_y;
		}
	}
	else if(y_share_num)
	{
		register uint32_t curr_y = arguments->start_row;
		register uint32_t max_x = g_hard_width / 4;
		uint32_t y_nums[g_soft_width];

		register uint32_t curr_x = 0;
		for(register uint32_t x = g_soft_width; x--;)
		{
			__m128i vtotal = _mm_setzero_si128();
			for(register uint32_t z = max_x; z--;)
			{
				vtotal = _mm_add_epi32(vtotal, _mm_mullo_epi32(*(__m128i *)(matrix_a + z * 4), *(__m128i *)(matrix_b + curr_x * g_hard_width + z * 4)));
			}
			__m128i vsum_s = _mm_shuffle_epi32(vtotal, _MM_SHUFFLE(0, 0, 3, 2));
			vtotal = _mm_add_epi32(vtotal, vsum_s);
			vsum_s = _mm_shuffle_epi32(vtotal, _MM_SHUFFLE(0, 0, 0, 1));
			vtotal = _mm_add_epi32(vtotal, vsum_s);
			register uint32_t total = _mm_cvtsi128_si32(vtotal);
			y_nums[curr_x] = total;
			++curr_x;
		}
		for(register uint32_t y = arguments->num_rows; y--;)
		{
			for(register uint32_t x = g_soft_width; x--;)
			{
				result[curr_y * g_hard_width + curr_x] = y_nums[x];
			}
		}

		for(register uint32_t i = g_height; i--;)
		{
			if(y_nums[i] < min) min = y_nums[i];
			if(y_nums[i] > max) max = y_nums[i];
			sum += y_nums[i] * g_height;
		}
	}
	else
	{
		register uint32_t curr_y = arguments->start_row;
		register uint32_t max_x = g_hard_width / 4;
		for(register uint32_t y = arguments->num_rows; y--;)
		{
			register uint32_t curr_x = 0;
			for(register uint32_t x = g_soft_width; x--;)
			{
				__m128i vtotal = _mm_setzero_si128();
				for(register uint32_t z = max_x; z--;)
				{
					vtotal = _mm_add_epi32(vtotal, _mm_mullo_epi32(*(__m128i *)(matrix_a + z * 4 + curr_y * g_hard_width), *(__m128i *)(matrix_b + curr_x * g_hard_width + z * 4)));
				}
				__m128i vsum_s = _mm_shuffle_epi32(vtotal, _MM_SHUFFLE(0, 0, 3, 2));
				vtotal = _mm_add_epi32(vtotal, vsum_s);
				vsum_s = _mm_shuffle_epi32(vtotal, _MM_SHUFFLE(0, 0, 0, 1));
				vtotal = _mm_add_epi32(vtotal, vsum_s);
				register uint32_t total = _mm_cvtsi128_si32(vtotal);
				if(total < min) min = total;
				if(total > max) max = total;
				sum += total;
				result[curr_y * g_hard_width + curr_x] = total;
				++curr_x;
			}
			++curr_y;
		}
	}

	*(arguments->mins + arguments->id) = min;
	*(arguments->maxes + arguments->id) = max;
	*(arguments->sums + arguments->id) = sum;

	return NULL;
}
// */

// /*
matrix_t *matrix_mul(register matrix_t *matrix_a_obj, register matrix_t *matrix_b_obj)
{
	if(matrix_a_obj->occurances->prev_operation == IDENTITY)
	{
		matrix_t *result_obj = cloned(matrix_b_obj);
		return result_obj;
	}
	if(matrix_a_obj->occurances->prev_operation == IDENTITY)
	{
		matrix_t *result_obj = cloned(matrix_a_obj);
		return result_obj;
	}

	register uint32_t a = matrix_a_obj->occurances->prev_operation;
	register uint32_t b = matrix_b_obj->occurances->prev_operation;

	if(a == UNIFORM && b == UNIFORM)
	{
		register uint32_t total = 0;
		for(register uint32_t i = g_soft_width; i--;)
		{
			total += matrix_a_obj->data[i] * matrix_b_obj->data[i * g_hard_width];
		}
		return uniform_matrix(total);
	}

	matrix_t *result_obj = new_matrix();
	matrix_t *matrix_b_t_obj = transposed(matrix_b_obj);

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

	reset_occurances(result_obj);

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

	free(mins);
	free(maxes);
	free(sums);

	release_matrix_obj(matrix_b_t_obj);
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
			release_matrix_obj(pow_rubbish[i]);
			pow_rubbish[i] = 0;
		}

	}
	rubbish_counter = 0;
}

static inline matrix_t *m_pow(register matrix_t *matrix_obj, register uint32_t exponent)
{
	if(exponent == 1)
	{
		return cloned(matrix_obj);
	}
	else if(matrix_obj->occurances->prev_operation == IDENTITY)
	{
		return cloned(matrix_obj);
	}
	else
	{
		register matrix_t *ret = m_pow(matrix_obj, exponent >> 1);
		if(ret != matrix_obj)
		{
			pow_rubbish_add(ret);
		}
		register matrix_t *passon = matrix_mul(ret, ret);
		pow_rubbish_add(passon);
		if(exponent & 1)
		{
			register matrix_t *passon_odd = matrix_mul(matrix_obj, passon);
			pow_rubbish_add(passon_odd);
			return passon_odd;
		}
		return passon;
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

	if(matrix_obj->occurances->prev_operation == IDENTITY)
	{
		return cloned(matrix_obj);
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
	if(matrix_obj->occurances->prev_operation == IDENTITY) return g_height;
	if(matrix_obj->occurances->prev_operation == UNIFORM) return *(matrix_obj->occurances->data) * g_height;

	register uint32_t total = 0;
	register uint32_t gap = g_hard_width + 1;
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
	matrix += arguments->start_row * g_hard_width;
	uint32_t value = arguments->value;
	register uint32_t count = 0;

	/*
	for(register uint32_t remaining = g_hard_elements;;)
	{
		register uint32_t matrix = memmem(matrix, remaining * sizeof(uint32_t), &value, sizeof(uint32_t));
		if(!matrix)
		{
			break;
		}
		++count;
	}
	// */

	/*
	for(register uint32_t y = arguments->num_rows; y--;)
	{
		for(register uint32_t x = g_hard_width; x--;)
		{
			count += value == *matrix++;
		}
		matrix += g_padding;

	}
	// */

	__m128i vvalue = _mm_set_epi32(value, value, value, value);
	__m128i vsum = _mm_setzero_si128();
	register uint32_t total_4s = g_hard_width / 4 * arguments->num_rows;

	for(register uint32_t i = total_4s; i--;)
	{
		__m128i vcmp = _mm_load_si128((__m128i *)matrix);
		__m128i vres = _mm_cmpeq_epi32(vvalue, vcmp);
		vres = _mm_srli_epi32(vres, 31);
		vsum = _mm_add_epi32(vres, vsum);
		matrix += 4;
	}
	// */
	uint32_t res[4];
	_mm_store_si128((__m128i *)res, vsum);
	count = *(res) + *(res + 1) + *(res + 2) + *(res + 3);
	arguments->result[arguments->id] = count;
	return NULL;
}


uint32_t get_frequency(register matrix_t *matrix_obj, register uint32_t value)
{
	if(value < matrix_obj->min || value > matrix_obj->max)
	{
		return 0;
	}

	if(matrix_obj->occurances)
	{
		switch(matrix_obj->occurances->prev_operation)
		{
			case SCALAR_MUL_2:
				if(value & 1)
				{
					break;
				}
				return 0;
			case UNIFORM:
				if(value == *(matrix_obj->occurances->data))
				{
					return g_soft_elements;
				}
				return 0;
			case SEQUENCE:
				if(*(matrix_obj->occurances->data + 1) == 0)
				{
					return g_soft_elements;
				}
				if((value + *(matrix_obj->occurances->data + 1)) % *(matrix_obj->occurances->data))
				{
					return 0;
				}
				return 1;
			case IDENTITY:
				if(!value)
				{
					return g_height * (g_soft_width - 1);
				}
				if(value == 1)
				{
					return g_height;
				}
				return 0;
			case RANDOM:
				return *(matrix_obj->occurances->data + value);
			case SOLVED:
				for(register uint32_t i = g_soft_elements; i--;)
				{

				}
				break;
		}

	}

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
