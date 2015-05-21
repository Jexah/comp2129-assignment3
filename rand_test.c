
#include <stdio.h>


static const unsigned b = 214013;
static const unsigned c = 2531011;

#define RAND_MAX_32 ((1U << 31) - 1)
#define RAND_MAX ((1U << 15) - 1)


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
	/*
	unsigned total = 1;
	while(e)
	{
		total *= (powi(b, e) + 1);
		e >>= 1;
	}
	return total;
	*/

	unsigned total = 1;
	e -= 1;
	while(e < 400 && e)
	{
		total *= (powi(b, e) + 1);
		e -= 1;
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
	return powi(b, num) * seed + c * get_rand_set(num);
}

int main()
{
	//printf("\n== %u ==\n\n", get_seed(rseed, 4));

	register unsigned rseed = 0;

		rseed = (b * rseed + c);
		printf("%u\n", (rseed >> 16) & 0x7FFF);

	register unsigned i = 32768 - 3;
	while(i--)
	{
		rseed = (b * rseed + c);
	    (rseed >> 16) & 0x7FFF;
	}
		rseed = (b * rseed + c);
	printf("%u\n", (rseed >> 16) & 0x7FFF);

	return 0;
}
