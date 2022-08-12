p0 = 0.1;
p1 = 1;
N = 2000;
tol = 10^-4;
e = 10^-8;
namda = 1;
for k = 1:N
    p1 = p0 - namda * f1(p0) / df1(p0);
    while (abs(f1(p1)) >= abs(f1(p0))) && (namda > e)
        namda = namda / 2;
        p1 = p0 - namda * f1(p0) / df1(p0);
    end
    if abs(p1 - p0) < tol
        break;
    else
        p0 = p1;
    end
end
disp(p1);disp(k);disp(namda)