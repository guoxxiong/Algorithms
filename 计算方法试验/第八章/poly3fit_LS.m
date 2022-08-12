%input
X = [0.40 0.55 0.65 0.80 0.90 1.05]';
Y = [0.41075 0.57815 0.69675 0.88811 1.02652 1.25386]';

A(:, 1) = ones(size(X));
A(:, 2) = X;
A(:, 3) = power(X, .2);
A(:, 4) = power(X, .3);

C = A \ Y;
xx = (0:0.01:1);
yy = C(1) * ones(size(xx)) + C(2) * xx + C(3) * power(xx, .2) + C(4) * power(xx, .3);
YY = C(1) * ones(size(X)) + C(2) * X + C(3) * power(X, .2) + C(4) * power(X, .3);
e2 = (power((YY - Y), 2))' * ones(6, 1);
plot(X, Y, '*', xx, yy, '-.');
disp(e2)