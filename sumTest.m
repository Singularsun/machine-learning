clear all
clc
M = 2000;
N = 1000;
s = 10*20/M/N;
x = linspace(0,20,M);
y = linspace(0,10,N);
sum = 0;
for i = 1:M
    for j = 1:N
        if (x(i) >= 5 && y(j) <= 0.5*x(i)) && ((x(i)-5)^2+(y(j)-5)^2-25>=0) && ((x(i)-15)^2+(y(j)-5)^2-25>=0)
            sum = sum + s;
        end
    end
end
sum