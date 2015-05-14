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
#include <immintrin.h>

#include "matrix.h"

static uint32_t g_seed = 0;

static ssize_t g_width = 0;
static ssize_t g_height = 0;
static ssize_t g_elements = 0;

static ssize_t g_nthreads = 1;

static pthread_t *thread_ids;

////////////////////////////////
///     UTILITY FUNCTIONS    ///
////////////////////////////////

/**
 * Returns pseudorandom number determined by the seed
 */
inline static uint32_t fast_rand(void)
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
	register uint32_t rows_remaining = g_height;
	matrix += column;
	while(rows_remaining--)
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
	return calloc(g_elements, sizeof(uint32_t));
}

/**
 * Returns new matrix without setting elements
 */
inline static uint32_t *new_matrix_malloc(void)
{
	return malloc(g_elements * sizeof(uint32_t));
}

/**
 * Returns new identity matrix
 */
uint32_t *identity_matrix(void)
{
	register uint32_t *matrix= new_matrix();

	register uint32_t gap = g_width + 1;
	register uint32_t i = g_height;

	while(i--)
	{
		*matrix = 1;
		matrix += gap;
	}

	return (matrix - g_elements - gap + 1);
}

/**
 * Returns new matrix with elements generated at random using given seed
 */
uint32_t *random_matrix(uint32_t seed)
{
	register uint32_t *matrix = new_matrix_malloc();

	set_seed(seed);

	register uint32_t i = g_elements >> 2;
	register uint64_t store = 0;

	while(i--)
	{
		store = fast_rand();
		store <<= 32;
		store += fast_rand();
		((int64_t *)matrix)[0] = (store << 32) + (store >> 32);
		store = fast_rand();
		store <<= 32;
		store += fast_rand();
		((int64_t *)matrix)[1] = (store << 32) + (store >> 32);
		matrix += 4;
	}

	i = g_elements & 3;
	while(i--)
	{
		*matrix++ = fast_rand();
	}

	return (matrix - g_elements);
}

/**
 * Returns new matrix with all elements set to given value
*/
uint32_t *uniform_matrix(const register uint32_t value)
{
	if(value == 0)
	{
		return (uint32_t *)new_matrix();
	}
	register uint32_t *matrix= new_matrix_malloc();

	const register int64_t value64 = ((uint64_t)value << 32) + value;

	register uint32_t i = g_elements >> 2;

	while(i--)
	{
		((int64_t *)matrix)[0] = value64;
		((int64_t *)matrix)[1] = value64;
		matrix += 4;
	}

	i = g_elements & 3;
	while(i--)
	{
		*matrix++ = value;
	}

	return (matrix - g_elements);
}

/**
 * Returns new matrix with elements in sequence from given start and step
 */
uint32_t *sequence_matrix(const uint32_t start, const register uint32_t step)
{
	if(step == 0)
	{
		return uniform_matrix(start);
	}

	register uint32_t *matrix = new_matrix_malloc();

	register uint32_t current = start;
	register uint32_t i = g_elements >> 1;
	uint32_t odd = g_elements;

	while(i--)
	{
		*matrix = current;
		matrix[1] = current + step;
		current += step + step;
		matrix += 2;
	}

	if(odd)
	{
		*matrix = current;
		matrix += 1;
	}

	return (matrix - g_elements);
}

////////////////////////////////
///     MATRIX OPERATIONS    ///
////////////////////////////////

/**
 * Returns new matrix with elements cloned from given matrix
 */
uint32_t *cloned(const uint32_t *matrix) {

	uint32_t *result = new_matrix_malloc();

	memcpy((void *)result, (void *)matrix, g_elements * sizeof(uint32_t));

	return result;
}

/**
 * Returns new matrix with elements ordered in reverse
 */

// /*
struct reverse_worker_struct
{
	uint32_t *result;
	uint32_t *matrix;
	uint32_t total;
};
static void *reverse_worker(void *arg)
{
	struct reverse_worker_struct *arguments = (struct reverse_worker_struct *)arg;
	register uint32_t *matrix = arguments->matrix;
	register uint32_t *result = arguments->result;
	register uint32_t total = arguments->total;
	while(total--)
	{
		*result++ = *matrix--;
	}
	free(arg);
	return NULL;
}

