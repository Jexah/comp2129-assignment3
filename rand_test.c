
#include <stdio.h>

/* always assuming int is at least 32 bits */
int rand();

int rseed = 0;

inline void srand(int x)
{
	rseed = x;
}

static const unsigned b = 214013;
static const unsigned c = 2531011;

#define RAND_MAX_32 ((1U << 31) - 1)
#define RAND_MAX ((1U << 15) - 1)

inline int rand(void)
{
	rseed = (b * rseed + c);
	printf("SEED: %u\n", rseed);
    return (rseed >> 16) & 0x7FFF;
}



static inline unsigned powi(register unsigned input, register unsigned exponent)
{
	if(exponent == 0)
	{
		return 1;
	}
	if(exponent == 1)
	{
		return input;
	}
	else
	{
		register unsigned ret = powi(input, exponent >> 1);
		register unsigned passon = ret * ret;

		if(exponent & 1)
		{
			register unsigned passon_odd = input * passon;
			return passon_odd;
		}
		return passon;
	}
}



static inline unsigned get_rand_set(register unsigned e)
{
	register unsigned total = (powi(b, e) + 1);
	e >>= 1;
	while(e)
	{
		total *= (powi(b, e) + 1);
		e >>= 1;
	}
	return total;
}

static inline unsigned get_msb(register unsigned n)
{
	register unsigned e = 0;
	while(n >>= 1)
	{
		++e;
	}
	return e;
}

static inline unsigned get_seed(register unsigned seed, register unsigned num)
{
	register unsigned n = powi(2, get_msb(num));
	return powi(b, num) * seed + c * get_rand_set(n);
}

int main()
{
	rand();
	rand();
	rand();
	rand();
	rand();
	rand();
	rand();
	rand();
	rand();
	rand();

	printf("\n== %u ==\n\n", get_seed(0, 7));
	return 0;
}
