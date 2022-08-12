p0 = 0.1;
p1 = 1;
N = 2000;
tol = 10^-4;
for k = 1:N
    p = p1 - f1(p1)*(p1 - p0) / (f1(p1) - f1(p0));
    if abs(p - p1) < tol
        break
    else
        p0 = p1;
        p1 = p;
    end
end
disp(p1);disp(k)