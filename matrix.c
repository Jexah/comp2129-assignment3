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

static uint32_t g_seed = 0;

static ssize_t g_soft_width = 0;
static ssize_t g_soft_height = 0;
static ssize_t g_hard_width = 0;
static ssize_t g_hard_height = 0;
static ssize_t g_soft_elements = 0;
static ssize_t g_hard_elements = 0;
static ssize_t g_buffer_width = 0;
static ssize_t g_buffer_height = 0;

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
	g_hard_width = (order & 0b11 ? (order & ~0b11) + 4 : order);
	g_hard_height = g_hard_width;

	g_soft_width = order;
	g_soft_height = order;

	g_hard_elements = g_hard_width * g_hard_height;
	g_soft_elements = g_soft_width * g_soft_height;

	g_buffer_width = g_hard_width - g_soft_width;
	g_buffer_height = g_hard_height - g_soft_height;
}

/**
 * Displays given matrix
 */
void display(register uint32_t *matrix)
{
	register uint32_t rows_remaining = g_soft_height;
	while(rows_remaining--)
	{
		printf("%" PRIu32, *matrix++);
		for (register uint32_t i = g_soft_width - 1; i--;)
		{
			printf(" %" PRIu32, *matrix++);
		}
		matrix += g_buffer_width;
		printf("\n");
	}
}

/**
 * Displays given matrix row
 */