uint32_t *reversed(register uint32_t *matrix)
{

	if(g_nthreads == 1)
	{
		register uint32_t *result = new_matrix_malloc();
		register uint32_t i = g_elements;
		matrix += g_elements - 1;
		while(i--)
		{
			*result++ = *matrix--;
		}
		return result - g_elements;
	}

	thread_ids = malloc(sizeof(pthread_t) * g_nthreads);
	register uint32_t *result = new_matrix();
	register uint32_t each = g_elements / g_nthreads;
	matrix += g_elements - 1;

	for(register uint32_t i = g_nthreads; i--;)
	{
		struct reverse_worker_struct *todo = malloc(sizeof(struct reverse_worker_struct));
		todo->matrix = matrix;
		todo->result = result;
		todo->total = each;
		pthread_create(thread_ids+i, NULL, reverse_worker, todo);
		matrix -= each;
		result += each;
	}

	register uint32_t remaining = g_elements % g_nthreads;

	while(remaining--)
	{
		*result++ = *matrix--;
	}

	for(register uint32_t threads_waiting = g_nthreads; threads_waiting--;) {
		pthread_join(thread_ids[threads_waiting], NULL);
	}

	free(thread_ids);

	return result - g_elements;
}

/**
 * Returns new transposed matrix
 */
/*
struct transpose_worker_struct
{
	uint32_t *matrix;
	uint32_t *result;
	uint32_t column_start;
	uint32_t column_count;
};

static void *transpose_worker(void *arg)
{
	struct transpose_worker_struct *arguments = (struct transpose_worker_struct *)arg;
	register uint32_t *matrix = arguments->matrix;
	register uint32_t *result = arguments->result;
	register uint32_t width = g_width;
	register uint32_t start_x = arguments->column_start;
	register uint32_t length_x = arguments->column_count;

	register uint32_t x_width = 0;
	for(register uint32_t x = length_x; x--;)
	{
		register uint32_t actual_x = start_x + x;
		register uint32_t y_width = 0;
		for(register uint32_t y = width; y--;)
		{
			result[y_width + actual_x] = matrix[x_width + y];
			y_width += width;
		}
		x_width += width;
	}
	free(arg);
	return NULL;
}*/

uint32_t *transposed(register uint32_t* matrix)
{
	uint32_t *result = new_matrix_malloc();
	__m128i T0 = _mm_unpacklo_epi32(*((__m128i *)matrix), *((__m128i *)matrix + 1));
	__m128i T1 = _mm_unpacklo_epi32(*((__m128i *)matrix + 2), *((__m128i *)matrix + 3));
	__m128i T2 = _mm_unpackhi_epi32(*((__m128i *)matrix), *((__m128i *)matrix + 1));
	__m128i T3 = _mm_unpackhi_epi32(*((__m128i *)matrix + 2), *((__m128i *)matrix + 3));
	*((__m128i *)result) = _mm_unpacklo_epi64(T0, T1);
	*((__m128i *)result + 1) = _mm_unpackhi_epi64(T0, T1);
	*((__m128i *)result + 2) = _mm_unpacklo_epi64(T2, T3);
	*((__m128i *)result + 3) = _mm_unpackhi_epi64(T2, T3);

	return result;
	/*
	if(g_nthreads == 1)
	{
		uint32_t *result = new_matrix_malloc();

		for (ssize_t y = 0; y < g_height; y++)
		{
			for (ssize_t x = 0; x < g_width; x++)
			{
				result[x * g_width + y] = matrix[y * g_width + x];
			}
		}

		return result;
	}

	register uint32_t width = g_width;
	thread_ids = malloc(sizeof(pthread_t) * g_nthreads);
	uint32_t *result = new_matrix();
	register uint32_t each = width / g_nthreads;

	register uint32_t start = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		struct transpose_worker_struct *todo = malloc(sizeof(struct transpose_worker_struct));
		todo->matrix = matrix;
		todo->result = result;
		todo->column_start = start;
		todo->column_count = each;
		pthread_create(thread_ids+i, NULL, transpose_worker, todo);
		start += each;
	}

	register uint32_t remaining = width % g_nthreads;
	start = width - remaining;

	register uint32_t x_width = 0;
	for(register uint32_t x = remaining; x--;)
	{
		register uint32_t actual_x = start + x;
		register uint32_t y_width = 0;
		for(register uint32_t y = width; y--;)
		{
			result[y_width + actual_x] = matrix[x_width + y];
			y_width += width;
		}
		x_width += width;
	}

	for(register uint32_t threads_waiting = g_nthreads; threads_waiting--;) {
		pthread_join(thread_ids[threads_waiting], NULL);
	}

	free(thread_ids);


	return result;

	*/
}

