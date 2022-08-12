p0 = 0.1;
p1 = 1;
N = 2000;
tol = 10^-4;
for k = 1:N
    p1 = p0 - f1(p0) / df1(p0);
    if abs(p1 - p0) < tol
        break
    else
        p0 = p1;
    end
end
disp(p1);disp(k)
    