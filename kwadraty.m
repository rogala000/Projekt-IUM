function [signal] = kwadraty (signal, t, n)



y= signal;
X = zeros(length(t),n+1);

for i = 0 : n
    X(:,i+1) = t'.^i;
end

%y = X * a
a = (X'*X)^(-1) *X' * y';

trend = zeros(1,length(t));
for i = 1: length(a)
    trend = a(i) .* t.^(i-1) + trend;
end
 
signal = signal - trend;
end