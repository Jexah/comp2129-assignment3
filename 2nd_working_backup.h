#ifndef MATRIX_H
#define MATRIX_H

#include <stdint.h>

/* utility functions */

void set_seed(uint32_t value);
void set_nthreads(ssize_t count);
void set_dimensions(ssize_t width);

void display(register uint32_t* matrix);
void display_row(register uint32_t* matrix, const ssize_t row);
void display_column(register uint32_t* matrix, const ssize_t column);
void display_element(const uint32_t* matrix, ssize_t row, ssize_t column);

/* matrix operations */

uint32_t* identity_matrix(void);
uint32_t* random_matrix(uint32_t seed);
uint32_t* uniform_matrix(uint32_t value);
uint32_t* sequence_matrix(uint32_t start, uint32_t step);

uint32_t* cloned(register uint32_t* matrix);
uint32_t* reversed(register uint32_t* matrix);
uint32_t* transposed(register uint32_t* matrix);

uint32_t* scalar_add(register uint32_t* matrix, const register uint32_t scalar);
uint32_t* scalar_mul(register uint32_t* matrix, const register uint32_t scalar);
uint32_t* matrix_add(register uint32_t* matrix_a, register uint32_t* matrix_b);
uint32_t* matrix_mul(register uint32_t* matrix_a, register uint32_t* matrix_b);
uint32_t* matrix_pow(uint32_t* matrix, const uint32_t exponent);

/* compute operations */

uint32_t get_sum(register uint32_t* matrix);
uint32_t get_trace(register uint32_t* matrix);
uint32_t get_minimum(register uint32_t* matrix);
uint32_t get_maximum(register uint32_t* matrix);
uint32_t get_frequency(register uint32_t* matrix, register uint32_t value);

#endif
