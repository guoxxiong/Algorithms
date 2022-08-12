%列主元消元法
%input
A = [10,-1,-1,4.4,-3;10,-1,-1,2.4,3;1,1,-2,4.6,7.8;-2,-1,5,3,3.6;10,-1,-1,3.3,1.8];
b = [6.2;6.2;8.5;3.2;6.2];
B = [A,b];
disp(B)
X = [0;0;0;0;0];
n = 5;
%d为m的分母
d = 0;
p = 0;

for k = 1:(n-1)
    [m,p] = max(abs(B(k:n,k)));
    if p+k-1 > k
        C(k:n+1) = B(k,k:n+1);
        B(k,k:n+1) = B(p+k-1,k:n+1);
        B(p+k-1,k:n+1) = C(k:n+1);
    end
    for i = (k+1):n
        m = B(i,k)/B(k,k);
        B(i,k:n+1) = B(i,k:n+1) - m*B(k,k:n+1);
    end
    disp('hahah'),disp(k),disp(B)
end

X(n) = B(n,n+1)/B(n,n);
for i = (n-1):-1:1
    X(i) = (B(i,n+1) - B(i,(i+1):n)*X((i+1):n))/B(i,i);
end
disp(B);disp(X)

        