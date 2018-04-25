fs= 1000;
T=3;
t=0:dt:T;

x=sin(2*pi*1*t)+0.3*sin(2*pi*100*t);

subplot(2,1,1)
plot(t,x)

subplot(2,1,2)
xx = BRUDNOPISOWY(x);

plot(t,xx)