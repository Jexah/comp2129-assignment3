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
	g_hard_width = (order & 0b11 ? (order & 0b00) + 4 : order);
	g_hard_height = g_hard_height;

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
	return calloc(g_hard_width, sizeof(uint32_t));
}

/**
 * Returns new matrix without setting elements
 */
inline static uint32_t *new_matrix_malloc(void)
{
	return malloc(g_hard_width * sizeof(uint32_t));
}

/**
 * Returns new identity matrix
 */
uint32_t *identity_matrix(void)
{
	register uint32_t *matrix= new_matrix();

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
/*
inline static void transpose_4x4(uint32_t *input, uint32_t *output, uint32_t x_offset, uint32_t y_offset)
{
	// Magic number 4 is the size of the matrix to transpose
	register uint32_t width = g_width;
	register uint32_t input_offset = 4 * x_offset + 4 * width * y_offset;
	register uint32_t output_offset = 4 * width * x_offset + 4 * y_offset;
	__m128i T0 = _mm_unpacklo_epi32(*((__m128i *)(input             + input_offset)), *((__m128i *)(input + width     + input_offset)));
	__m128i T1 = _mm_unpacklo_epi32(*((__m128i *)(input + width * 2 + input_offset)), *((__m128i *)(input + width * 3 + input_offset)));
	__m128i T2 = _mm_unpackhi_epi32(*((__m128i *)(input             + input_offset)), *((__m128i *)(input + width     + input_offset)));
	__m128i T3 = _mm_unpackhi_epi32(*((__m128i *)(input + width * 2 + input_offset)), *((__m128i *)(input + width * 3 + input_offset)));
	*((__m128i *)(output             + output_offset)) = _mm_unpacklo_epi64(T0, T1);
	*((__m128i *)(output + width     + output_offset)) = _mm_unpackhi_epi64(T0, T1);
	*((__m128i *)(output + width * 2 + output_offset)) = _mm_unpacklo_epi64(T2, T3);
	*((__m128i *)(output + width * 3 + output_offset)) = _mm_unpackhi_epi64(T2, T3);
}
*/
inline static void transpose_4x4_addition(uint32_t *input, uint32_t *output, uint32_t x_offset, uint32_t y_offset)
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
/*
inline static void transpose_4x4_super_simple_offset(uint32_t *input, uint32_t *output, uint32_t x_offset, uint32_t y_offset)
{
	register uint32_t width = g_width;
	register uint32_t width2 = width + width;
	register uint32_t width3 = width + width + width;

	uint32_t input_offset = 4 * x_offset + 4 * width * y_offset;
	uint32_t output_offset = 4 * width * x_offset + 4 * y_offset;

	register uint32_t *input_plus_offset = input + input_offset;
	register uint32_t *input_plus_offset_1 = input_plus_offset + width;
	register uint32_t *input_plus_offset_2 = input_plus_offset + width2;
	register uint32_t *input_plus_offset_3 = input_plus_offset + width3;

	register uint32_t *output_plus_offset = output + output_offset;

	__m128i T0 = _mm_unpacklo_epi32(*((__m128i *)input    ), *((__m128i *)input + 1));
	__m128i T1 = _mm_unpacklo_epi32(*((__m128i *)input + 2), *((__m128i *)input + 3));
	__m128i T2 = _mm_unpackhi_epi32(*((__m128i *)input    ), *((__m128i *)input + 1));
	__m128i T3 = _mm_unpackhi_epi32(*((__m128i *)input + 2), *((__m128i *)input + 3));

	*((__m128i *)output         ) = _mm_unpacklo_epi64(T0, T1);
	*((__m128i *)output + 1 ) = _mm_unpackhi_epi64(T0, T1);
	*((__m128i *)output + 2) = _mm_unpacklo_epi64(T2, T3);
	*((__m128i *)output + 3) = _mm_unpackhi_epi64(T2, T3);
}

inline static void transpose_4x4_super_simple(uint32_t *input, uint32_t *output)
{
	register uint32_t width = g_width;

	__m128i T0 = _mm_unpacklo_epi32(*((__m128i *)(input    )), *((__m128i *)(input + width)));
	__m128i T1 = _mm_unpacklo_epi32(*((__m128i *)(input + 2 * width)), *((__m128i *)(input + 3 * width)));
	__m128i T2 = _mm_unpackhi_epi32(*((__m128i *)(input    )), *((__m128i *)(input + width)));
	__m128i T3 = _mm_unpackhi_epi32(*((__m128i *)(input + 2 * width)), *((__m128i *)(input + 3 * width)));

	*((__m128i *)(output     )) = _mm_unpacklo_epi64(T0, T1);
	*((__m128i *)(output + width)) = _mm_unpackhi_epi64(T0, T1);
	*((__m128i *)(output + width * 2)) = _mm_unpacklo_epi64(T2, T3);
	*((__m128i *)(output + width * 3)) = _mm_unpackhi_epi64(T2, T3);
}
*/
uint32_t *transposed(register uint32_t* matrix)
{
	uint32_t *result = new_matrix_malloc();

	/*width_in_tiles = width_in_elements >> 2;
	total_tiles = width_in_tiles * width_in_tiles;

	for(uint32_t tile_y = width_in_tiles; tile_y--;)
	{
		for(uint32_t tile_x = width_in_tiles; tile_x--;)
		{
			transpose(matrix, result, tile_x, tile_y);
		}
	}*/

	transpose_4x4_addition(matrix, result, 0, 0);


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

		__m128i T0 = _mm_add_epi32(*((__m128i *)matrix_a    ), *((__m128i *)matrix_b    ));
		__m128i T1 = _mm_add_epi32(*((__m128i *)matrix_a + 1), *((__m128i *)matrix_b + 1));
		__m128i T2 = _mm_add_epi32(*((__m128i *)matrix_a + 2), *((__m128i *)matrix_b + 2));
		__m128i T3 = _mm_add_epi32(*((__m128i *)matrix_a + 3), *((__m128i *)matrix_b + 3));

		*((__m128i *)output    ) = T0;
		*((__m128i *)output + 1) = T1;
		*((__m128i *)output + 2) = T2;
		*((__m128i *)output + 3) = T3;

		// Gotta solve the rest of the additions manually

		return output;
	}

	//
	return NULL;

}

/**
 * Returns new matrix, multiplying the two matrices together
 */
uint32_t *matrix_mul(register const uint32_t *matrix_a, register const uint32_t *matrix_b)
{
	if(g_nthreads == 1)
	{
		// Only one thread, don't bother creating a new one, just solve.

		// TODO:
		// 	CURRENTLY ONLY SOLVES 4x4 MATRIX, MUST ADAPT FOR MORE
		uint32_t *output = new_matrix_malloc();

		__m128i *mat_a = (__m128i *)matrix_a;
		__m128i *mat_b = (__m128i *)matrix_b;

		__m128i T0 = _mm_mullo_epi32(*mat_a, *mat_b);
		__m128i T1 = _mm_mullo_epi32(*((__m128i *)matrix_a + 1), *((__m128i *)matrix_b + 1));
		__m128i T2 = _mm_mullo_epi32(*((__m128i *)matrix_a + 2), *((__m128i *)matrix_b + 2));
		__m128i T3 = _mm_mullo_epi32(*((__m128i *)matrix_a + 3), *((__m128i *)matrix_b + 3));

		*((__m128i *)output    ) = T0;
		*((__m128i *)output + 1) = T1;
		*((__m128i *)output + 2) = T2;
		*((__m128i *)output + 3) = T3;

		// Gotta solve the remainder

		return output;
	}
	return NULL;
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
