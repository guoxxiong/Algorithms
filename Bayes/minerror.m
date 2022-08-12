function y=minerror(x)
y1=normpdf(x,-2,0.5);               %正态分布函数
y2=normpdf(x,2,2);                  %正态分布函数
pw1=0.9;                            %正常状态的p值
pw2=0.1;                            %异常状态的p值         
p1=y1*pw1/(y1*pw1+y2*pw2);          %后验概率
p2=y2*pw2/(y1*pw1+y2*pw2);          %后验概率
plot(x,p1,'r*'),hold on             %第一类的后验概率
plot(x,p2,'+'),hold on,grid on      %第二类的后验概率
legend('第一类的后验概率','第二类的后验概率')
if p1>p2                            %判断是否为正常细胞
   x,disp('此细胞为正常细胞')
   y=2;
end
if p1<p2
    x,disp('为不正常细胞')
   y=1;
end
if p1==p2
   x,disp('判断出错')
   y=0;   
end