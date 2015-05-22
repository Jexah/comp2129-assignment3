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
#define ALLOCATE_ROWS_OF_TILES(i) (((g_hard_width / 4) / g_nthreads) + !!((g_hard_width / 4) % g_nthreads - i > 0))
#define MAX_RAND_VALUE 32767
enum
{
	NOP, SEQUENCE, UNIFORM, IDENTITY, RANDOM, SCALAR_MUL_2, SOLVED, RANDOM_STATS
};

enum
{
	MINIMUM, MAXIMUM, SUM, FREQUENCY
};

static ssize_t g_hard_width = 0;
static ssize_t g_soft_width = 0;
static ssize_t g_height = 0;
static ssize_t g_hard_elements = 0;
static ssize_t g_soft_elements = 0;
static ssize_t g_padding = 0;

static ssize_t g_nthreads = 1;

void set_nthreads(ssize_t count){
	g_nthreads = count;
}

void set_dimensions(ssize_t order){
	g_padding = 4 - (order % 4 == 0 ? 4 : order % 4);
	g_soft_width = order;
	g_hard_width = order + g_padding;
	g_height = order;

	g_soft_elements = g_soft_width * g_height;
	g_hard_elements = g_hard_width * g_height;
}

void display(register matrix_t *matrix_obj){
	register uint32_t *matrix = matrix_obj->data;
	register uint32_t rows_remaining = g_height;
	while(rows_remaining--){
		printf("%" PRIu32, *matrix++);
		for (register uint32_t i = g_soft_width - 1; i--;){
			printf(" %" PRIu32, *matrix++);
		}
		matrix += g_padding;
		printf("\n");
	}
}

void display_row(register matrix_t *matrix_obj, const ssize_t row){
	register uint32_t *matrix = matrix_obj->data;
	matrix += row * g_hard_width;
	printf("%" PRIu32 " ", *matrix++);
	for (register uint32_t i = g_soft_width - 1; i--;){
		printf("%"  PRIu32 " ", *matrix++);
	}
	printf("\n");
}

void display_column(register matrix_t *matrix_obj, const ssize_t column){
	register uint32_t *matrix = matrix_obj->data;
	matrix += column;
	for(register uint32_t rows_remaining = g_height; rows_remaining--;){
		printf("%" PRIu32 "\n", *matrix);
		matrix += g_hard_width;
	}
}

void display_element(const matrix_t *matrix_obj, const ssize_t row, const ssize_t column){
	printf("%" PRIu32 "\n", matrix_obj->data[row * g_hard_width + column]);
}

static inline void reset_properties(register matrix_t *matrix_obj){
	matrix_obj->properties->prev_operation->type = NOP;

	if(matrix_obj->min) free(matrix_obj->min);
	if(matrix_obj->max) free(matrix_obj->max);
	if(matrix_obj->sum) free(matrix_obj->sum);

	matrix_obj->min = NULL;
	matrix_obj->max = NULL;
	matrix_obj->sum = NULL;
}

static inline void copy_properties(register matrix_t *target_obj, register matrix_t *source_obj){
	if(target_obj == source_obj) return;
	target_obj->properties->prev_operation->type = source_obj->properties->prev_operation->type;
	target_obj->properties->prev_operation->options[0] = source_obj->properties->prev_operation->options[0];
	target_obj->properties->prev_operation->options[1] = source_obj->properties->prev_operation->options[1];

	if(source_obj->min){
		target_obj->min = calloc(1, sizeof(uint32_t));
		target_obj->min->result = source_obj->min->result;
	}

	if(source_obj->max){
		target_obj->max = calloc(1, sizeof(uint32_t));
		target_obj->max->result = source_obj->max->result;
	}

	if(source_obj->sum){
		target_obj->sum = calloc(1, sizeof(uint32_t));
		target_obj->sum->result = source_obj->sum->result;
	}
}

inline static matrix_t *new_matrix(void){
	matrix_t *matrix_obj;
	matrix_obj = calloc(1, sizeof(matrix_t));
	matrix_obj->data = calloc(1, g_hard_width * g_hard_width * sizeof(uint32_t));
	matrix_obj->properties = calloc(1, sizeof(properties_t));
	matrix_obj->properties->prev_operation = calloc(1, sizeof(prev_operation_t));
	return matrix_obj;
}

struct identity_argument
{
	matrix_t *matrix_obj;
	uint32_t start_row;
	uint32_t num_rows;
};