/**
 * Returns new matrix with scalar added to each element
 */
uint32_t *scalar_add(const uint32_t *matrix, uint32_t scalar)
{

	uint32_t *result = new_matrix();

	/*
        to do

        1 0        2 1
        0 1 + 1 => 1 2

        1 2        5 6
        3 4 + 4 => 7 8
    */

	return result;
}

/**
 * Returns new matrix with scalar multiplied to each element
 */
uint32_t *scalar_mul(const uint32_t *matrix, uint32_t scalar)
{

	uint32_t *result = new_matrix();

	/*
        to do

        1 0        2 0
        0 1 x 2 => 0 2

        1 2        2 4
        3 4 x 2 => 6 8
    */

	return result;
}

/**
 * Returns new matrix with elements added at the same index
 */
uint32_t *matrix_add(const uint32_t *matrix_a, const uint32_t *matrix_b)
{

	uint32_t *result = new_matrix();

	/*
        to do

        1 0   0 1    1 1
        0 1 + 1 0 => 1 1

        1 2   4 4    5 6
        3 4 + 4 4 => 7 8
    */

	return result;
}

/**
 * Returns new matrix, multiplying the two matrices together
 */
uint32_t *matrix_mul(const uint32_t *matrix_a, const uint32_t *matrix_b)
{

	uint32_t *result = new_matrix();

	/*
        to do

        1 2   1 0    1 2
        3 4 x 0 1 => 3 4

        1 2   5 6    19 22
        3 4 x 7 8 => 43 50
    */

	return result;
}

/**
 * Returns new matrix, powering the matrix to the exponent
 */
uint32_t *matrix_pow(const uint32_t *matrix, uint32_t exponent)
{

	uint32_t *result = new_matrix();

	/*
        to do

        1 2        1 0
        3 4 ^ 0 => 0 1

        1 2        199 290
        3 4 ^ 4 => 435 634
    */

	return result;
}

////////////////////////////////
///       COMPUTATIONS       ///
////////////////////////////////

/**
 * Returns the sum of all elements
 */
uint32_t get_sum(const uint32_t *matrix)
{

	/*
        to do

        1 2
        2 1 => 6

        1 1
        1 1 => 4
    */

	return 0;
}

/**
 * Returns the trace of the matrix
 */
uint32_t get_trace(const uint32_t *matrix)
{

	/*
        to do

        1 0
        0 1 => 2

        2 1
        1 2 => 4
    */

	return 0;
}

/**
 * Returns the smallest value in the matrix
 */
uint32_t get_minimum(const uint32_t *matrix)
{

	/*
        to do

        1 2
        3 4 => 1

        4 3
        2 1 => 1
    */

	return 0;
}

/**
 * Returns the largest value in the matrix
 */
uint32_t get_maximum(const uint32_t *matrix)
{

	/*
        to do

        1 2
        3 4 => 4

        4 3
        2 1 => 4
    */

	return 0;
}

/**
 * Returns the frequency of the value in the matrix
 */
uint32_t get_frequency(const uint32_t *matrix, uint32_t value)
{

	/*
        to do

        1 1
        1 1 :: 1 => 4

        1 0
        0 1 :: 2 => 0
    */

	return 0;
}