void display_row(register uint32_t *matrix, const ssize_t row)
{
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
void display_column(register uint32_t *matrix, const ssize_t column)
{
	register uint32_t rows_remaining = g_soft_height;
	matrix += column;
	while(rows_remaining--)
	{
		printf("%" PRIu32 "\n", *matrix);
		matrix += g_hard_width;
	}
}

/**
 * Displays the value stored at the given element index
 */
void display_element(const uint32_t *matrix, const ssize_t row, const ssize_t column)
{
	printf("%" PRIu32 "\n", matrix[row * g_hard_width + column]);
}

////////////////////////////////
///   MATRIX INITALISATIONS  ///
////////////////////////////////

/**
 * Returns new matrix with all elements set to zero
 */
inline static uint32_t *new_matrix(void)
{
	return calloc(g_hard_elements, sizeof(uint32_t));
}

/**
 * Returns new matrix without setting elements
 */
inline static uint32_t *new_matrix_malloc(void)
{
	return malloc(g_hard_elements * sizeof(uint32_t));
}

/**
 * Returns new identity matrix
 */
uint32_t *identity_matrix(void)
{
	register uint32_t *matrix = new_matrix();

	register uint32_t gap = g_hard_width + 1;
	register uint32_t i = g_soft_height;

	while(i--)
	{
		*matrix = 1;
		matrix += gap;
	}

	return (matrix - g_soft_height * gap);
}

/**
 * Returns new matrix with elements generated at random using given seed
 */
uint32_t *random_matrix(uint32_t seed)
{
	register uint32_t *matrix = new_matrix_malloc();

	set_seed(seed);

	register uint32_t y_count = g_soft_height;
	register uint32_t x_count;

	while(y_count--)
	{
		x_count = g_soft_width;
		while(x_count--)
		{
			*matrix++ = fast_rand();
		}
		matrix += g_buffer_width;
	}

	return (matrix - g_soft_height * g_hard_width);
}

/**
 * Returns new matrix with all elements set to given value
*/
uint32_t *uniform_matrix(const register uint32_t value)
{
	if(value == 0)
	{
		return new_matrix();
	}

	register uint32_t *matrix = new_matrix_malloc();

	register uint32_t y_count = g_soft_height;
	register uint32_t x_count;

	while(y_count--)
	{
		x_count = g_soft_width;
		while(x_count--)
		{
			*matrix++ = value;
		}
		matrix += g_buffer_width;
	}

	return (matrix - g_soft_height * g_hard_width);
}

/**
 * Returns new matrix with elements in sequence from given start and step
 */
uint32_t *sequence_matrix(register uint32_t start, const register uint32_t step)
{
	if(step == 0)
	{
		return uniform_matrix(start);
	}

	register uint32_t *matrix = new_matrix_malloc();

	register uint32_t y_count = g_soft_height;
	register uint32_t x_count;

	while(y_count--)
	{
		x_count = g_soft_width;
		while(x_count--)
		{
			*matrix++ = start;
			start += step;
		}
		matrix += g_buffer_width;
	}

	return (matrix - g_soft_height * g_hard_width);
}

////////////////////////////////
///     MATRIX OPERATIONS    ///
////////////////////////////////

/**
 * Returns new matrix with elements cloned from given matrix
 */
uint32_t *cloned(const uint32_t *matrix) {

	uint32_t *result = new_matrix_malloc();

	memcpy((void *)result, (void *)matrix, g_hard_elements * sizeof(uint32_t));

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
	register uint32_t y_count = arguments->total;
	register uint32_t x_count;

	while(y_count--)
	{
		x_count = g_soft_width;
		while(x_count--)
		{
			*result++ = *matrix--;
		}
		result += g_buffer_width;
		matrix -= g_buffer_width;
	}

	free(arg);
	return NULL;
}

uint32_t *reversed(register uint32_t *matrix)
{

	if(g_nthreads == 1)
	{
		register uint32_t *result = new_matrix_malloc();
		matrix += g_hard_width * g_soft_height - g_buffer_width;
		register uint32_t y_count = g_soft_height;
		register uint32_t x_count;

		while(y_count--)
		{
			x_count = g_soft_width;
			while(x_count--)
			{
				*result++ = *matrix--;
			}
			result += g_buffer_width;
			matrix -= g_buffer_width;
		}
		return result - g_soft_height * g_hard_width;
	}

	thread_ids = malloc(sizeof(pthread_t) * g_nthreads);
	register uint32_t *result = new_matrix_malloc();
	register uint32_t each = g_soft_height / g_nthreads;
	matrix += g_soft_height * g_hard_width - g_buffer_width;

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

	register uint32_t remaining = g_soft_height % g_nthreads;
	register uint32_t x_count;

	while(remaining--)
	{
		x_count = g_soft_width;
		while(x_count--)
		{
			*result++ = *matrix--;
		}
		result += g_buffer_width;
		matrix -= g_buffer_width;
	}

	for(register uint32_t threads_waiting = g_nthreads; threads_waiting--;) {
		pthread_join(thread_ids[threads_waiting], NULL);
	}

	free(thread_ids);

	return result - g_soft_height * g_hard_width;
}

/**
 * Returns new transposed matrix
 */

struct transpose_worker_struct
{
	uint32_t *matrix;
	uint32_t *result;
	uint32_t num_tiles;
	uint32_t offset;
};
/*
static void *transpose_worker(void *arg)
{
	struct transpose_worker_struct *arguments = (struct transpose_worker_struct *)arg;
	register uint32_t *matrix = arguments->matrix;
	register uint32_t *result = arguments->result;
	register uint32_t width = g_soft_width;
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
}
*/
inline static void transpose_4x4(uint32_t *input, uint32_t *output, uint32_t x_offset, uint32_t y_offset)
{
	// Magic number 4 is the size of the matrix to transpose
	register uint32_t width = g_hard_width;
	register uint32_t width2 = width + width;
	register uint32_t width3 = width + width + width;

	uint32_t input_offset = 4 * x_offset + 4 * width * y_offset;
	uint32_t output_offset = 4 * width * x_offset + 4 * y_offset;

	register uint32_t *input_plus_offset = input + input_offset;
	register uint32_t *input_plus_offset_1 = input_plus_offset + width;
	register uint32_t *input_plus_offset_2 = input_plus_offset + width2;
	register uint32_t *input_plus_offset_3 = input_plus_offset + width3;

	register uint32_t *output_plus_offset = output + output_offset;

	__m128i T0 = _mm_unpacklo_epi32(*((__m128i *)(input_plus_offset  )), *((__m128i *)(input_plus_offset_1)));
	__m128i T1 = _mm_unpacklo_epi32(*((__m128i *)(input_plus_offset_2)), *((__m128i *)(input_plus_offset_3)));
	__m128i T2 = _mm_unpackhi_epi32(*((__m128i *)(input_plus_offset  )), *((__m128i *)(input_plus_offset_1)));
	__m128i T3 = _mm_unpackhi_epi32(*((__m128i *)(input_plus_offset_2)), *((__m128i *)(input_plus_offset_3)));

	*((__m128i *)(output_plus_offset         )) = _mm_unpacklo_epi64(T0, T1);
	*((__m128i *)(output_plus_offset + width )) = _mm_unpackhi_epi64(T0, T1);
	*((__m128i *)(output_plus_offset + width2)) = _mm_unpacklo_epi64(T2, T3);
	*((__m128i *)(output_plus_offset + width3)) = _mm_unpackhi_epi64(T2, T3);
}
uint32_t *transposed(register uint32_t* matrix)
{

	if(g_nthreads == 1 || g_hard_width < 500)
	{
		// Only one thread or size is too small, just do it.
		uint32_t *result = new_matrix_malloc();

		uint32_t tile_width = g_hard_width >> 2;

		for(register uint32_t y = tile_width; y--;)
		{
			for(register uint32_t x = tile_width; x--;)
			{
				transpose_4x4(matrix, result, x, y);
			}
		}

		return result;
	}
	/*
	// Loads of threads, make them do stuff!

	uint32_t *result = new_matrix_malloc();

	thread_ids = malloc(sizeof(pthread_t) * g_nthreads);
	register uint32_t tile_width = g_hard_width >> 2;
	register uint32_t each = tile_width / g_nthreads;

	register uint32_t start = 0;
	for(register uint32_t i = g_nthreads; i--;)
	{
		for(register uint32_t j = tile_width; j--;)
		{

		}
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

	for(register uint32_t threads_waiting = g_nthreads; threads_waiting--;)
	{
		pthread_join(thread_ids[threads_waiting], NULL);
	}

	free(thread_ids);


	return result;
	*/

	return NULL;
}

/**
 * Returns new matrix with scalar added to each element
 */
struct scalar_add_worker_struct
{
	uint32_t *result;
	uint32_t *matrix;
	uint32_t scalar;
	uint32_t total;
};

static void *scalar_add_worker(void *arg)
{
	struct scalar_add_worker_struct *arguments = (struct scalar_add_worker_struct *)arg;
	register uint32_t *matrix = arguments->matrix;
	register uint32_t *result = arguments->result;
	register uint32_t scalar = arguments->scalar;
	register uint32_t count_y = arguments->total;
	register uint32_t count_x;

	while(count_y--)
	{
		count_x = g_soft_width;
		while(count_x--)
		{
			*result++ = *matrix++ + scalar;
		}
		result += g_buffer_width;
		matrix += g_buffer_width;
	}
	free(arg);
	return NULL;
}

uint32_t *scalar_add(register uint32_t *matrix, const register uint32_t scalar)
{

	if(g_nthreads == 1)
	{
		register uint32_t *result = new_matrix_malloc();
		register uint32_t count_y = g_soft_height;
		register uint32_t count_x;

		while(count_y--)
		{
			count_x = g_soft_width;
			while(count_x--)
			{
				*result++ = *matrix++ + scalar;
			}
			result += g_buffer_width;
			matrix += g_buffer_width;
		}
		return result - g_soft_height * g_hard_width;
	}

	thread_ids = malloc(sizeof(pthread_t) * g_nthreads);
	register uint32_t *result = new_matrix_malloc();
	register uint32_t each = g_soft_height / g_nthreads;

	for(register uint32_t i = g_nthreads; i--;)
	{
		struct scalar_add_worker_struct *todo = malloc(sizeof(struct scalar_add_worker_struct));
		todo->matrix = matrix;
		todo->result = result;
		todo->scalar = scalar;
		todo->total = each;
		pthread_create(thread_ids+i, NULL, scalar_add_worker, todo);
		matrix += each;
		result += each;
	}

	register uint32_t remaining = g_soft_height % g_nthreads;
	register uint32_t count_x;
	while(remaining--)
	{
		count_x = g_soft_width;
		while(count_x--)
		{
			*result++ = *matrix++ + scalar;
		}
		result += g_buffer_width;
		matrix += g_buffer_width;
	}

	for(register uint32_t threads_waiting = g_nthreads; threads_waiting--;) {
		pthread_join(thread_ids[threads_waiting], NULL);
	}

	free(thread_ids);

	return result - g_soft_height * g_hard_width;
}

/**
 * Returns new matrix with scalar multiplied to each element
 */
struct scalar_mul_worker_struct
{
	uint32_t *result;
	uint32_t *matrix;
	uint32_t scalar;
	uint32_t total;
};

static void *scalar_mul_worker(void *arg)
{
	struct scalar_mul_worker_struct *arguments = (struct scalar_mul_worker_struct *)arg;
	register uint32_t *matrix = arguments->matrix;
	register uint32_t *result = arguments->result;
	register uint32_t scalar = arguments->scalar;
	register uint32_t count_y = arguments->total;
	register uint32_t count_x;

	while(count_y--)
	{
		count_x = g_soft_width;
		while(count_x--)
		{
			*result++ = *matrix++ * scalar;
		}
		result += g_buffer_width;
		matrix += g_buffer_width;
	}

	free(arg);
	return NULL;
}

uint32_t *scalar_mul(register uint32_t *matrix, const register uint32_t scalar)
{

	if(g_nthreads == 1)
	{
		register uint32_t *result = new_matrix_malloc();
		register uint32_t count_y = g_soft_height;
		register uint32_t count_x;

		while(count_y--)
		{
			count_x = g_soft_width;
			while(count_x--)
			{
				*result++ = *matrix++ * scalar;
			}
			result += g_buffer_width;
			matrix += g_buffer_width;
		}
		return result - g_soft_height * g_hard_width;
	}

	thread_ids = malloc(sizeof(pthread_t) * g_nthreads);
	register uint32_t *result = new_matrix_malloc();
	register uint32_t each = g_soft_height / g_nthreads;

	for(register uint32_t i = g_nthreads; i--;)
	{
		struct scalar_mul_worker_struct *todo = malloc(sizeof(struct scalar_mul_worker_struct));
		todo->matrix = matrix;
		todo->result = result;
		todo->scalar = scalar;
		todo->total = each;
		pthread_create(thread_ids+i, NULL, scalar_mul_worker, todo);
		matrix += each;
		result += each;
	}

	register uint32_t remaining = g_soft_height % g_nthreads;
	register uint32_t count_x;

	while(remaining--)
	{
		count_x = g_soft_width;
		while(count_x--)
		{
			*result++ = *matrix++ * scalar;
		}
		result += g_buffer_width;
		matrix += g_buffer_width;
	}

	for(register uint32_t threads_waiting = g_nthreads; threads_waiting--;) {
		pthread_join(thread_ids[threads_waiting], NULL);
	}

	free(thread_ids);

	return result - g_soft_height * g_hard_width;
}

/**
 * Returns new matrix with elements added at the same index
 */
uint32_t *matrix_add(register const uint32_t *matrix_a, register const uint32_t *matrix_b)
{
	// Matrix has multiple of 16 elements, 420 blazeit
	if(g_nthreads == 1)
	{
		// Only one thread, don't bother creating a new one, just solve.

		// TODO:
		// 	CURRENTLY ONLY SOLVES 4x4 MATRIX, MUST ADAPT FOR MORE
		uint32_t *output = new_matrix_malloc();

		__m128i t1 = _mm_add_epi32(*((__m128i *)matrix_a++), *((__m128i *)matrix_b++));
		__m128i t2 = _mm_add_epi32(*((__m128i *)matrix_a++), *((__m128i *)matrix_b++));
		__m128i t3 = _mm_add_epi32(*((__m128i *)matrix_a++), *((__m128i *)matrix_b++));
		__m128i t4 = _mm_add_epi32(*((__m128i *)matrix_a++), *((__m128i *)matrix_b++));

		*((__m128i *)output++) = t1;
		*((__m128i *)output++) = t2;
		*((__m128i *)output++) = t3;
		*((__m128i *)output++) = t4;

		// Gotta solve the rest of the additions manually

		return output - 4 * sizeof(__m128i);
	}

	//
	return NULL;

}

/**
 * Returns new matrix, multiplying the two matrices together
 */

static inline void multiply_4x4(register uint32_t *input_a, register uint32_t *input_b, register uint32_t offset_x, register uint32_t offset_y, register uint32_t *output)
{
	__m128i row1 = _mm_load_si128((__m128i *)(input_b + offset_x));
	input_b += g_hard_width;
	__m128i row2 = _mm_load_si128((__m128i *)input_b);
	input_b += g_hard_width;
	__m128i row3 = _mm_load_si128((__m128i *)input_b);
	input_b += g_hard_width;
	__m128i row4 = _mm_load_si128((__m128i *)input_b);

	register uint32_t i = 4;
	while(i--)
	{
		__m128i col1 = _mm_set1_epi32(*input_a++);
		__m128i col2 = _mm_set1_epi32(*input_a++);
		__m128i col3 = _mm_set1_epi32(*input_a++);
		__m128i col4 = _mm_set1_epi32(*input_a++);
		__m128i row = _mm_add_epi32(
			_mm_add_epi32(
				_mm_mullo_epi32(col1, row1),
				_mm_mullo_epi32(col2, row2)),
			_mm_add_epi32(
				_mm_mullo_epi32(col3, row3),
				_mm_mullo_epi32(col4, row4)));
		_mm_store_si128((__m128i *)output, row);
		output += 4;
	}
}

uint32_t *matrix_mul(register uint32_t *matrix_a, register uint32_t *matrix_b)
{
	if(g_nthreads == 1)
	{
		// Only one thread, don't bother creating a new one, just solve.

		// TODO:
		// 	CURRENTLY ONLY SOLVES 4x4 MATRIX, MUST ADAPT FOR MORE

		register uint32_t *result = new_matrix_malloc();
		matrix_b = transposed(matrix_b);
		register uint32_t *matrix_b_base = matrix_b;

		register uint32_t count_y = g_soft_height;
		register uint32_t count_x;
		register uint32_t count_z;

		while(count_y--)
		{
			while(count_x--)
			{
				count_z = g_soft_width;
				register uint32_t total = 0;
				matrix_b = matrix_b_base;
				while(count_z--)
				{
					total += *matrix_a * *matrix_b++;
				}
				*result++ = total;
			}
			result += g_buffer_width;
			matrix_a += g_buffer_width;
			matrix_b += g_buffer_width;
		}

		return result - g_soft_height * g_hard_width;
	}

	return NULL;
}

/**
 * Returns new matrix, powering the matrix to the exponent
 */
uint32_t *matrix_pow(uint32_t *matrix, const uint32_t exponent)
{
	if(!exponent)
	{
		return identity_matrix();
	}

	uint32_t *identity = identity_matrix();

	if(memcmp(matrix, identity, g_hard_elements * sizeof(uint32_t)) == 0)
	{
		return identity;
	}

	//if(g_nthreads == 1)
	//{
	uint32_t *cached_results[32] = {0};

	register uint32_t curr_exponent = exponent >> 1;
	register uint32_t curr_loop = 1;
	register uint32_t *previous_result = matrix;

	if(exponent & 1)
	{
		cached_results[0] = matrix;
	}

	while(curr_exponent)
	{
		uint32_t *curr_result = matrix_mul(previous_result, previous_result);
		if(curr_exponent & 1 && curr_exponent & ~1)
		{
			cached_results[curr_loop] = curr_result;
		}
		else if(previous_result != matrix || ~(exponent & 1))
		{
			free(previous_result);
		}
		previous_result = curr_result;
		curr_loop++;
		curr_exponent >>= 1;
	}

	for(register uint32_t i = 32; i--;)
	{
		if(cached_results[i])
		{
			uint32_t *new_result = matrix_mul(previous_result, cached_results[i]);
			free(previous_result);
			previous_result = new_result;
		}
	}

	return previous_result;
	//}

	// If g_nthreads > 1: Do some multithreading stuff, probably divide and conquer
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
