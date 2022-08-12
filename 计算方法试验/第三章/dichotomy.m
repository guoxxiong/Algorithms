k = 0;
N = 2000;
tol = 10^-4;
a = 0.1; b = 1;
for k = 1:N
    p = (a+b) / 2;
    if ((f1(p) == 0) || ((b-a) / 2) < tol)
        break
    end
    if (f1(a)*f1(p) < 0)
        b = p;
    else
        a = p;
    end
end
disp(k);disp(p)

