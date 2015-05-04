#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define WIDTH 512

const static char *includes = "#include <assert.h>\n"
                              "#include <stdio.h>\n"
                              "#include <string.h>\n"
                              "#include <stdlib.h>\n"
                              "#include <pthread.h>";

const static char *defines =    "#define WIDTH 512\n"
                                "#define WIDTHN 511\n"
                                "#define IDX(x, y) ((y) * WIDTH + (x))\n";

static char *multiply(int width)
{
    char *output = calloc(sizeof(char), 500 * WIDTH + 200);
    char *head = "static void multiply(const float *a, const float *b, float *res)\n{\n";
    strcpy(output, head);
    char *cursor = output + strlen(head);
    char *buffer = calloc(sizeof(char), 100);
    for(int y = WIDTH; --y;)
    {
        for(int k = WIDTH; --k;)
        {
            for(int x = WIDTH; --x;)
            {
                //"res[IDX(x,y)] += a[IDX(k,y)] * b[IDX(x,k)];\n"
                sprintf(buffer, "res[IDX(%d,%d)] += a[IDX(%d,%d)] * b[IDX(%d,%d)];\n", x, y, k, y, x, k);
                strcpy(cursor, buffer);
                printf("y: %d\nk: %d\nx: %n\n", y, k, n);
                cursor += strlen(buffer);
            }
        }
    }
    return output;
}

const static char *hadamard =   "static void hadamard(float *m) {\n"
                                	"assert(((WIDTH - 1) & WIDTH) == 0); // must be a power of 2\n"
                                    "size_t w = WIDTH, quad_size = 1;\n"
                                    "m[0] = 1;\n"
                                    "while ((w >>= 1) != 0) {\n"
                                        "// duplicate the upper left quadrant into the other three quadrants\n"
                                        "for (size_t y = 0; y < quad_size; ++y) {\n"
                                            "for (size_t x = 0; x < quad_size; ++x) {\n"
                                                "const float v = m[IDX(x, y)];\n"
                                                "m[IDX(x + quad_size, y)] = v;\n"
                                                "m[IDX(x, y + quad_size)] = v;\n"
                                                "m[IDX(x + quad_size, y + quad_size)] = -v;\n"
                                            "}\n"
                                        "}\n"
                                        "quad_size *= 2;\n"
                                    "}\n"
                                "}\n";

int main(void)
{
    FILE *multiply_file = fopen("multiply", "w");
    fprintf(multiply_file, multiply(WIDTH));
    return 0;
}
