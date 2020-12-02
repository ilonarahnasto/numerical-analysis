clear all, close all;

% Runge-Kutta fourth-order formula modeling a system of differential equations
% dx=-x^3/3+x+a, da=-ex
% x(t) denotes the position of a muscle, a(t) the concentration of chemical
% stimulus

n = 400;
h = 0.7; % step length
t = 0:h:n;
iterations = length(t);
x = linspace(0,0,iterations); % position of the muscle at given time t
a = linspace(0,0,iterations); % concentration at given time t

x(1) = 2;
a(1) = 2/3;
e = 1/100;

% the Runge-Kutta fourth-order formula
for i = 1:(iterations-1)
    x0 = x(i);
    a0 = a(i);
    
    k1 = h*(-(x0^3)/3+x0+a0);
    m1 = h*(-e*x0);
    
    k2 = h*(-((x0+k1/2)^3)/3+x0+k1/2+a0+m1/2);
    m2 = h*(-e*(x0+k1/2));
    
    k3 = h*(-((x0+k2/2)^3)/3+x0+k2/2+a0+m2/2);
    m3 = h*(-e*(x0+k2/2));
    
    k4 = h*(-((x0+k3)^3)/3+x0+k3+a0+m3);
    m4 = h*(-e*(x0+k3));
    
    x(i+1) = x0 + 1/6*(k1+2*k2+2*k3+k4);
    a(i+1) = a0 + 1/6*(m1+2*m2+2*m3+m4);
end

hold on;
plot(t,x);
plot(t,a);

xlabel('Time')
ylabel('Position and concentration')
title('Position of the muscle and concentration of chemical stimulus in time')
legend('x(t), muscle position', '\alpha(t), chemical concentration')
