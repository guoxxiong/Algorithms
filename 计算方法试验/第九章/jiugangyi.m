%复合梯形公式
clc
n=4;%区间等分数
a=0;
b=1;
h=(b-a)/n;
s=0;
for i=1:n-1
   A=log(1+a+i*h)/(a+i*h);
   s=s+A ;
end
TN=0.5*h*(1+2*s+log(2));
fprintf('4等分复合梯形所求积分I=%4.6f\n',TN);
n1=8;%区间等分数
a=0;
b=1;
h=(b-a)/n1;
s=0;
for i=1:n1-1
   A=log(1+a+i*h)/(a+i*h);
   s=s+A ;
end
TN1=0.5*h*(1+2*s+log(2));
fprintf('8等分复合梯形所求积分I=%4.6f\n',TN1);
n2=16;%区间等分数
a=0;
b=1;
h=(b-a)/n2;
s=0;
for i=1:n2-1
   A=log(1+a+i*h)/(a+i*h);
   s=s+A ;
end
TN2=0.5*h*(1+2*s+log(2));
fprintf('16等分复合梯形所求积分I=%4.6f\n',TN2);
n3=32;%区间等分数
a=0;
b=1;
h=(b-a)/n3;
s=0;
for i=1:n3-1
   A=log(1+a+i*h)/(a+i*h);
   s=s+A ;
end
TN3=0.5*h*(1+2*s+log(2));
fprintf('32等分复合梯形所求积分I=%4.6f\n',TN3);
n4=64;%区间等分数
a=0;
b=1;
h=(b-a)/n4;
s=0;
for i=1:n4-1
   A=log(1+a+i*h)/(a+i*h);
   s=s+A ;
end
TN4=0.5*h*(1+2*s+log(2));
fprintf('64等分复合梯形所求积分I=%4.6f\n',TN4);
 
 
%复合Simpson公式
hh=(b-a)/(2*n);
ss=0;
ss1=0;
for i=0:n-1
   A=log(1+a+(2*i+1)*hh)/(a+(2*i+1)*hh);
   ss=ss+A ;
end
for i=1:n-1
   B=log(1+a+(2*i)*hh)/(a+(2*i)*hh);
   ss1=ss1+B ;
end
TN11=1/3*hh*(1+log(2)+4*ss+2*ss1);
fprintf('8等分复合Simpson所求积分I=%4.6f\n',TN11);
 
hh=(b-a)/(2*n1);
ss=0;
ss1=0;
for i=0:n1-1
   A=log(1+a+(2*i+1)*hh)/(a+(2*i+1)*hh);
   ss=ss+A ;
end
for i=1:n1-1
   B=log(1+a+(2*i)*hh)/(a+(2*i)*hh);
   ss1=ss1+B ;
end
TN22=1/3*hh*(1+log(2)+4*ss+2*ss1);
fprintf('16等分复合Simpson所求积分I=%4.6f\n',TN22);
 
hh=(b-a)/(2*n2);
ss=0;
ss1=0;
for i=0:n2-1
   A=log(1+a+(2*i+1)*hh)/(a+(2*i+1)*hh);
   ss=ss+A ;
end
for i=1:n2-1
   B=log(1+a+(2*i)*hh)/(a+(2*i)*hh);
   ss1=ss1+B ;
end
TN33=1/3*hh*(1+log(2)+4*ss+2*ss1);
fprintf('32等分复合Simpson所求积分I=%4.4f\n',TN33);
 
hh=(b-a)/(2*n3);
ss=0;
ss1=0;
for i=0:n3-1
   A=log(1+a+(2*i+1)*hh)/(a+(2*i+1)*hh);
   ss=ss+A ;
end
for i=1:n3-1
   B=log(1+a+(2*i)*hh)/(a+(2*i)*hh);
   ss1=ss1+B ;
end
TN44=1/3*hh*(1+log(2)+4*ss+2*ss1);
fprintf('64等分复合Simpson所求积分I=%4.6f\n',TN44);
 
hh=(b-a)/(2*n4);
ss=0;
ss1=0;
for i=0:n4-1
   A=log(1+a+(2*i+1)*hh)/(a+(2*i+1)*hh);
   ss=ss+A ;
end
for i=1:n4-1
   B=log(1+a+(2*i)*hh)/(a+(2*i)*hh);
   ss1=ss1+B ;
end
TN55=1/3*hh*(1+log(2)+4*ss+2*ss1);
fprintf('128等分复合Simpson所求积分I=%4.6f\n',TN55);
 
%rombegr公式
a=0;
b=1;
h2=b-a;
esp=10^(-5);
kmax=10;
T1=h2*0.5*(1+log(2));
S1=0;C1=0;C2=0;R1=0;R2=0;
for k=1:kmax
    h2=(b-a)/2^k;
    i=1:2^(k-1);
    x=a+(2*i-1)*h2;
    fx=sum((log(1+x))./x);
    T2=T1/2+fx*h2 ;
    S2=T2+(T2-T1)/3;
    if(k<3)
        if k==2
            C2=S2+(S2-S1)/15;
        end
    else
        C2=S2+(S2-S1)/15;
        R2=C2+(C2-C1)/63;
        if abs(R2-R1)<eps
            break;
        end
        R1=R2;
    end
    T1=T2;S1=S2;C1=C2;
end
fprintf('rombegr所求积分I=%4.6f\n',R2);
 
%三点高斯-勒让德积分公式
GaussP=[-0.7745967 0 0.7745967];                            %高斯点
GaussA=[0.5555556 0.8888889 0.5555556];                     %高斯系数
h = 0.1;                                                    %剖分步长
x = 0:h:1;                                                  %区间[0,1]
f=zeros(1,6);
for i=1:length(x)-1
    points = h/2*GaussP + (x(i+1)+x(i))/2;                  %区间变换
    f(i) = 0;
    for k=1:3
        f(i) = f(i) + h/2*(log(points(k)+1)*(points(k)^(-1))*GaussA(k));
    end
end
fprintf('三点高斯-勒让德所求积分I=%4.6f\n',sum(f));