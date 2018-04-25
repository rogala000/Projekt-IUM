function [y] = rozniczkowanie (x,fs,t, RODZAJ)

dt = 1/fs;


if (RODZAJ == 1)
    %od lewej
    for i=1:length(x)-2
        ylew(i)=x(i)*(-3/(2*dt))+(2/dt*x(i+1))-(1/(2*dt)*x(i+2));
    end
    temp=length(ylew);
    ylew(temp+1)=ylew(temp);
    ylew(temp+2)=ylew(temp);
    
    y = ylew;
elseif (RODZAJ == 2)
    
%centralnie
    ycen(1)=0;
    for i=1:length(x)-2
        ycen(i+1)=(1/(2*dt)*(x(i+2)-x(i)));
    end
    temp=length(ycen);
    ycen(1)=ycen(2);
    ycen(temp+1)=ycen(temp);
    
    y = ycen;
elseif (RODZAJ == 3)
    %od prawej
    ypraw(1)=0;
    ypraw(2)=0;
    for i=1:length(x)-2
        ypraw(i+2)= (1/(2*dt))*x(i)-(2/dt)*x(i+1)+((3/(2*dt))*x(i+2));
    end
    ypraw(1)=ypraw(3);
    ypraw(2)=ypraw(3);
    
    y = ypraw;
end
% normalizuj = 2;
% if normalizuj == 1 
%     ylew=ylew/max(ylew);
%     ypraw=ypraw/max(ypraw);
%     ycen=ycen/max(ycen);
% end
end