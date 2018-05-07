function [y, t1] = calkowanie(x, fs, t, int_type)

dt= 1/fs;
t1=t;
if strcmp(int_type, 'radiobutton_rectangles')

y(1)=0;
for i=2:length(t)-1
    y(i) = x(i)*dt + y(i-1);
end
%t1=t(1:length(t)-1);
y(length(y)+1)=y(length(y));

elseif strcmp(int_type, 'radiobutton_trapezes')
% Trapezami

    y(1)=0;
    for i=2:length(t)-1
        y(i) = ((x(i-1)+x(i))/2)*dt + y(i-1);
    end
    y(1)=y(2);
    y(length(y)+1)=y(length(y));
%plot(t1,y,'r')
%legend('nasza')
end
end