%列主元消元法
%input
A = [10,-1,-1,4.4,-3;10,-1,-1,2.4,3;1,1,-2,4.6,7.8;-2,-1,5,3,3.6;10,-1,-1,3.3,1.8];
b = [6.2;6.2;8.5;3.2;6.2];
B = [A,b];
X = [0;0;0;0;0];
n = 5;
p = 0;
S = zeros(n,1);
AS = zeros(n,1);
as = 0;
%初始化S
for i = 1:n-1
    a = A[]
    S(i) = max(abs(B(i:n,i:n)));
end

% for k = 1:(n-1)
%     for i = k:n
%         AS(i) = abs(B(i,1))/S(i);
%     end 
%     %找出满足条件的a/s及行标
%     [as,m] = max(AS(k+1:n));
%     disp([as,m])
%     %交换
%     C(1:n+1) = B(k,1:n+1);
%     B(k,1:n+1) = B(k+m,1:n+1);
%     B(k+m,1:n+1) = C(1:n+1);
%     %交换s
%     s = S(k);
%     S(k) = S(k+m);
%     S(k+m) = s;
%     %消元
%     for i = (k+1):n
%         mn = B(i,k)/B(k,k);
%         B(i,1:n+1) = B(i,1:n+1) - mn*B(k,1:n+1);
%     end
% end
% disp(B)
% 
% X(n) = B(n,n+1)/B(n,n);
% for i = (n-1):-1:1
%     X(i) = (B(i,n+1) - B(i,(i+1):n)*X((i+1):n))/B(i,i);
% end
% disp(X)


        