static inline void *identity_worker(void *arg){
	struct identity_argument *arguments = (struct identity_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	matrix += arguments->start_row * g_hard_width + arguments->start_row;

	for(register uint32_t i = arguments->num_rows; i--;){
		*matrix = 1;
		matrix += g_hard_width + 1;
	}
	return NULL;
}

matrix_t *identity_matrix(void){
	matrix_t *matrix_obj = new_matrix();

	pthread_t thread_ids[g_nthreads];

	struct identity_argument *args = malloc(sizeof(struct identity_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;){
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct identity_argument){
            .matrix_obj = matrix_obj,
            .start_row = start_row,
            .num_rows = this_rows
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;){
        pthread_create(thread_ids + i, NULL, identity_worker, args + i);
    }

	matrix_obj->properties->prev_operation->type = IDENTITY;

	matrix_obj->min = malloc(sizeof(uint32_t));
	matrix_obj->min->result = 0;

	matrix_obj->max = malloc(sizeof(uint32_t));
	matrix_obj->max->result = 1;

	matrix_obj->sum = malloc(sizeof(uint32_t));
	matrix_obj->sum->result = g_height;

	for(register uint32_t i = g_nthreads; i--;){
        pthread_join(*(thread_ids + i), NULL);
    }

	free(args);

	return matrix_obj;
}

matrix_t *random_matrix(register uint32_t seed){

	register matrix_t *matrix_obj = new_matrix();
	register uint32_t *matrix_cpy = matrix_obj->data;


	for(register uint32_t y = g_height; y--;){
		for(register uint32_t x = g_soft_width; x--;){
			seed *= 214013;
			seed += 2531011;
			*matrix_cpy = seed;
			*matrix_cpy >>= 16;
			*matrix_cpy &= 0x7FFF;
			++matrix_cpy;
		}
		matrix_cpy += g_padding;
	}

	reset_properties(matrix_obj);

	matrix_obj->properties->prev_operation->type = RANDOM;

	return matrix_obj;
}

struct uniform_argument
{
	matrix_t *matrix_obj;
	uint32_t value;
	uint32_t start_row;
	uint32_t num_rows;
};

static inline void *uniform_worker(void *arg){
	struct uniform_argument *arguments = (struct uniform_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	register uint32_t value = arguments->value;
	matrix += arguments->start_row * g_hard_width;

	__m128i fill = _mm_set_epi32(value, value, value, value);

	for(register uint32_t i = arguments->num_rows * g_hard_width / 4; i--;){
		_mm_store_si128((__m128i *)matrix, fill);
		matrix += 4;
	}

	return NULL;
}

matrix_t *uniform_matrix(register uint32_t value){
	if(value == 0){
		register matrix_t *matrix_obj = new_matrix();
		matrix_obj->properties->prev_operation->type = UNIFORM;
		matrix_obj->properties->prev_operation->options[0] = value;

		matrix_obj->min = malloc(sizeof(uint32_t));
		matrix_obj->min->result = 0;

		matrix_obj->max = malloc(sizeof(uint32_t));
		matrix_obj->max->result = 0;

		matrix_obj->sum = malloc(sizeof(uint32_t));
		matrix_obj->sum->result = 0;
		return matrix_obj;
	}

	matrix_t *matrix_obj = new_matrix();

	pthread_t thread_ids[g_nthreads];

	struct uniform_argument *args = malloc(sizeof(struct uniform_argument) * g_nthreads);

	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;){
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct uniform_argument){
            .matrix_obj = matrix_obj,
            .start_row = start_row,
            .num_rows = this_rows,
			.value = value
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;){
        pthread_create(thread_ids + i, NULL, uniform_worker, args + i);
    }

	reset_properties(matrix_obj);

	matrix_obj->properties->prev_operation->type = UNIFORM;
	matrix_obj->properties->prev_operation->options[0] = value;

	matrix_obj->min = malloc(sizeof(uint32_t));
	matrix_obj->min->result = value;

	matrix_obj->max = malloc(sizeof(uint32_t));
	matrix_obj->max->result = value;

	matrix_obj->sum = malloc(sizeof(uint32_t));
	matrix_obj->sum->result = value * g_soft_elements;

	for(register uint32_t i = g_nthreads; i--;){
        pthread_join(*(thread_ids + i), NULL);
    }

	return matrix_obj;
}

struct sequence_argument
{
	matrix_t *matrix_obj;
	uint32_t start_value;
	uint32_t increment;
	uint32_t start_row;
	uint32_t num_rows;
	uint32_t id;
};

static inline void *sequence_worker(void *arg){
	struct sequence_argument *arguments = (struct sequence_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	register uint32_t increment = arguments->increment;
	matrix += arguments->start_row * g_hard_width;

	__m128i vcurr = _mm_set_epi32(
		arguments->start_value + increment * (3 + arguments->start_row * g_soft_width),
		arguments->start_value + increment * (2 + arguments->start_row * g_soft_width),
		arguments->start_value + increment * (1 + arguments->start_row * g_soft_width),
		arguments->start_value + increment * arguments->start_row * g_soft_width
	);
	__m128i vinc = _mm_set_epi32(increment * 4, increment * 4, increment * 4, increment * 4);
	__m128i vpad = _mm_set_epi32(increment * g_padding, increment * g_padding, increment * g_padding, increment * g_padding);

	register uint32_t m_max = g_hard_width / 4;

	for(register uint32_t y = arguments->num_rows; y--;){
		uint32_t ret[4];
		for(register uint32_t x = m_max; x--;){
			_mm_store_si128((__m128i *)matrix, vcurr);
			_mm_store_si128((__m128i *)ret, vcurr);
			vcurr = _mm_add_epi32(vcurr, vinc);
			matrix += 4;
		}
		vcurr = _mm_sub_epi32(vcurr, vpad);
	}

	return NULL;
}

matrix_t *sequence_matrix(uint32_t start, uint32_t step){
	if(!step){
		return uniform_matrix(start);
	}

	struct sequence_argument *args = malloc(sizeof(struct sequence_argument) * g_nthreads);
	matrix_t *matrix_obj = new_matrix();

	pthread_t thread_ids[g_nthreads];

	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;){
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct sequence_argument){
            .matrix_obj = matrix_obj,
            .start_row = start_row,
            .num_rows = this_rows,
			.start_value = start,
			.increment = step,
			.id = i
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;){
        pthread_create(thread_ids + i, NULL, sequence_worker, args + i);
    }

	matrix_obj->properties->prev_operation->type = SEQUENCE;
	matrix_obj->properties->prev_operation->options[0] = start;
	matrix_obj->properties->prev_operation->options[1] = step;

	for(register uint32_t i = g_nthreads; i--;){
        pthread_join(*(thread_ids + i), NULL);
    }

	free(args);

	return matrix_obj;
}

struct clone_argument
{
	matrix_t *matrix_obj;
	matrix_t *result_obj;
	uint32_t start_row;
	uint32_t num_rows;
};

static inline void *clone_worker(void *arg){
	struct clone_argument *arguments = (struct clone_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	register uint32_t *result = arguments->result_obj->data;

	matrix += arguments->start_row * g_hard_width;
	result += arguments->start_row * g_hard_width;

	for(register uint32_t i = arguments->num_rows * g_hard_width / 4; i--;){
		__m128i vput = _mm_load_si128((__m128i *)matrix);
		_mm_store_si128((__m128i *)result, vput);
		matrix += 4;
		result += 4;
	}

	return NULL;
}

matrix_t *cloned(register matrix_t *matrix_obj){

	if(matrix_obj->properties->prev_operation->type == IDENTITY){
		return identity_matrix();
	}

	matrix_t *result_obj = new_matrix();

	pthread_t thread_ids[g_nthreads];

	struct clone_argument *args = malloc(sizeof(struct clone_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;){
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct clone_argument){
            .matrix_obj = matrix_obj,
			.result_obj = result_obj,
            .start_row = start_row,
            .num_rows = this_rows
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;){
        pthread_create(thread_ids + i, NULL, clone_worker, args + i);
    }

	reset_properties(result_obj);

	copy_properties(result_obj, matrix_obj);

	for(register uint32_t i = g_nthreads; i--;){
        pthread_join(*(thread_ids + i), NULL);
    }

	free(args);

	return result_obj;
}

struct reverse_argument
{
	matrix_t *result_obj;
	matrix_t *matrix_obj;
	uint32_t num_rows;
	uint32_t start_row;
};

static inline void *reverse_worker(void *arg){
	struct reverse_argument *arguments = (struct reverse_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	register uint32_t *result = arguments->result_obj->data;
	result += arguments->start_row * g_hard_width;
	matrix += g_hard_elements - arguments->start_row * g_hard_width - 1;


	for(register uint32_t y = arguments->num_rows; y--;){
		for(register uint32_t x = g_soft_width; x--;){
			*result++ = *matrix--;
		}
		result += g_padding;
		matrix -= g_padding;
	}

	return NULL;
}

matrix_t *reversed(matrix_t *matrix_obj){
	if(matrix_obj->properties->prev_operation->type == IDENTITY || matrix_obj->properties->prev_operation->type == UNIFORM){
		return cloned(matrix_obj);
	}

	matrix_t *result_obj = new_matrix();

	pthread_t thread_ids[g_nthreads];

	struct reverse_argument *args = malloc(sizeof(struct reverse_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;){
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct reverse_argument){
            .matrix_obj = matrix_obj,
			.result_obj = result_obj,
            .start_row = start_row,
            .num_rows = this_rows
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;){
        pthread_create(thread_ids + i, NULL, reverse_worker, args + i);
    }

	reset_properties(result_obj);

	copy_properties(result_obj, matrix_obj);

	for(register uint32_t i = g_nthreads; i--;){
        pthread_join(*(thread_ids + i), NULL);
    }

	free(args);

	return result_obj;
}

struct transpose_argument
{
	matrix_t *matrix_obj;
	matrix_t *result_obj;
	uint32_t num_rows;
	uint32_t start_row;
};

static inline void *transpose_worker(void *arg){
	struct transpose_argument *arguments = (struct transpose_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	register uint32_t *result = arguments->result_obj->data;
	register uint32_t tile_width = g_hard_width / 4;

	register uint32_t curr_y = arguments->start_row;
	for(register uint32_t y = arguments->num_rows; y--;){
		register uint32_t curr_x = 0;
		for(register uint32_t x = tile_width; x--;){
			__m128i row1 = _mm_load_si128((__m128i *)matrix + curr_x + curr_y * 4 * tile_width + tile_width * 0);
			__m128i row2 = _mm_load_si128((__m128i *)matrix + curr_x + curr_y * 4 * tile_width + tile_width * 1);
			__m128i row3 = _mm_load_si128((__m128i *)matrix + curr_x + curr_y * 4 * tile_width + tile_width * 2);
			__m128i row4 = _mm_load_si128((__m128i *)matrix + curr_x + curr_y * 4 * tile_width + tile_width * 3);

			__m128i t1 = _mm_unpacklo_epi32(row1, row2);
			__m128i t2 = _mm_unpacklo_epi32(row3, row4);
			__m128i t3 = _mm_unpackhi_epi32(row1, row2);
			__m128i t4 = _mm_unpackhi_epi32(row3, row4);

			row1 = _mm_unpacklo_epi64(t1, t2);
			row2 = _mm_unpackhi_epi64(t1, t2);
			row3 = _mm_unpacklo_epi64(t3, t4);
			row4 = _mm_unpackhi_epi64(t3, t4);

			_mm_store_si128((__m128i *)result + curr_x * g_hard_width + curr_y + tile_width * 0, row1);
			_mm_store_si128((__m128i *)result + curr_x * g_hard_width + curr_y + tile_width * 1, row2);
			_mm_store_si128((__m128i *)result + curr_x * g_hard_width + curr_y + tile_width * 2, row3);
			_mm_store_si128((__m128i *)result + curr_x * g_hard_width + curr_y + tile_width * 3, row4);

			++curr_x;
		}
		++curr_y;
	}
	return NULL;
}

matrix_t *transposed(register matrix_t *matrix_obj){
	if(matrix_obj->properties->prev_operation->type == IDENTITY || matrix_obj->properties->prev_operation->type == UNIFORM){
		return cloned(matrix_obj);
	}

	matrix_t *result_obj = new_matrix();
	pthread_t thread_ids[g_nthreads];

	struct transpose_argument *args = malloc(sizeof(struct transpose_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;){
		register uint32_t this_rows = ALLOCATE_ROWS_OF_TILES(i);
        args[i] = (struct transpose_argument){
            .matrix_obj = matrix_obj,
			.result_obj = result_obj,
            .start_row = start_row,
            .num_rows = this_rows
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;){
        pthread_create(thread_ids + i, NULL, transpose_worker, args + i);
    }

	reset_properties(result_obj);

	copy_properties(result_obj, matrix_obj);

	for(register uint32_t i = g_nthreads; i--;){
        pthread_join(*(thread_ids + i), NULL);
    }

	free(args);

	return result_obj;
}

struct scalar_add_argument
{
	matrix_t *matrix_obj;
	matrix_t *result_obj;
	uint32_t scalar;
	uint32_t num_rows;
	uint32_t start_row;
	uint32_t id;
};

static inline void *scalar_add_worker(void *arg){
	struct scalar_add_argument *arguments = (struct scalar_add_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	register uint32_t *result = arguments->result_obj->data;
	const register uint32_t scalar = arguments->scalar;

	matrix += arguments->start_row * g_hard_width;
	result += arguments->start_row * g_hard_width;

	for(register uint32_t y = arguments->num_rows; y--;){
		for(register uint32_t x = g_soft_width; x--;){
			*result = *matrix++ + scalar;
			++result;
		}
		matrix += g_padding;
		result += g_padding;
	}

	return NULL;
}

matrix_t *scalar_add(register matrix_t *matrix_obj, const register uint32_t scalar){
	if(!scalar){
		return cloned(matrix_obj);
	}

	register matrix_t *result_obj = new_matrix();

	pthread_t thread_ids[g_nthreads];

	struct scalar_add_argument *args = malloc(sizeof(struct scalar_add_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;){
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct scalar_add_argument){
            .matrix_obj = matrix_obj,
			.result_obj = result_obj,
            .start_row = start_row,
            .num_rows = this_rows,
			.scalar = scalar,
			.id = i
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;){
        pthread_create(thread_ids + i, NULL, scalar_add_worker, args + i);
    }

	reset_properties(result_obj);

	for(register uint32_t i = g_nthreads; i--;){
		pthread_join(*(thread_ids + i), NULL);
	}

	free(args);

	return result_obj;
}

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

static inline void *scalar_mul_worker(void *arg){
	struct scalar_mul_argument *arguments = (struct scalar_mul_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	register uint32_t *result = arguments->result_obj->data;
	const register uint32_t scalar = arguments->scalar;

	matrix += arguments->start_row * g_hard_width;
	result += arguments->start_row * g_hard_width;

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	for(register uint32_t y = arguments->num_rows; y--;){
		for(register uint32_t x = g_soft_width; x--;){
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

matrix_t *scalar_mul(register matrix_t *matrix_obj, const register uint32_t scalar){
	if(scalar == 0){
		return new_matrix();
	}
	if(scalar == 1){
		return cloned(matrix_obj);
	}
	if(scalar == 2){
		return matrix_add(matrix_obj, matrix_obj);
	}


	register matrix_t *result_obj = new_matrix();

	pthread_t thread_ids[g_nthreads];

	register uint32_t *mins = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *maxes = malloc(sizeof(uint32_t) * g_nthreads);
	register uint32_t *sums = malloc(sizeof(uint32_t) * g_nthreads);

	struct scalar_mul_argument *args = malloc(sizeof(struct scalar_mul_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;){
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct scalar_mul_argument){
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

	for(register uint32_t i = g_nthreads; i--;){
        pthread_create(thread_ids + i, NULL, scalar_mul_worker, args + i);
    }

	reset_properties(result_obj);

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	if(!(scalar % 2)){
		result_obj->properties->prev_operation->type = SCALAR_MUL_2;
	}

	for(register uint32_t i = g_nthreads; i--;){
		pthread_join(*(thread_ids + i), NULL);
		sum += *(sums + i);
		if(*(mins + i) < min) min = *(mins + i);
		if(*(maxes + i) > max) max = *(maxes + i);
	}

	result_obj->min = malloc(sizeof(uint32_t));
	result_obj->min->result = min;

	result_obj->max = malloc(sizeof(uint32_t));
	result_obj->max->result = max;

	result_obj->sum = malloc(sizeof(uint32_t));
	result_obj->sum->result = sum;

	free(args);

	return result_obj;
}

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

static inline void *matrix_add_worker(void *arg){
	struct matrix_add_argument *arguments = (struct matrix_add_argument *)arg;
	register uint32_t *matrix_a = arguments->matrix_a_obj->data;
	register uint32_t *matrix_b = arguments->matrix_b_obj->data;
	register uint32_t *result = arguments->result_obj->data;

	matrix_a += arguments->start_row * g_hard_width;
	matrix_b += arguments->start_row * g_hard_width;
	result += arguments->start_row * g_hard_width;

	if(arguments->is_identity){
		result += arguments->start_row;
		register uint32_t gap = g_hard_width + 1;

		for(register uint32_t i = arguments->num_rows; i--;){
			*result += 1;
			result += gap;
		}

		return NULL;
	}

	register uint32_t min;
	register uint32_t max;
	register uint32_t sum;

	__m128i vmins = _mm_set_epi32(UINT32_MAX, UINT32_MAX, UINT32_MAX, UINT32_MAX);
	__m128i vmaxes = _mm_setzero_si128();
	__m128i vsums = _mm_setzero_si128();

	register uint32_t x_max = g_hard_width / 4;

	for(register uint32_t y = arguments->num_rows; y--;){
		for(register uint32_t x = x_max; x--;){
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

	__m128i vsum_s = _mm_shuffle_epi32(vsums, _MM_SHUFFLE(0, 0, 3, 2));
	vsums = _mm_add_epi32(vsums, vsum_s);
	vsum_s = _mm_shuffle_epi32(vsums, _MM_SHUFFLE(0, 0, 0, 1));
	vsums = _mm_add_epi32(vsums, vsum_s);
	sum = _mm_cvtsi128_si32(vsums);

	*(arguments->mins + arguments->id) = min;
	*(arguments->maxes + arguments->id) = max;
	*(arguments->sums + arguments->id) = sum;

	return NULL;
}

matrix_t *matrix_add(matrix_t *matrix_a_obj, matrix_t *matrix_b_obj){
	if(matrix_a_obj->properties->prev_operation->type == UNIFORM && !matrix_a_obj->properties->prev_operation->options[0]){
		return cloned(matrix_b_obj);
	}

	if(matrix_b_obj->properties->prev_operation->type == UNIFORM && !matrix_b_obj->properties->prev_operation->options[0]){
		return cloned(matrix_b_obj);
	}

	register uint32_t is_identity;
	matrix_t *result_obj;
	if(matrix_a_obj->properties->prev_operation->type == IDENTITY){
		is_identity = 1;
		result_obj = cloned(matrix_b_obj);
	}
	else if(matrix_b_obj->properties->prev_operation->type == IDENTITY){
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

	for(register uint32_t i = g_nthreads; i--;){
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct matrix_add_argument){
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

	for(register uint32_t i = g_nthreads; i--;){
        pthread_create(thread_ids + i, NULL, matrix_add_worker, args + i);
    }

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	reset_properties(result_obj);

	for(register uint32_t i = g_nthreads; i--;){
        pthread_join(*(thread_ids + i), NULL);
		sum += *(sums + i);
		if(*(mins + i) < min) min = *(mins + i);
		if(*(maxes + i) > max) max = *(maxes + i);
    }

	result_obj->min = malloc(sizeof(uint32_t));
	result_obj->min->result = min;

	result_obj->max = malloc(sizeof(uint32_t));
	result_obj->max->result = max;

	result_obj->sum = malloc(sizeof(uint32_t));
	result_obj->sum->result = sum;

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

static inline void *matrix_mul_worker(void *arg){
	struct matrix_mul_argument *arguments = (struct matrix_mul_argument *)arg;
	register uint32_t *matrix_a = arguments->matrix_a_obj->data;
	register uint32_t *matrix_b = arguments->matrix_b_obj->data;
	register uint32_t *result = arguments->result_obj->data;

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	register uint32_t x_share_num = 0;
	register uint32_t y_share_num = 0;
	register uint32_t x_diff_same = 0;
	register uint32_t y_diff_same = 0;

	register prev_operation_t *a = arguments->matrix_a_obj->properties->prev_operation;
	register prev_operation_t *b = arguments->matrix_b_obj->properties->prev_operation;

	if(a->type == UNIFORM || b->type == UNIFORM){
		if(a->type == UNIFORM){
			y_share_num = 1;
			if(b->type == SEQUENCE){
				x_diff_same = 1;
			}
		}
		else if(b->type == UNIFORM){
			x_share_num = 1;
			if(a->type == SEQUENCE){
				y_diff_same = 1;
			}
		}
	}
	else if(a->type == SEQUENCE && b->type == SEQUENCE){
		y_diff_same = 1;
		x_diff_same = 1;
	}

	if(x_share_num){
		if(y_diff_same){
			register uint32_t curr_y = arguments->start_row;

			register uint32_t y_diff_amount = a->options[1] * g_soft_elements;
			register uint32_t y_start_amount = b->options[0] * (a->options[0] + a->options[1] * g_soft_width) * g_soft_width / 2 + y_diff_amount * curr_y;

			__m128i vy_diff = _mm_set_epi32(y_diff_amount, y_diff_amount, y_diff_amount, y_diff_amount);
			__m128i vy_current = _mm_set_epi32(y_start_amount, y_start_amount, y_start_amount, y_start_amount);

			register uint32_t max_x = g_hard_width / 4;
			for(register uint32_t y = arguments->num_rows; y--;){
				register uint32_t curr_y_width = curr_y * g_hard_width;
				register uint32_t curr_x = 0;
				for(register uint32_t x = max_x; x--;){
					_mm_store_si128((__m128i *)(result + curr_y_width + curr_x * 4), vy_current);
				}
				++curr_y;
				vy_current = _mm_add_epi32(vy_current, vy_diff);
			}
		}
		else
		{
			register uint32_t curr_y = arguments->start_row;
			register uint32_t max_x = g_hard_width / 4;
			for(register uint32_t y = arguments->num_rows; y--;){
				__m128i vx_same = _mm_setzero_si128();
				for(register uint32_t z = max_x; z--;){
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
				for(register uint32_t x = g_soft_width; x--;){
	    			result[curr_y * g_hard_width + curr_x] = x_same;
					++curr_x;
				}
				++curr_y;
			}
		}
	}
	else if(y_share_num){
		if(x_diff_same){
			register uint32_t x_diff_amount = a->options[0] * b->options[0] + b->options[1] * (g_soft_width - 1);
			register uint32_t x_start_amount = a->options[0] * (b->options[0] + b->options[0] + b->options[1] * (g_soft_width * (g_height - 1))) * g_soft_width / 2;

			__m128i vy_diff = _mm_set_epi32(x_diff_amount * 4, x_diff_amount * 4, x_diff_amount * 4, x_diff_amount * 4);

			register uint32_t max_x = g_hard_width / 4;
			register uint32_t curr_y = arguments->start_row;
			for(register uint32_t y = arguments->num_rows; y--;){
				__m128i vy_current = _mm_set_epi32(
					x_start_amount + x_diff_amount * 3,
					x_start_amount + x_diff_amount * 2,
					x_start_amount + x_diff_amount * 1,
					x_start_amount + x_diff_amount * 0
				);
				register uint32_t curr_y_width = curr_y * g_hard_width;
				for(register uint32_t x = max_x; x--;){
					_mm_store_si128((__m128i *)(result + curr_y_width + x * 4), vy_current);
					vy_current = _mm_add_epi32(vy_current, vy_diff);
				}
				++curr_y;
			}
		}
		else
		{
			register uint32_t curr_y = arguments->start_row;
			register uint32_t max_x = g_hard_width / 4;
			uint32_t y_nums[g_soft_width];

			register uint32_t curr_x = 0;
			for(register uint32_t x = g_soft_width; x--;){
				__m128i vtotal = _mm_setzero_si128();
				for(register uint32_t z = max_x; z--;){
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
			for(register uint32_t y = arguments->num_rows; y--;){
				for(register uint32_t x = g_soft_width; x--;){
					result[curr_y * g_hard_width + curr_x] = y_nums[x];
				}
			}

			for(register uint32_t i = g_height; i--;){
				if(y_nums[i] < min) min = y_nums[i];
				if(y_nums[i] > max) max = y_nums[i];
				sum += y_nums[i] * g_height;
			}
		}
	}
	else
	{
		register uint32_t curr_y = arguments->start_row;
		register uint32_t max_x = g_hard_width / 4;
		for(register uint32_t y = arguments->num_rows; y--;){
			register uint32_t curr_x = 0;
			for(register uint32_t x = g_soft_width; x--;){
				__m128i vtotal = _mm_setzero_si128();
				for(register uint32_t z = max_x; z--;){
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

matrix_t *matrix_mul(register matrix_t *matrix_a_obj, register matrix_t *matrix_b_obj){
	if(matrix_a_obj->properties->prev_operation->type == IDENTITY){
		matrix_t *result_obj = cloned(matrix_b_obj);
		return result_obj;
	}
	if(matrix_b_obj->properties->prev_operation->type == IDENTITY){
		matrix_t *result_obj = cloned(matrix_a_obj);
		return result_obj;
	}

	register uint32_t a = matrix_a_obj->properties->prev_operation->type;
	register uint32_t b = matrix_b_obj->properties->prev_operation->type;

	if(a == UNIFORM && b == UNIFORM){
		register uint32_t total = 0;
		for(register uint32_t i = g_soft_width; i--;){
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
	for(register uint32_t i = g_nthreads; i--;){
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct matrix_mul_argument){
            .matrix_a_obj = matrix_a_obj,
            .matrix_b_obj = matrix_b_t_obj,
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

	for(register uint32_t i = g_nthreads; i--;){
        pthread_create(thread_ids + i, NULL, matrix_mul_worker, args + i);
    }

	register uint32_t min = UINT32_MAX;
	register uint32_t max = 0;
	register uint32_t sum = 0;

	reset_properties(result_obj);

	for(register uint32_t i = g_nthreads; i--;){
        pthread_join(*(thread_ids + i), NULL);
		sum += *(sums + i);
		if(*(mins + i) < min) min = *(mins + i);
		if(*(maxes + i) > max) max = *(maxes + i);
    }


	result_obj->min = malloc(sizeof(uint32_t));
	result_obj->min->result = min;

	result_obj->max = malloc(sizeof(uint32_t));
	result_obj->max->result = max;

	result_obj->sum = malloc(sizeof(uint32_t));
	result_obj->sum->result = sum;


	free(mins);
	free(maxes);
	free(sums);
	free(args);

	return result_obj;

}

static inline matrix_t *m_pow(register matrix_t *matrix_obj, register uint32_t exponent){
	if(exponent == 1){
		return cloned(matrix_obj);
	}
	else if(matrix_obj->properties->prev_operation->type == IDENTITY){
		return identity_matrix();
	}
	else if(matrix_obj->properties->pow[exponent]){
		return matrix_obj->properties->pow[exponent];
	}
	else
	{
		register matrix_t *ret = m_pow(matrix_obj, exponent >> 1);
		matrix_obj->properties->pow[exponent >> 1] = ret;
		register matrix_t *passon = matrix_mul(ret, ret);
		if(exponent & 1){
			register matrix_t *passon_odd = matrix_mul(matrix_obj, passon);
			return passon_odd;
		}
		return passon;
	}
}

matrix_t *matrix_pow(matrix_t *matrix_obj, const uint32_t exponent){
	if(exponent == 1){
		return cloned(matrix_obj);
	}

	if(!exponent){
		return identity_matrix();
	}

	if(matrix_obj->properties->prev_operation->type == IDENTITY){
		return cloned(matrix_obj);
	}

	register matrix_t *ret = m_pow(matrix_obj, exponent);
	return ret;

}

uint32_t get_trace(register matrix_t *matrix_obj){
	if(matrix_obj->properties->prev_operation->type == IDENTITY) return g_height;
	if(matrix_obj->properties->prev_operation->type == UNIFORM) return matrix_obj->properties->prev_operation->options[0] * g_height;

	register uint32_t total = 0;
	register uint32_t gap = g_hard_width + 1;
	register uint32_t *matrix = matrix_obj->data;

	for(register uint32_t i = g_height; i--;){
		total += *matrix;
		matrix += gap;
	}

	return total;
}

struct get_sum_argument
{
	matrix_t *matrix_obj;
	uint32_t *sums;
	uint32_t num_rows;
	uint32_t start_row;
	uint32_t id;
};

static inline void *get_sum_worker(void *arg){
	struct get_sum_argument *arguments = (struct get_sum_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;

	matrix += arguments->start_row * g_hard_width;

	register uint32_t sum;

	__m128i vsums = _mm_setzero_si128();

	register uint32_t x_max = g_hard_width / 4;

	for(register uint32_t y = arguments->num_rows; y--;){
		for(register uint32_t x = x_max; x--;){
			__m128i vmatrix = _mm_load_si128((__m128i *)matrix);
			vsums = _mm_add_epi32(vsums, vmatrix);
			matrix += 4;
		}
		matrix += g_padding;
	}

	__m128i vsum_s = _mm_shuffle_epi32(vsums, _MM_SHUFFLE(0, 0, 3, 2));
	vsums = _mm_add_epi32(vsums, vsum_s);
	vsum_s = _mm_shuffle_epi32(vsums, _MM_SHUFFLE(0, 0, 0, 1));
	vsums = _mm_add_epi32(vsums, vsum_s);
	sum = _mm_cvtsi128_si32(vsums);

	*(arguments->sums + arguments->id) = sum;

	return NULL;
}

uint32_t get_sum(register matrix_t *matrix_obj){
	if(matrix_obj->sum) return matrix_obj->sum->result;

	pthread_t thread_ids[g_nthreads];

	register uint32_t *sums = malloc(sizeof(uint32_t) * g_nthreads);

	struct get_sum_argument *args = malloc(sizeof(struct get_sum_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;){
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct get_sum_argument){
            .matrix_obj = matrix_obj,
            .start_row = start_row,
            .num_rows = this_rows,
			.sums = sums,
			.id = i
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;){
        pthread_create(thread_ids + i, NULL, get_sum_worker, args + i);
    }

	register uint32_t sum = 0;

	for(register uint32_t i = g_nthreads; i--;){
		pthread_join(*(thread_ids + i), NULL);
		sum += *(sums + i);
	}

	matrix_obj->sum = malloc(sizeof(uint32_t));
	matrix_obj->sum->result = sum;

	free(args);

	return sum;
}

struct get_minimum_argument
{
	matrix_t *matrix_obj;
	uint32_t *mins;
	uint32_t num_rows;
	uint32_t start_row;
	uint32_t id;
};

static inline void *get_minimum_worker(void *arg){
	struct get_minimum_argument *arguments = (struct get_minimum_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;

	matrix += arguments->start_row * g_hard_width;

	register uint32_t min = UINT32_MAX;

	for(register uint32_t y = arguments->num_rows; y--;){
		for(register uint32_t x = g_soft_width; x--;){
			if(*matrix < min) min = *matrix;
			++matrix;;
		}
		matrix += g_padding;
	}

	*(arguments->mins + arguments->id) = min;

	return NULL;
}

uint32_t get_minimum(register matrix_t *matrix_obj){
	if(matrix_obj->min) return matrix_obj->min->result;

	pthread_t thread_ids[g_nthreads];

	register uint32_t *mins = mins = malloc(sizeof(uint32_t) * g_nthreads);

	struct get_minimum_argument *args = malloc(sizeof(struct get_minimum_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;){
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct get_minimum_argument){
            .matrix_obj = matrix_obj,
            .start_row = start_row,
            .num_rows = this_rows,
			.mins = mins,
			.id = i
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;){
        pthread_create(thread_ids + i, NULL, get_minimum_worker, args + i);
    }

	register uint32_t min = UINT32_MAX;

	for(register uint32_t i = g_nthreads; i--;){
		pthread_join(*(thread_ids + i), NULL);
		if(*(mins + i) < min) min = *(mins + i);
	}

	matrix_obj->min = malloc(sizeof(uint32_t));
	matrix_obj->min->result = min;

	free(args);

	return min;
}

struct get_maximum_argument
{
	matrix_t *matrix_obj;
	uint32_t *maxes;
	uint32_t num_rows;
	uint32_t start_row;
	uint32_t id;
};

static inline void *get_maximum_worker(void *arg){
	struct get_maximum_argument *arguments = (struct get_maximum_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;

	matrix += arguments->start_row * g_hard_width;

	register uint32_t max;

	__m128i vmaxes = _mm_setzero_si128();

	register uint32_t x_max = g_hard_width / 4;

	for(register uint32_t y = arguments->num_rows; y--;){
		for(register uint32_t x = x_max; x--;){
			__m128i vmatrix = _mm_load_si128((__m128i *)matrix);
			vmaxes = _mm_max_epu32(vmaxes, vmatrix);
			matrix += 4;
		}
	}

	__m128i vmax_s = _mm_shuffle_epi32(vmaxes, _MM_SHUFFLE(0, 0, 3, 2));
	vmaxes = _mm_max_epu32(vmaxes, vmax_s);
	vmax_s = _mm_shuffle_epi32(vmaxes, _MM_SHUFFLE(0, 0, 0, 1));
	vmaxes = _mm_max_epu32(vmaxes, vmax_s);
	max = _mm_cvtsi128_si32(vmaxes);

	*(arguments->maxes + arguments->id) = max;

	return NULL;
}

uint32_t get_maximum(register matrix_t *matrix_obj){
	if(matrix_obj->max) return matrix_obj->max->result;

	pthread_t thread_ids[g_nthreads];

	register uint32_t *maxes = malloc(sizeof(uint32_t) * g_nthreads);

	struct get_maximum_argument *args = malloc(sizeof(struct get_maximum_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;){
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct get_maximum_argument){
            .matrix_obj = matrix_obj,
            .start_row = start_row,
            .num_rows = this_rows,
			.maxes = maxes,
			.id = i
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;){
        pthread_create(thread_ids + i, NULL, get_maximum_worker, args + i);
    }

	register uint32_t max = 0;

	for(register uint32_t i = g_nthreads; i--;){
		pthread_join(*(thread_ids + i), NULL);
		if(*(maxes + i) > max) max = *(maxes + i);
	}

	matrix_obj->max = malloc(sizeof(uint32_t));
	matrix_obj->max->result = max;

	free(args);

	return max;
}

struct get_cmpe_argument
{
	matrix_t *matrix_obj;
	uint32_t *result;
	uint32_t num_rows;
	uint32_t start_row;
	uint32_t id;
	uint32_t value;
};

static inline void *get_cmpe_worker(void *arg){
	struct get_cmpe_argument *arguments = (struct get_cmpe_argument *)arg;
	register uint32_t *matrix = arguments->matrix_obj->data;
	matrix += arguments->start_row * g_hard_width;
	register uint32_t value = arguments->value;
	register uint32_t count = 0;

	for(register uint32_t y = arguments->num_rows; y--;){
		for(register uint32_t x = g_soft_width; x--;){
			count += value == *matrix++;
		}
		matrix += g_padding;
	}
	/*
	__m128i vvalue = _mm_set_epi32(value, value, value, value);
	__m128i vsum = _mm_setzero_si128();
	register uint32_t total_4s = g_hard_width / 4 * arguments->num_rows;

	for(register uint32_t i = total_4s; i--;){
		__m128i vcmp = _mm_load_si128((__m128i *)matrix);
		__m128i vres = _mm_cmpeq_epi32(vvalue, vcmp);
		vres = _mm_srli_epi32(vres, 31);
		vsum = _mm_add_epi32(vres, vsum);
		matrix += 4;
	}
	uint32_t res[4];
	_mm_store_si128((__m128i *)res, vsum);
	count = *(res) + *(res + 1) + *(res + 2) + *(res + 3);
	*/
	arguments->result[arguments->id] = count;
	return NULL;
}


uint32_t get_frequency(register matrix_t *matrix_obj, register uint32_t value){
	register uint32_t have_min_max = matrix_obj->min && matrix_obj->max;
	register uint32_t aob = (have_min_max && (value < matrix_obj->min->result || value > matrix_obj->max->result));

	if(aob){
		return 0;
	}

	if(matrix_obj->properties){
		switch(matrix_obj->properties->prev_operation->type){
			case SCALAR_MUL_2:
				if(value & 1){
					return 0;
				}
				break;
			case UNIFORM:
				if(value == *(matrix_obj->properties->prev_operation->options)){
					return g_soft_elements;
				}
				return 0;
			case SEQUENCE:
				if(value == *(matrix_obj->properties->prev_operation->options) && *(matrix_obj->properties->prev_operation->options + 1) == 0){
					return g_soft_elements;
				}
				if(have_min_max){
					if((value + *(matrix_obj->properties->prev_operation->options)) % *(matrix_obj->properties->prev_operation->options + 1)){
						return 0;
					}
					return 1;
				}
				break;
			case IDENTITY:
				if(!value){
					return g_soft_elements - g_height;
				}
				if(value == 1){
					return g_height;
				}
				return 0;
		}

	}

	register uint32_t *result = malloc(g_nthreads * sizeof(uint32_t));

	pthread_t thread_ids[g_nthreads];

	struct get_cmpe_argument *args = malloc(sizeof(struct get_cmpe_argument) * g_nthreads);
	register uint32_t start_row = 0;
	for(register uint32_t i = g_nthreads; i--;){
		register uint32_t this_rows = ALLOCATE_ROWS(i);
        args[i] = (struct get_cmpe_argument){
            .matrix_obj = matrix_obj,
			.result = result,
            .start_row = start_row,
            .num_rows = this_rows,
			.id = i,
			.value = value
        };
		start_row += this_rows;
    }

	for(register uint32_t i = g_nthreads; i--;){
        pthread_create(thread_ids + i, NULL, get_cmpe_worker, args + i);
    }

	register uint32_t count = 0;

	for(register uint32_t i = g_nthreads; i--;){
        pthread_join(*(thread_ids + i), NULL);
		count += *(result + i);
    }

	free(result);

	return count;
}
