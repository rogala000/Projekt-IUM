function [y, t1] = calkowanie(x, fs, t)

dt= 1/fs;

y(1)=0;
for i=2:length(t)-1
    y(i) = x(i)*dt + y(i-1);
end
%t1=t(1:length(t)-1);
t1=t;
y(length(y)+1)=y(length(y));
%% Trapezami
%     yt(1)=0;
%     for i=2:length(t)-1
%         yt(i) = ((x(i-1)+x(i))/2)*dt + yt(i-1);
%     end
%     yt(1)=yt(2);
%     yt(length(yt)+1)=yt(length(yt));
%plot(t1,y,'r')
%legend('nasza')
end