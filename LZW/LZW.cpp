#include<iostream>
#include<string.h>
using namespace std;
const int N = 200;
class LZW{
    private:
	    string Dic[200];
    public:
	    int codes[N];
	    LZW(){
	    	Dic[0] = 'a';
	    	Dic[1] = 'b';
    		Dic[2] = 'c';
	    	string *p = Dic;
	    }
	//void decode(int codes[N]);
	void decode(int codes[]);
	void code(string cs[N]);
	int StringIsDic(string e);
	int codeDic(string f);
	int IntIsDic(int g, int j);
	//string decodeDic(int g);
	//void decodedisplay(int z);
	void codedisplay(int g);
};

void LZW::decode(int codes[N]){
	string p1, p2, OutString[N];
	int w, p, out;
	p = codes[0];
	int j = 0;
	for (int i = 1; i<N; i++){
		w = codes[i];
		if (w<0){
			p1 = Dic[p - 1];
			out = p;
			OutString[j + 1] = p1;
			i = N - 1;
			cout << out << "�������" << OutString[j + 1] << endl;
			//	break;
		}
		else{
			p1 = Dic[p - 1];
			if (IntIsDic(w, j) == 0){


				//if(i==N-1)
				p2 = p1;
				p = w;
			}
			else{
				p2 = Dic[w - 1];
				Dic[3 + j] = p1 + p2;
				j++;
				out = p;
				p = w;
				OutString[j] = p1;
				cout << out << "�������" << OutString[j] << endl;
			}
		}
	}
}
/*void LZW::decodedisplay(int g){
cout<<"����LZW�������������£�"<<endl;
for(int i=0;i<=g;i++)
cout<<OutString[j]<<endl;
cout<<endl;
cout<<"��LZW�����Ĵʵ����£�"<<endl;
for(int r=0;r<N;r++)
cout<<r+1<<Dic[r]<<endl;
}*/
int LZW::IntIsDic(int g, int j){//�ж�����g�Ƿ����ֵ���
	for (int i = 0; i<j + 3; i++)
		if (g == i)
			return 1;
	return 0;
}

void LZW::code(string cs[N]){//����
	string P, C, K;
	P = cs[0];
	int j = 0;
	for (int i = 1; i<N; i++){
		C = cs[i];
		K = P + C;
		if (StringIsDic(K))
			P = K;
		else{
			codes[j] = codeDic(P);
			Dic[3 + j] = K;
			P = C;
			j++;
		}
		if (N - 1 == i)
			codes[j] = codeDic(P);
	}
	codedisplay(j);
	//decode(codes[j]);
}

int LZW::StringIsDic(string e){//�ж��ַ��Ƿ����ֵ�����
	for (int b = 0; b<200; b++){
		if (e == Dic[b]) return 1;
	}
	return 0;
}
int LZW::codeDic(string f){//ͨ���ַ��������Ӧ�ֵ����
	int w = 0;
	for (int y = 0; y<200; y++)
		if (f == Dic[y]){
			w = y + 1;
			break;
		}
	return w;
}
void LZW::codedisplay(int g){
	cout << "����LZW�������������£�" << endl;
	for (int i = 0; i <= g; i++)
		cout << codes[i];
	cout << endl;
	cout << "��LZW�����Ĵʵ����£�" << endl;
	for (int r = 0; r<g + 3; r++)
		cout << r + 1 << Dic[r] << endl;
}

int main(){//��������ʱ�������
	LZW t;
	string CSstream[N];
	int length;
	cout << "�����������������еĳ��ȣ�";
	cin >> length;
	while (length >= N){
		cout << "�ó���̫�������������룺";
		cin >> length;
	}
	cout << "������Ҫ����LZW������ַ����У�" << endl;
	for (int a = 0; a<length; a++)
		cin >> CSstream[a];
	t.code(CSstream);
	t.decode(t.codes);
	system("pause");
	return 0;
}




