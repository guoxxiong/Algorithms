function y=minerror(x)
y1=normpdf(x,-2,0.5);               %��̬�ֲ�����
y2=normpdf(x,2,2);                  %��̬�ֲ�����
pw1=0.9;                            %����״̬��pֵ
pw2=0.1;                            %�쳣״̬��pֵ         
p1=y1*pw1/(y1*pw1+y2*pw2);          %�������
p2=y2*pw2/(y1*pw1+y2*pw2);          %�������
plot(x,p1,'r*'),hold on             %��һ��ĺ������
plot(x,p2,'+'),hold on,grid on      %�ڶ���ĺ������
legend('��һ��ĺ������','�ڶ���ĺ������')
if p1>p2                            %�ж��Ƿ�Ϊ����ϸ��
   x,disp('��ϸ��Ϊ����ϸ��')
   y=2;
end
if p1<p2
    x,disp('Ϊ������ϸ��')
   y=1;
end
if p1==p2
   x,disp('�жϳ���')
   y=0;   
end