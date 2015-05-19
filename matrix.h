#ifndef MATRIX_H
#define MATRIX_H

#include <stdint.h>

/* utility functions */

typedef struct occurances_t
{
	uint32_t *data;
	char prev_operation;
} occurances_t;

typedef struct matrix_t
{
	uint32_t *data;
	uint32_t min;
	uint32_t max;
	uint32_t sum;
	occurances_t *occurances;
} matrix_t;

typedef struct kvp_t
{
	uint32_t key;
	uint32_t value;
} kvp_t;


void set_seed(uint32_t value);
void set_nthreads(ssize_t count);
void set_dimensions(ssize_t width);

void display(register matrix_t* matrix);
void display_row(register matrix_t* matrix, const ssize_t row);
void display_column(register matrix_t* matrix, const ssize_t column);
void display_element(const matrix_t* matrix, ssize_t row, ssize_t column);

/* matrix operations */

matrix_t* identity_matrix(void);
matrix_t* random_matrix(uint32_t seed);
matrix_t* uniform_matrix(uint32_t value);
matrix_t* sequence_matrix(uint32_t start, uint32_t step);

matrix_t* cloned(register matrix_t* matrix);
matrix_t* reversed(register matrix_t* matrix);
matrix_t* transposed(register matrix_t* matrix);

matrix_t* scalar_add(register matrix_t* matrix, const register uint32_t scalar);
matrix_t* scalar_mul(register matrix_t* matrix, const register uint32_t scalar);
matrix_t* matrix_add(register matrix_t* matrix_a, register matrix_t* matrix_b);
matrix_t* matrix_mul(register matrix_t* matrix_a, register matrix_t* matrix_b);
matrix_t* matrix_pow(matrix_t* matrix, const uint32_t exponent);

/* compute operations */

uint32_t get_sum(register matrix_t* matrix);
uint32_t get_trace(register matrix_t* matrix);
uint32_t get_minimum(register matrix_t* matrix);
uint32_t get_maximum(register matrix_t* matrix);
uint32_t get_frequency(register matrix_t* matrix, register uint32_t value);

#endif
