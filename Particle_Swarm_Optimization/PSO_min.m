clc;
%init
N = 3;%population
t = 10000;%roundabount times
w = 0.5;%weight series number
c1 = 2;
c2 = 2;
xlabel = zeros(t);
ylabel = zeros(t);
pBest1 = [0;0];
pBest2 = [0;0];
pBest3 = [0;0];
gBest = [0;0];
fBest = 0;
V1 = [rand()*20-10;rand()*20-10];
X1 = [rand()*20-10;rand()*20-10];
V2 = [rand()*20-10;rand()*20-10];
X2 = [rand()*20-10;rand()*20-10];
V3 = [rand()*20-10;rand()*20-10];
X3 = [rand()*20-10;rand()*20-10];

%calculate the fitting and select the best gene
F1 = X1(1,1)*X1(1,1) + X1(2,1)*X1(2,1);
F2 = X2(1,1)*X2(1,1) + X2(2,1)*X2(2,1);
F3 = X3(1,1)*X3(1,1) + X3(2,1)*X3(2,1);
pBest1 = X1;
pBest2 = X2;
pBest3 = X3;
GBest = X1;
if F1 > F2
    GBest = X2;
end
if (F2 > F3)||(F1 > F3)
    GBest = X3;
end
for i = 1:t
    %update the position and legeal
    V1 = w*V1 + c1*rand()*(pBest1 - X1) + c2*rand()*(GBest - X1);
    if ((X1(1,1) + V1(1,1)) > -10)&&((X1(1,1) + V1(1,1)) < 10)&&((X1(2,1) + V1(2,1)) > -10)&&((X1(2,1) + V1(2,1)) < 10)
        X1 = X1 + V1;
    end
    V2 = w*V2 + c1*rand()*(pBest2 - X2) + c2*rand()*(GBest - X2);
    if ((X2(1,1) + V2(1,1)) > -10)&&((X2(1,1) + V2(1,1)) < 10)&&((X2(2,1) + V2(2,1)) > -10)&&((X2(2,1) + V2(2,1)) < 10)
        X2 = X2 + V2;
    end
    V3 = w*V3 + c1*rand()*(pBest3 - X3) + c2*rand()*(GBest - X3);
    if ((X3(1,1) + V3(1,1)) > -10)&&((X3(1,1) + V3(1,1)) < 10)&&((X3(2,1) + V3(2,1)) > -10)&&((X3(2,1) + V3(2,1)) < 10)
        X3 = X3 + V3;
    end

    f1 = X1(1,1)*X1(1,1) + X1(2,1)*X1(2,1);
    if f1 < F1
        pBest1 = X1;
        F1 = f1;
    end
    f2 = X2(1,1)*X2(1,1) + X2(2,1)*X2(2,1);
    if f2 < F2
        pBest2 = X2;
        F2 = f2;
    end
    f3 = X3(1,1)*X3(1,1) + X3(2,1)*X3(2,1);
    if f3 < F3
        pBest3 = X3;
        F3 = f3;
    end

    gBest = pBest1;
    if F2 < F1
        gBest = pBest2;
    end
    if (F3 < F2)||(F3 < F1)
        gBest = pBest3;
    end

    if (gBest(1,1)*gBest(1,1) + gBest(2,1)*gBest(2,1)) < (GBest(1,1)*GBest(1,1) + GBest(2,1)*GBest(2,1))
        GBest = gBest;
        fBest = GBest(1,1)*GBest(1,1) + GBest(2,1)*GBest(2,1);
        disp(fBest);
    end
    xlabel(i) = i;
    ylabel(i) = fBest;
end
plot(xlabel,ylabel);












