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
			cout << out << "译码后是" << OutString[j + 1] << endl;
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
				cout << out << "译码后是" << OutString[j] << endl;
			}
		}
	}
}
/*void LZW::decodedisplay(int g){
cout<<"经过LZW译码后的码子如下："<<endl;
for(int i=0;i<=g;i++)
cout<<OutString[j]<<endl;
cout<<endl;
cout<<"经LZW译码后的词典如下："<<endl;
for(int r=0;r<N;r++)
cout<<r+1<<Dic[r]<<endl;
}*/
int LZW::IntIsDic(int g, int j){//判断整数g是否在字典中
	for (int i = 0; i<j + 3; i++)
		if (g == i)
			return 1;
	return 0;
}

void LZW::code(string cs[N]){//译码
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

int LZW::StringIsDic(string e){//判断字符是否在字典里面
	for (int b = 0; b<200; b++){
		if (e == Dic[b]) return 1;
	}
	return 0;
}
int LZW::codeDic(string f){//通过字符串输出对应字典序号
	int w = 0;
	for (int y = 0; y<200; y++)
		if (f == Dic[y]){
			w = y + 1;
			break;
		}
	return w;
}
void LZW::codedisplay(int g){
	cout << "经过LZW编码后的码子如下：" << endl;
	for (int i = 0; i <= g; i++)
		cout << codes[i];
	cout << endl;
	cout << "经LZW编码后的词典如下：" << endl;
	for (int r = 0; r<g + 3; r++)
		cout << r + 1 << Dic[r] << endl;
}

int main(){//主函数即时处理过程
	LZW t;
	string CSstream[N];
	int length;
	cout << "请输入所求码子序列的长度：";
	cin >> length;
	while (length >= N){
		cout << "该长度太长，请重新输入：";
		cin >> length;
	}
	cout << "请输入要进行LZW编码的字符序列：" << endl;
	for (int a = 0; a<length; a++)
		cin >> CSstream[a];
	t.code(CSstream);
	t.decode(t.codes);
	system("pause");
	return 0;
}




