%init paremeters
a = [13.3, -4 , -1, 3.5, -3.8; 3.4, 9, -3, 4.4, 2.3; 4.1, 1, 7, 2.7, 5.9; 2.5, -2.4, 1, 13, 5.6; 1.5, -1, -3, 4.3, 14.9];
b = [5.8; 4.3; 2.6; 3.8; 4.2];
A = [a b]; %增广矩阵
X0 = zeros(5, 1);
X = zeros(5, 1); %初始向量
eop = 10^-5; %误差限
N = 50; %最大迭代次数
k = 0;

%Gauss_Seidel
n = length(X); %得到方程组的维数
while k <= N
    for i = 1:n
        X(i) = (b(i) - a(i, :) * X) / a(i, i) + X(i);
    end
    if (norm(X - X0, 'inf') / norm(X0, 'inf')) < eop
        disp(X);
        disp(k);
        return;
    end
    k = k + 1;
    X0 = X;
end
    

