function [Eval,best,C]=calcuEval(pop,size)
Eval=[0 0 0 0 0];
best=0;
C=1;
for i=1:size
    Eval(i)=1/(pop(i,1)*pop(i,1)+pop(i,2)*pop(i,2)+pop(i,3)*pop(i,3)+pop(i,4)*pop(i,4)+1);
end
best=Eval(1);
for i=2:size
    if best<Eval(i)
        best=Eval(i);
        C=i;
    end
end
end