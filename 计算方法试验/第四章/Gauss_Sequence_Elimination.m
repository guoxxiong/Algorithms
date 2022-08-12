%高斯顺序消元法
%input
A = [10,-1,-1,4.4,-3;10,-1,-1,2.4,3;1,1,-2,4.6,7.8;-2,-1,5,3,3.6;10,-1,-1,3.3,1.8];
b = [6.2;6.2;8.5;3.2;6.2];
B = [A,b];
X = [0;0;0;0;0];
n = 5;

for k = 1:(n-1)
    if B(k,k) == 0
        disp(B(k,k))
        disp('Gauss消元法失败');
        return
    end
    for i = (k+1):n
        m = B(i,k)/B(k,k);
        B(i,(k+1):n) = B(i,(k+1):n) - m*B(k,(k+1):n);
    end
end

X(n) = B(n,n+1)/B(n,n);
for i = (n-1):-1:1
    X(i) = (B(i,n+1) - B(i,(i+1):n)*X((i+1):n))/B(i,i);
end
disp(B);disp(X)

        