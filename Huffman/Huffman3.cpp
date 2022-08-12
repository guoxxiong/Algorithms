#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#define DELTA 1.0e-6 

void sort(float *, char **, int *, int);
void code(float *, char **, int *, int);

int main(void)
{
	float *p_i, *p;
	float sum;
	float temp;
	char **c;
	int *idx;
	int q;
	int i;
	printf("\t\tHuffman编码\n");
	/* Read the number of source symbol in */
	printf("输入信源符号个数q：\n");
	fscanf(stdin, "%d", &q);
	printf("输入信源的概率分布：\n");
	/* Allocation memory */
	idx = (int *)calloc(q, sizeof(int));
	p_i = (float *)calloc(q, sizeof(float));
	p = (float *)calloc(q, sizeof(float));
	c = (char **)calloc(q, sizeof(char *));

	for (i = 0; i < q; i++)
	{
		c[i] = (char *)calloc(1, sizeof(char));
		c[i][0] = '\0';
	}

	/* Read the probability of each symbol in and validate them */
	sum = 0.0;
	for (i = 0; i < q; i++)
	{
		fscanf(stdin, "%f", &p[i]);
		p_i[i] = p[i];
		idx[i] = i;
		sum += p_i[i];
	}

	if (fabs(sum - 1.0) > DELTA)
	{
		fprintf(stderr, "p_i err \n");
		exit(-1);
	}


	/* Coding */
	code(p_i, c, idx, q);

	/* Output result */
	for (i = 0; i < q; i++)
	{
		fprintf(stdout, "%d %.6f %s\n", idx[i], p[idx[i]], c[idx[i]]);
	}

	/* Free the memory */
	for (i = q; i > 0; --i)
	{
		free(c[i]);
	}
	free(c);
	free(p);
	free(p_i);
	free(idx);

	exit(0);
}

/*
* Sorting algorithm
*/
void sort(float *p, char **c, int *idx, int q)
{
	int finish = 0;
	int i, j;
	int l1, l2;
	char *s;
	float t;
	while (i < q && !finish)
	{
		finish = 1;
		for (j = 0; j < q - i; j++)
		{
			if (p[j] < p[j + 1])
			{
				t = p[j];
				p[j] = p[j + 1];
				p[j + 1] = t;

				l1 = idx[j];
				idx[j] = idx[j + 1];
				idx[j + 1] = l1;

				l1 = strlen(c[j]);
				l2 = strlen(c[j + 1]);
				s = (char *)calloc(l1 + 1, sizeof(char));

				strcpy(s, c[j]);

				realloc(c[j], l2 + 1);
				strcpy(c[j], c[j + 1]);

				realloc(c[j + 1], l1 + 1);
				strcpy(c[j + 1], s);

				free(s);
			}
		}
		i++;
	}
}


/*
* Huffman recursive coding algorithm
*/
void code(float *p, char **c, int *idx, int q)
{
	int l1, l2;
	char *s;


	/* if q = 2, return the code words */
	if (q == 2)
	{
		realloc(c[0], 3);
		realloc(c[1], 3);

		strcat(c[0], "0");
		strcat(c[1], "1");
	}
	else
	{
		/* if q > 2, reduce the source */
		p[q - 2] = p[q - 1] + p[q - 2];
		/* call the coding algorithm recursively */
		sort(p, c, idx, q - 1);
		code(p, c, idx, q - 1);


		/* Resume the source and return the code words */
		l1 = strlen(c[q - 2]);
		l2 = strlen(c[q - 1]);

		s = (char *)calloc(l1 + 2, sizeof(char *));
		strcpy(s, c[q - 2]);

		realloc(c[q - 2], l1 + 2);
		strcat(c[q - 2], "0");

		realloc(c[q - 1], l2 + 2);
		strcat(s, "1");
		strcpy(c[q - 1], s);

		free(s);
	}
}

