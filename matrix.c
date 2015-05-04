#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <pthread.h>

/** A square matrix of given width */
#define WIDTH 512
#define IDX(x, y) ((y) * WIDTH + (x))

/**
* Matrix multiplication
* Important: this function assumes that res is zero initalised
*/
/* Old
static void multiply(const float *a, const float *b, float *res) {
	for (size_t y = 0; y < WIDTH; y++) {
		for (size_t k = 0; k < WIDTH; k++) {
			for (size_t x = 0; x < WIDTH; x++) {
				res[IDX(x, y)] += a[IDX(k, y)] * b[IDX(x, k)];
			}
		}
	}
}
// */
// /* New
static void multiply(const float *a, const float *b, float *res) {
	for (size_t y = WIDTH; --y;) {
		for (size_t k = WIDTH; --k;) {
			for (size_t x = WIDTH; --x;) {
				res[IDX(x, y)] += a[IDX(k, y)] * b[IDX(x, k)];
			}
		}
	}
}
// */

/**
* Create a Hadamard matrix, if H is Hadamard matrix, then
* HH^T = nI, where I is the identity matrix and n is the width.
* It makes it easy to verify that matrix multiplication was done correctly.
*
* Sylverster's construction (implemented here)
* only works for matrices that have width that is a power of 2
*
* Note that this construction produces matrices that are symmentric
*/
static void hadamard(float *m) {
	assert(((WIDTH - 1) & WIDTH) == 0); // must be a power of 2
	size_t w = WIDTH, quad_size = 1;
	m[0] = 1;
	while ((w >>= 1) != 0) {
		// duplicate the upper left quadrant into the other three quadrants
		for (size_t y = 0; y < quad_size; ++y) {
			for (size_t x = 0; x < quad_size; ++x) {
				const float v = m[IDX(x, y)];
				m[IDX(x + quad_size, y)] = v;
				m[IDX(x, y + quad_size)] = v;
				m[IDX(x + quad_size, y + quad_size)] = -v;
			}
		}
		quad_size *= 2;
	}
}

/** Prints a matrix */
static void print(const float *m) {
	for (size_t y = 0; y < WIDTH; y++) {
		for (size_t x = 0; x < WIDTH; x++) {
			printf("%5.1f ", m[IDX(x, y)]);
		}
		puts("");
	}
}
int main(void) {

	// allocate memory for the matrices
	float *a, *b, *c;
	a = malloc(WIDTH * WIDTH * sizeof(float));
	b = malloc(WIDTH * WIDTH * sizeof(float));

	// initalise the result matrix
	c = calloc(WIDTH * WIDTH, sizeof(float));
	hadamard(a);
	memcpy(b, a, WIDTH * WIDTH * sizeof(float));

	// compute the result
	multiply(a, b, c);

	// verify the result
	/* Old
	for (size_t y = 0; y < WIDTH; y++) {
		for (size_t x = 0; x < WIDTH; x++) {
			assert(x == y ? c[IDX(x, y)] == WIDTH : c[IDX(x, y)] == 0);
		}
	}
	*/
	// /* New
	for (size_t y = WIDTH; --y;) {
		for (size_t x = WIDTH; --x;) {
			assert(x == y ? c[IDX(x, y)] == WIDTH : c[IDX(x, y)] == 0);
		}
	}
	// */

	print(c);

	free(a);
	free(b);
	free(c);
	return 0;
}
