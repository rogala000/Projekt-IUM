function [y, t1] = calkowanie(x, fs, t)

dt= 1/fs;

y(1)=0;
for i=2:length(t)-1
    y(i) = x(i)*dt + y(i-1);
end
t1=t(1:length(t)-1);
%plot(t1,y,'r')
%legend('nasza')
end