
% Plotting my hand with cubic splines

x = [1.2 1.4 1.4 1.4 1.25 1.33 1.55 1.52 1.6 1.68 1.72 1.7 1.77 1.85 1.95 2.05 2.1 2.05 2.05 2.25 2.4 2.41 2.28 2.16 2 1.85 1.65]; 
y = [1 1.7 2 2.5 3.3 3.35 2.7 3.75 3.76 3.02 3.03 3.9 3.95 3 3 3.7 3.65 3 2.3 2.6 2.7 2.6 2.3 1.8 1.55 1.35 0.7];
n = length(x);
t = 0:1:n-1;
tt = 0:.1:n-1;
xx = spline(t,x,tt);
yy = spline(t,y,tt); 
hold on
plot(xx,yy','LineWidth',2), plot(x,y,'o'), grid on
pbaspect([1 1.4 1]) % ratio of the axes