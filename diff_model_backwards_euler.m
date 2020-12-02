clear all, close all;

% Backward euler method modeling a system of differential equations
% dx=-x^3/3+x+a, da=-ex
% x(t) denotes the position of a muscle, a(t) the concentration of chemical
% stimulus

n = 400;
h = 0.1; % step length
t = 0:h:n;
iterations = length(t);
x = linspace(0,0,iterations); % position of the muscle at given time t
a = linspace(0,0,iterations); % concentration at given time t

x(1) = 2; % stabilizes with values between -2...2
a(1) = 0.5; % -0.75..0.75
e = 1/100;

% the Euler backwards formula
for i = 1:(iterations-1)
    x0 = x(i);
    a0 = a(i);
    
    xi = x0+h*(-(x0^3)/3+x0+a0);
    ai = a0+h*(-e*x0);
    
    x(i+1) = x0+h*(-(xi^3)/3+xi+ai);
    a(i+1) = a0+h*(-e*xi);
end

hold on;
plot(t,x);
plot(t,a);

xlabel('Time')
ylabel('Position and concentration')
title('Position of the muscle and concentration of chemical stimulus in time')
legend('x(t), muscle position', '\alpha(t), chemical concentration')

