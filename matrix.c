#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <pthread.h>

/** A square matrix of given width */
#define WIDTH 512
#define WIDTHN 511
#define IDX(x, y) ((y) * WIDTH + (x))
#define THREADS 3

pthread_t thread_ids[THREADS];

typedef struct worker_struct
{
	const float *a;		// 8  bytes		8  bytes
	const float *b;		// 8  bytes		16 bytes
	float *res;			// 4  bytes 	20 bytes
	int y_start;		// 4  bytes		24 bytes
	char padding[40];	// 40 bytes		64 bytes
} worker_struct;

static void *worker(void *args)
{
	worker_struct *pass = (worker_struct *)args;
	int y_start = pass->y_start;
	int y_end = y_start - WIDTH / THREADS;
	const float *a = pass->a;
	const float *b = pass->b;
	float *res = pass->res;
	for(register size_t y = y_start - 1; y >= y_end; --y)
	{
		for(register size_t k = WIDTH; --k;)
		{
			for (register size_t x = WIDTH; --x;)
			{
				res[IDX(x, y)] += a[IDX(k, y)] * b[IDX(x, k)];
			}
		}
	}
	return NULL;
}


/**
* Matrix multiplication
* Important: this function assumes that res is zero initalised
*/
static void multiply(const float *a, const float *b, float *res) {
	int workers = 0;
	worker_struct *pass0 = malloc(sizeof(worker_struct));
	printf("y: '%d'\n", WIDTH - (WIDTH / THREADS) * 0);
	pass0->a = a;
	pass0->b = b;
	pass0->res = res;
	pass0->y_start = WIDTH - (WIDTH / THREADS) * workers;
	if (pthread_create(&thread_ids[0], NULL, worker, pass0) != 0)
	{
		perror("pthread_create failed");
		return;
	}
	worker_struct *pass1 = malloc(sizeof(worker_struct));
	printf("y: '%d'\n", WIDTH - (WIDTH / THREADS) * 1);
	pass1->a = a;
	pass1->b = b;
	pass1->res = res;
	pass1->y_start = WIDTH - (WIDTH / THREADS) * workers;
	if (pthread_create(&thread_ids[0], NULL, worker, pass1) != 1)
	{
		perror("pthread_create failed");
		return;
	}
	worker_struct *pass2 = malloc(sizeof(worker_struct));
	printf("y: '%d'\n", WIDTH - (WIDTH / THREADS) * 2);
	pass2->a = a;
	pass2->b = b;
	pass2->res = res;
	pass2->y_start = WIDTH - (WIDTH / THREADS) * workers;
	if (pthread_create(&thread_ids[2], NULL, worker, pass2) != 0)
	{
		perror("pthread_create failed");
		return;
	}
}

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
	while ((w >>= 1)) {
		// duplicate the upper left quadrant into the other three quadrants
		for (register size_t y = quad_size - 1; --y;) {
			int y_plus_quad_size = y + quad_size;
			for (register size_t x = quad_size - 1; --x;) {
				const float v = m[IDX(x, y)];
				m[IDX(x + quad_size, y)] = v;
				m[IDX(x, y_plus_quad_size)] = v;
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
	//for (size_t y = WIDTHN; --y;) {
		//for (size_t x = WIDTHN; --x;) {
			//assert(x == y ? c[IDX(x, y)] == WIDTH : c[IDX(x, y)] == 0);
		//}
	//}
	// */

	print(c);

	free(a);
	free(b);
	free(c);
	return 0;
}
