#include <stdio.h>
#include <algorithm>
#include <math.h>
#include <string.h>
using namespace std;
bool comp(float a, float b){
	return a>b;
}
int main(){
	int q;
	int bi[10][10];
	float p[10], p1[10], p2[10];
	printf("香农编码\n");
	printf("请输入信源符号的个数：\n");
	scanf("%d", &q);  //输入符号个数q
	int i, j;
	printf("请输入信源符号的概率分布：\n");
	for (i = 0; i<q; i++){
		scanf("%f", &p[i]);  //输入各个符号概率
		p2[i] = p[i];
	}
	sort(p, p + q, comp);  //排序
	float lg[10];
	float l[10];
	int k[10];
	for (i = 0; i<q; i++){
		lg[i] = -log(p[i]) / log(2);  //计算-logP(xi)
		l[i] = 1 + lg[i];
		if (l[i]>(int)(lg[i] + 1))
			k[i] = l[i];           //确定K满足不等式
		else
			k[i] = lg[i];
	}
	memset(p1, 0, sizeof(p1));
	p2[0] = 0;
	for (i = 1; i<q; i++){
		p1[i] = p1[i - 1] + p[i - 1];     //计算累加概率
		p2[i] = p1[i];
	}
	for (i = 0; i<q; i++){
		for (j = 1; j <= k[i] + 1; j++){
			p2[i] = p2[i] * 2;              //计算二进制数
			if (p2[i] >= 1){
				p2[i] -= 1;
				bi[i][j] = 1;
			}
			else
				bi[i][j] = 0;
		}
	}
	float K = 0;
	float Hx = 0;
	for (i = 0; i<q; i++){
		K += p[i] * k[i];
		Hx += p[i] * lg[i];
	}
	float R = Hx / K;   //计算平均符号传输速率
	printf("信源符号ai   符号概率p(ai)   累加概率Pi   -logp(ai)  码字长度Ki   码字\n");
	for (i = 0; i<q; i++){
		printf("%6d         ", i + 1);  //输出符号编号
		printf("%-3f       ", p[i]);  //输出符号概率
		printf("%-3f     ", p1[i]);  //输出累加概率
		printf("%-5f      ", lg[i]);  //输出-logP(xi)
		printf("%-4d     ", k[i]);   //输出码字长度Ki
		for (j = 1; j <= k[i]; j++)
			printf("%d", bi[i][j]);   //输出码字
		printf("\n");
	}
	printf("平均信息传输速率=%-3f\n", R);  //输出平均符号传输速率
	return 0;
}
