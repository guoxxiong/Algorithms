clc;
global pop;
global size;
global length;
global Eval;
global best;
global C;
pc = 0.88; %交叉概率
mut = 0.1;  %变异概率
t=200000;
size = 5;
length = 4;
pop=init(size,length);
bestEval = 0;
xlabel = ones(1,t);
ylabel = zeros(1,t);
for step=1:t
[Eval,best,C]=calcuEval(pop,size);
if bestEval < best
    bestEval = best;
end
disp(step);
%disp(bestEval);
%计算适应度总和
sEval=0;
for i=1:size
    sEval=sEval+Eval(i);
end
%计算适应度比例
div=zeros(1,size);
for i=1:size
    div(i)=Eval(i)/sEval;
end


%轮盘赌选择
selectRand = rand(1,size);
select = ones(1,size);
for i=1:size
    startRand = 0;
    for j=1:size
        startRand = startRand + div(1,j);
        if selectRand(1,i)<=startRand
            select(1,i) = j;
            break;
        end
    end
end

%更新经轮盘赌选择后的基因
for i=1:size
    pop(i,:) = pop(select(1,i),:);
end


%交叉
crossRand = rand(1,size);
selectCross = zeros(1,size);
cnt = 0;
for i=1:size
    if crossRand(1,i) < pc
        cnt = cnt+1;
        selectCross(1,cnt)=i;
    end
end
cross=0;%用来临时存储待交换的基因
pop1=pop;
if cnt == 2
   cr = floor(4*rand()+1);%随机选择要交叉的基因位
   cross = pop(select(1,selectCross(1,1)),cr);
   pop(select(1,selectCross(1,1)),cr) = pop(select(1,selectCross(1,2)),cr);
   pop(select(1,selectCross(1,2)),cr) = cross;
end

if cnt == 3
   cr = floor(4*rand()+1);%随机选择要交叉的基因位
   cross = pop(select(1,selectCross(1,1)),cr);
   pop(select(1,selectCross(1,1)),cr) = pop(select(1,selectCross(1,2)),cr);
   pop(select(1,selectCross(1,2)),cr) = cross;
   c3 = floor(2*rand()+1);%随机选择第三个个体和谁交叉
   cr = floor(4*rand()+1);
   cross = pop1(select(1,selectCross(1,3)),cr);
   pop(select(1,selectCross(1,3)),cr) = pop1(select(1,selectCross(1,c3)),cr);
   pop(select(1,selectCross(1,c3)),cr) = cross;
end

if cnt == 4
   cr = floor(4*rand()+1);%随机选择要交叉的基因位
   cross = pop(select(1,selectCross(1,1)),cr);
   pop(select(1,selectCross(1,1)),cr) = pop(select(1,selectCross(1,2)),cr);
   pop(select(1,selectCross(1,2)),cr) = cross;
   cr = floor(4*rand()+1);
   cross = pop(select(1,selectCross(1,3)),cr);
   pop(select(1,selectCross(1,3)),cr) = pop(select(1,selectCross(1,4)),cr);
   pop(select(1,selectCross(1,4)),cr) = cross;
end

if cnt == 5
   cr = floor(4*rand()+1);%随机选择要交叉的基因位
   cross = pop(select(1,selectCross(1,1)),cr);
   pop(select(1,selectCross(1,1)),cr) = pop(select(1,selectCross(1,2)),cr);
   pop(select(1,selectCross(1,2)),cr) = cross;
   cr = floor(4*rand()+1);
   cross = pop(select(1,selectCross(1,3)),cr);
   pop(select(1,selectCross(1,3)),cr) = pop(select(1,selectCross(1,4)),cr);
   pop(select(1,selectCross(1,4)),cr) = cross;
   c5 = floor(4*rand()+1);%随机选择第五个个体和谁交叉
   cr = floor(4*rand()+1);
   cross = pop1(select(1,selectCross(1,5)),cr);
   pop(select(1,selectCross(1,5)),cr) = pop1(select(1,selectCross(1,c5)),cr);
   pop(select(1,selectCross(1,c5)),cr) = cross;
end

pop2 = pop;

%变异
for i=1:size
    for j=1:length
        if rand()<mut
            pop(i,j) = rand()*10-5;
        end
    end
end
xlabel(1,step) = step;
ylabel(1,step) = bestEval; 
end

plot(xlabel,ylabel);

        


    


    
    
        

           
        