#ifndef MATRIX_H
#define MATRIX_H

#include <stdint.h>

/* utility functions */

typedef struct matrix_t matrix_t;

typedef struct calculated_t
{
	uint32_t result;
} calculated_t;

typedef struct prev_operation_t
{
	uint32_t type;
	uint32_t options[2];
} prev_operation_t;

typedef struct properties_t
{
	prev_operation_t *prev_operation;
	matrix_t *pow[20];
} properties_t;


typedef struct matrix_t
{
	uint32_t *data;
	calculated_t *min;
	calculated_t *max;
	calculated_t *sum;
	properties_t *properties;
} matrix_t;

typedef struct kvp_t
{
	uint32_t key;
	uint32_t value;
} kvp_t;


void set_seed(uint32_t value);
void set_nthreads(ssize_t count);
void set_dimensions(ssize_t width);

void display(register matrix_t* matrix_obj);
void display_row(register matrix_t* matrix_obj, const ssize_t row);
void display_column(register matrix_t* matrix_obj, const ssize_t column);
void display_element(const matrix_t* matrix_obj, ssize_t row, ssize_t column);

/* matrix operations */

matrix_t* identity_matrix(void);
matrix_t* random_matrix(uint32_t seed);
matrix_t* uniform_matrix(uint32_t value);
matrix_t* sequence_matrix(uint32_t start, uint32_t step);

matrix_t* cloned(register matrix_t* matrix_obj);
matrix_t* reversed(register matrix_t* matrix_obj);
matrix_t* transposed(register matrix_t* matrix_obj);

matrix_t* scalar_add(register matrix_t* matrix_obj, const register uint32_t scalar);
matrix_t* scalar_mul(register matrix_t* matrix_obj, const register uint32_t scalar);
matrix_t* matrix_add(register matrix_t* matrix_a_obj, register matrix_t* matrix_b_obj);
matrix_t* matrix_mul(register matrix_t* matrix_a_obj, register matrix_t* matrix_b_obj);
matrix_t* matrix_pow(matrix_t* matrix, const uint32_t exponent);

/* compute operations */

uint32_t get_sum(register matrix_t* matrix_obj);
uint32_t get_trace(register matrix_t* matrix_obj);
uint32_t get_minimum(register matrix_t* matrix_obj);
uint32_t get_maximum(register matrix_t* matrix_obj);
uint32_t get_frequency(register matrix_t* matrix_obj, register uint32_t value);
uint32_t get_stats(register matrix_t *matrix_obj, char type, register uint32_t value);

#endif
