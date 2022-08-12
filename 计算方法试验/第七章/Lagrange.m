%input
a = -1; b = 1; %定义区间
n1 = 5; %定义插值次数
n2 = 10;
% X = zeros(n1+1, 1);
% Y = zeros(n1+1, 1);
% 
% %求取n次插值点
% for i = 0:n1
%     X(i + 1) = a + (b - a) * i / n1;
% end
% 
% for i = 0:n1
%     Y(i + 1) = f1(X(i + 1));
% end
% 
% for x_ = -1:0.02:1
%     y_ = 0;
%     for k = 1:n1+1
%         t = 1;
%         for i = 1:n1+1
%             if i ~= k
%                 t = t * (x_ - X(i)) / (X(k) - X(i));
%             end
%         end
%             y_ = y_ + t * Y(k);
%     end
%     plot(x_, y_, 'r:*', x_, f1(x_), 'b:+');
%     hold on;
% end
% 
% hold on;

% X = zeros(n2+1, 1);
% Y = zeros(n2+1, 1);
% for i = 0:n2
%     X(i + 1) = a + (b - a) * i / n2;
% end
% 
% for i = 0:n2
%     Y(i + 1) = f1(X(i + 1));
% end
% 
% for x_ = -1:0.02:1
%     y_ = 0;
%     for k = 1:n2+1
%         t = 1;
%         for i = 1:n2+1
%             if i ~= k
%                 t = t * (x_ - X(i)) / (X(k) - X(i));
%             end
%         end
%             y_ = y_ + t * Y(k);
%     end
%     plot(x_, y_, 'r:o', x_, f1(x_), 'b:+');
%     hold on;
% end

X = zeros(n2+1, 1);
Y = zeros(n2+1, 1);

%Chebyshev插值结点
for i = 0:n2
    X(i + 1) = -cos((i * pi) / 10);
end

for i = 0:n2
    Y(i + 1) = f1(X(i + 1));
end

for x_ = -1:0.02:1
    y_ = 0;
    for k = 1:n2+1
        t = 1;
        for i = 1:n2+1
            if i ~= k
                t = t * (x_ - X(i)) / (X(k) - X(i));
            end
        end
            y_ = y_ + t * Y(k);
    end
    plot(x_, y_, 'r:o', x_, f1(x_), 'b:+');
    hold on;
end
