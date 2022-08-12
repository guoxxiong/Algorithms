%ÇúÏß1
b0 = 1.0;
b1 = -0.67;
X = [1; 2; 5; 6; 7; 8; 10; 13; 17];
Y = [3.0; 3.7; 3.9; 4.2; 5.7; 6.6; 7.1; 6.7; 4.5];
xmin = min(X);
xmax = max(X);
n = length(X);
a = zeros(n-1, 1);
c = zeros(n-1, 1);
d = zeros(n, 1);

h = diff(X);
D = diff(Y) ./ h;
H = h(1:n-2) + h(2:n-1);
a(1:n-2) = h(1:n-2) ./ H;
a(n-1) = 1;
c(1) = 1;
c(2:n-1) = 1 - a(1:n-2);
d(2:n-1) = 6 * diff(D) ./ H;
d(1) = 6 * (D(1) - b0) / h(1);
d(n) = 6 * (b1 - D(n-1)) / h(n-1);
A = 2 * eye(n);
A = A + diag(a, -1) + diag(c, 1);
M = A \ d;

for x_ = xmin:0.05:xmax
    for i = 2:n
        if X(i) - x_ >= 0
            y_ = M(i-1) * (X(i) - x_) ^ 3 / (6 * h(i-1)) + M(i) * (x_ - X(i-1)) ^ 3 / (6 * h(i-1)) + (Y(i-1) - M(i-1) * h(i-1) ^ 2 /6) * (X(i) - x_) / h(i-1) + (Y(i) - M(i) * h(i-1) ^ 2 / 6) * (x_ - X(i-1)) / h(i-1);
            break
        end
    end
    plot(x_, y_, 'b:*')
    hold on;
end
hold on;        

%ÇúÏß2
b0 = 3.0;
b1 = -4.0;
X2 = [17; 20; 23; 24; 25; 27; 27.7];
Y2 = [4.5; 7.0; 6.1; 5.6; 5.8; 5.2; 4.1];
xmin = min(X2);
xmax = max(X2);
n = length(X2);
a = zeros(n-1, 1);
c = zeros(n-1, 1);
d = zeros(n, 1);

h = diff(X2);
D = diff(Y2) ./ h;
H = h(1:n-2) + h(2:n-1);
a(1:n-2) = h(1:n-2) ./ H;
a(n-1) = 1;
c(1) = 1;
c(2:n-1) = 1 - a(1:n-2);
d(2:n-1) = 6 * diff(D) ./ H;
d(1) = 6 * (D(1) - b0) / h(1);
d(n) = 6 * (b1 - D(n-1)) / h(n-1);
A = 2 * eye(n);
A = A + diag(a, -1) + diag(c, 1);
M = A \ d;

for x_ = xmin:0.05:xmax
    for i = 2:n
        if X2(i) - x_ >= 0
            y_ = M(i-1) * (X2(i) - x_) ^ 3 / (6 * h(i-1)) + M(i) * (x_ - X2(i-1)) ^ 3 / (6 * h(i-1)) + (Y2(i-1) - M(i-1) * h(i-1) ^ 2 /6) * (X2(i) - x_) / h(i-1) + (Y2(i) - M(i) * h(i-1) ^ 2 / 6) * (x_ - X2(i-1)) / h(i-1);
            break
        end
    end
    plot(x_, y_, 'b:*')
    hold on;
end
hold on;    

%ÇúÏß3
b0 = 0.33;
b1 = -1.5;
X3 = [27.7; 28; 29; 30];
Y3 = [4.1; 4.3; 4.1; 3.0];
xmin = min(X3);
xmax = max(X3);
n = length(X3);
a = zeros(n-1, 1);
c = zeros(n-1, 1);
d = zeros(n, 1);

h = diff(X3);
D = diff(Y3) ./ h;
H = h(1:n-2) + h(2:n-1);
a(1:n-2) = h(1:n-2) ./ H;
a(n-1) = 1;
c(1) = 1;
c(2:n-1) = 1 - a(1:n-2);
d(2:n-1) = 6 * diff(D) ./ H;
d(1) = 6 * (D(1) - b0) / h(1);
d(n) = 6 * (b1 - D(n-1)) / h(n-1);
A = 2 * eye(n);
A = A + diag(a, -1) + diag(c, 1);
M = A \ d;

for x_ = xmin:0.05:xmax
    for i = 2:n+1
        if X3(i) - x_ >= 0
            y_ = M(i-1) * (X3(i) - x_) ^ 3 / (6 * h(i-1)) + M(i) * (x_ - X3(i-1)) ^ 3 / (6 * h(i-1)) + (Y3(i-1) - M(i-1) * h(i-1) ^ 2 /6) * (X3(i) - x_) / h(i-1) + (Y3(i) - M(i) * h(i-1) ^ 2 / 6) * (x_ - X3(i-1)) / h(i-1);
            break
        end
    end
    plot(x_, y_, 'b:*')
    hold on;
end
        












