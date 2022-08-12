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
	printf("��ũ����\n");
	printf("��������Դ���ŵĸ�����\n");
	scanf("%d", &q);  //������Ÿ���q
	int i, j;
	printf("��������Դ���ŵĸ��ʷֲ���\n");
	for (i = 0; i<q; i++){
		scanf("%f", &p[i]);  //����������Ÿ���
		p2[i] = p[i];
	}
	sort(p, p + q, comp);  //����
	float lg[10];
	float l[10];
	int k[10];
	for (i = 0; i<q; i++){
		lg[i] = -log(p[i]) / log(2);  //����-logP(xi)
		l[i] = 1 + lg[i];
		if (l[i]>(int)(lg[i] + 1))
			k[i] = l[i];           //ȷ��K���㲻��ʽ
		else
			k[i] = lg[i];
	}
	memset(p1, 0, sizeof(p1));
	p2[0] = 0;
	for (i = 1; i<q; i++){
		p1[i] = p1[i - 1] + p[i - 1];     //�����ۼӸ���
		p2[i] = p1[i];
	}
	for (i = 0; i<q; i++){
		for (j = 1; j <= k[i] + 1; j++){
			p2[i] = p2[i] * 2;              //�����������
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
	float R = Hx / K;   //����ƽ�����Ŵ�������
	printf("��Դ����ai   ���Ÿ���p(ai)   �ۼӸ���Pi   -logp(ai)  ���ֳ���Ki   ����\n");
	for (i = 0; i<q; i++){
		printf("%6d         ", i + 1);  //������ű��
		printf("%-3f       ", p[i]);  //������Ÿ���
		printf("%-3f     ", p1[i]);  //����ۼӸ���
		printf("%-5f      ", lg[i]);  //���-logP(xi)
		printf("%-4d     ", k[i]);   //������ֳ���Ki
		for (j = 1; j <= k[i]; j++)
			printf("%d", bi[i][j]);   //�������
		printf("\n");
	}
	printf("ƽ����Ϣ��������=%-3f\n", R);  //���ƽ�����Ŵ�������
	return 0;
}
