clc;
m = 3;
t = 50;
C1 = 0;
C2 = 0;
C3 = 0;
CBest = 100;
alpha = 1; %alpha
beta = 2; %beta
rou = 0.5; %rou
t0 = 0.3;
W = [-1 3 1 2;3 -1 5 4;1 5 -1 2;2 4 2 -1];%不存在的距离用-1表示
D = [-1 3 1 2;3 -1 5 4;1 5 -1 2;2 4 2 -1];
T = [-1 0.3 0.3 0.3;0.3 -1 0.3 0.3;0.3 0.3 -1 0.3;0.3 0.3 0.3 -1];%信息素初始化
eta = [0 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0];
for i = 1:4
    for j = 1:4
       eta(i,j) = 1/D(i,j);
    end
end

xlabel = zeros(t);
ylabel = zeros(t);
for l = 1:t
        %蚂蚁m1
        r1 = rand();%随机选择出发城市
        if r1 < 0.25
            m1_has_vi = [0 1 1 1];%依次为A、B、C、D四个城市
        end
        if (r1 >= 0.25) && (r1 < 0.5)
            m1_has_vi = [1 0 1 1];
        end
        if (r1 >= 0.5) && (r1 < 0.75)
            m1_has_vi = [1 1 0 1];
        end
        if (r1 >= 0.75) && (r1 < 1)
            m1_has_vi = [1 1 1 0];
        end
        m1_path = [0 0 0 0 0];%m1路径,A、B、C、D四个城市分别用1,2,3,4表示,去过的为0，没去过的为1
        I11 = 0;
        J11 = [0 0 0];
        countJ11 = 1;
        for i = 1:4
            if m1_has_vi(i) == 0
                I11 = i;
            end
            if m1_has_vi(i) == 1
                J11(countJ11) = i;
                countJ11 = countJ11 + 1;
            end
        end
        p1 = (T(I11,J11(1))^alpha) * (eta(I11,J11(1))^beta);
        p2 = (T(I11,J11(2))^alpha) * (eta(I11,J11(2))^beta);
        p3 = (T(I11,J11(3))^alpha) * (eta(I11,J11(3))^beta);
        p = p1 + p2 + p3;
        p1 = p1/p;
        p2 = p2/p;
        p3 = p3/p;

        q = rand();
        I12 = 0;
        J12 = [0 0];
        countJ12 = 1;
        if q < p1
            m1_has_vi(J11(1)) = 0;
            I12 = J11(1);
        end
        if (q > p1) && (q < p1 + p2)
            m1_has_vi(J11(2)) = 0;
            I12 = J11(2);
        end
        if (q > p1) && (q > p1 + p2) && (q < p1 + p2 + p3)
            m1_has_vi(J11(3)) = 0;
            I12 = J11(3);
        end

        %寻找没去过的城市
        for i = 1:4
            if m1_has_vi(i) == 1
                J12(countJ12) = i;
                countJ12 = countJ12 + 1;
            end
        end

        p1 = (T(I12,J12(1))^alpha) * (eta(I12,J12(1))^beta);
        p2 = (T(I12,J12(2))^alpha) * (eta(I12,J12(2))^beta);
        p = p1 + p2;
        p1 = p1/p;
        p2 = p2/p;

        I13 = 0;
        J13 = 0;
        q = rand();
        if q < p1
            m1_has_vi(J12(1)) = 0;
            I13 = J12(1);
        end
        if (q > p1) && (q < p1 + p2)
            m1_has_vi(J12(2)) = 0;
            I13 = J12(2);
        end

        I14 = 0;
        for i = 1:4
            if m1_has_vi(i) == 1
                I14 = i;
            end
        end

        m1_path = [I11,I12,I13,I14,I11];
        C1 = D(I11,I12) + D(I12,I13) + D(I13,I14) + D(I14,I11);

        
        %蚂蚁m2
        r2 = rand();%随机选择出发城市
        if r2 < 0.25
            m2_has_vi = [0 1 1 1];%依次为A、B、C、D四个城市
        end
        if (r2 >= 0.25) && (r2 < 0.5)
            m2_has_vi = [1 0 1 1];
        end
        if (r2 >= 0.5) && (r2 < 0.75)
            m2_has_vi = [1 1 0 1];
        end
        if (r2 >= 0.75) && (r2 < 1)
            m2_has_vi = [1 1 1 0];
        end
        m2_path = [0 0 0 0 0];%m1路径,A、B、C、D四个城市分别用1,2,3,4表示,去过的为0，没去过的为1
        I21 = 0;
        J21 = [0 0 0];
        countJ21 = 1;
        for i = 1:4
            if m2_has_vi(i) == 0
                I21 = i;
            end
            if m2_has_vi(i) == 1
                J21(countJ21) = i;
                countJ21 = countJ21 + 1;
            end
        end
        p1 = (T(I21,J21(1))^alpha) * (eta(I21,J21(1))^beta);
        p2 = (T(I21,J21(2))^alpha) * (eta(I21,J21(2))^beta);
        p3 = (T(I21,J21(3))^alpha) * (eta(I21,J21(3))^beta);
        p = p1 + p2 + p3;
        p1 = p1/p;
        p2 = p2/p;
        p3 = p3/p;

        q = rand();
        I22 = 0;
        J22 = [0 0];
        countJ22 = 1;
        if q < p1
            m2_has_vi(J21(1)) = 0;
            I22 = J21(1);
        end
        if (q > p1) && (q < p1 + p2)
            m2_has_vi(J21(2)) = 0;
            I22 = J21(2);
        end
        if (q > p1) && (q > p1 + p2) && (q < p1 + p2 + p3)
            m2_has_vi(J21(3)) = 0;
            I22 = J21(3);
        end

        %寻找没去过的城市
        for i = 1:4
            if m2_has_vi(i) == 1
                J22(countJ22) = i;
                countJ22 = countJ22 + 1;
            end
        end

        p1 = (T(I22,J22(1))^alpha) * (eta(I22,J22(1))^beta);
        p2 = (T(I22,J22(2))^alpha) * (eta(I22,J22(2))^beta);
        p = p1 + p2;
        p1 = p1/p;
        p2 = p2/p;

        I23 = 0;
        J23 = 0;
        q = rand();
        if q < p1
            m1_has_vi(J22(1)) = 0;
            I23 = J22(1);
        end
        if (q > p1) && (q < p1 + p2)
            m2_has_vi(J22(2)) = 0;
            I23 = J22(2);
        end

        I24 = 0;
        for i = 1:4
            if m2_has_vi(i) == 1
                I24 = i;
            end
        end

        m2_path = [I21,I22,I23,I24,I21];
        C2 = D(I21,I22) + D(I22,I23) + D(I23,I24) + D(I24,I21);

        
        %蚂蚁m3
        r3 = rand();%随机选择出发城市
        if r3 < 0.25
            m3_has_vi = [0 1 1 1];%依次为A、B、C、D四个城市
        end
        if (r3 >= 0.25) && (r3 < 0.5)
            m3_has_vi = [1 0 1 1];
        end
        if (r3 >= 0.5) && (r3 < 0.75)
            m3_has_vi = [1 1 0 1];
        end
        if (r3 >= 0.75) && (r3 < 1)
            m3_has_vi = [1 1 1 0];
        end
        m3_path = [0 0 0 0 0];%m1路径,A、B、C、D四个城市分别用1,2,3,4表示,去过的为0，没去过的为1
        I31 = 0;
        J31 = [0 0 0];
        countJ31 = 1;
        for i = 1:4
            if m3_has_vi(i) == 0
                I31 = i;
            end
            if m3_has_vi(i) == 1
                J31(countJ31) = i;
                countJ31 = countJ31 + 1;
            end
        end
        p1 = (T(I31,J31(1))^alpha) * (eta(I31,J31(1))^beta);
        p2 = (T(I31,J31(2))^alpha) * (eta(I31,J31(2))^beta);
        p3 = (T(I31,J31(3))^alpha) * (eta(I31,J31(3))^beta);
        p = p1 + p2 + p3;
        p1 = p1/p;
        p2 = p2/p;
        p3 = p3/p;

        q = rand();
        I32 = 0;
        J32 = [0 0];
        countJ32 = 1;
        if q < p1
            m3_has_vi(J31(1)) = 0;
            I32 = J31(1);
        end
        if (q > p1) && (q < p1 + p2)
            m3_has_vi(J31(2)) = 0;
            I32 = J31(2);
        end
        if (q > p1) && (q > p1 + p2) && (q < p1 + p2 + p3)
            m3_has_vi(J31(3)) = 0;
            I32 = J31(3);
        end

        %寻找没去过的城市
        for i = 1:4
            if m3_has_vi(i) == 1
                J32(countJ32) = i;
                countJ32 = countJ32 + 1;
            end
        end

        p1 = (T(I32,J32(1))^alpha) * (eta(I32,J32(1))^beta);
        p2 = (T(I32,J32(2))^alpha) * (eta(I32,J32(2))^beta);
        p = p1 + p2;
        p1 = p1/p;
        p2 = p2/p;

        I33 = 0;
        J33 = 0;
        q = rand();
        if q < p1
            m3_has_vi(J32(1)) = 0;
            I33 = J32(1);
        end
        if (q > p1) && (q < p1 + p2)
            m3_has_vi(J32(2)) = 0;
            I33 = J32(2);
        end

        I34 = 0;
        for i = 1:4
            if m3_has_vi(i) == 1
                I34 = i;
            end
        end

        m3_path = [I31,I32,I33,I34,I31];
        C3 = D(I31,I32) + D(I32,I33) + D(I33,I34) + D(I34,I31);

        %更新信息素,I为路径两端序号
        %第一只蚂蚁留下的信息素
        T(I11,I12) = (1 - rou)*T(I11,I12) + 1/C1;
        T(I12,I13) = (1 - rou)*T(I12,I13) + 1/C1;
        T(I13,I14) = (1 - rou)*T(I13,I14) + 1/C1;
        T(I14,I11) = (1 - rou)*T(I14,I11) + 1/C1;
        %第二只蚂蚁留下的信息素
        T(I21,I22) = (1 - rou)*T(I21,I22) + 1/C2;
        T(I22,I23) = (1 - rou)*T(I22,I23) + 1/C2;
        T(I23,I24) = (1 - rou)*T(I23,I24) + 1/C2;
        T(I24,I21) = (1 - rou)*T(I24,I21) + 1/C2;
        %第三只蚂蚁留下的信息素
        T(I31,I32) = (1 - rou)*T(I31,I32) + 1/C3;
        T(I32,I33) = (1 - rou)*T(I32,I33) + 1/C3;
        T(I33,I34) = (1 - rou)*T(I33,I34) + 1/C3;
        T(I34,I31) = (1 - rou)*T(I34,I31) + 1/C3;
        
        if C1 < CBest
            CBest = C1;
        end
        if C2 < CBest
            CBest = C2;
        end
        if C3 < CBest
            CBest = C3;
        end
   xlabel(l) = l;
   ylabel(l) = CBest;
end
disp(CBest);
plot(xlabel,ylabel)





