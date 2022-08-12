clear;
%设置权重和偏置，没有值的设为0
W=[0 0 0 0.2 -0.3 0;0 0 0 0.4 0.1 0;0 0 0 -0.5 0.2 0;0 0 0 0 0 -0.3;0 0 0 0 0 -0.2];
s=[0 0 0 0 0 0];
O=[1 0 1 0 0 0];
bias=[0 0 0 -0.4 0.2 0.1];
E=[0 0 0 0 0 0];
l=0.9;%set learning percent
t=2000;%迭代次数
X=[1 0 1];%样本
T=1;%预期值
xlabel=ones(1,t);
ylabel=zeros(1,t);
for time=1:t
%for each unit j in the hidden and output layer
for j=4:5
    for i=1:3
        s(1,j)=s(1,j)+W(i,j)*X(1,i);
    end
    O(1,j)=1/(1+exp(-(s(1,j)+bias(1,j))));
end
for i=4:5
    s(1,6)=s(1,6)+W(i,6)*O(1,i);
end
O(1,6)=1/(1+exp(-(s(1,6)+bias(1,6))));
disp(time);
disp(O(1,6));
ylabel(1,time) = O(1,6);


%calculate the error Ej
%output layer
E(1,6)=O(1,6)*(1-O(1,6))*(T-O(1,6));
%hidden layer
for j=4:5
    E(1,j)=O(1,j)*(1-O(1,j))*W(j,6)*E(1,6);
end

%adjust the network parameters
for i=1:5
    for j=1:6
        W(i,j)=W(i,j)+l*E(1,j)*O(1,j);
    end
end

for j=1:6
    bias(1,j)=bias(1,j)+l*E(1,j);
end
xlabel(1,time) = time;
end
plot(xlabel,ylabel);


        