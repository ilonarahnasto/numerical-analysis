
clear all, close all;

% plotting ellipse x^2/25+y^2=1

a = 5;
b = 1;
x0 = 0;
y0 = 0;
t = -5:0.1:5;
xt = x0+a*cos(t);
yt = y0+b*sin(t);
plot(xt,yt, 'Color', [0 0.4470 0.7410]);
xlabel('x');
ylabel('y');
axis equal;
axis on;
hold on;

% calculating area with expected value of random points inside ellipse

N = 1000;
points = 0;
X = linspace(0, 0, N);

for i = 1:N
    x = -5 + 10*rand;
    y = -1 + 2*rand;
    plot(x,y, 'Color', [0.3010 0.7450 0.9330], 'Marker', '.')
    p = (x^2)/25 + y^2;
    if p <= 1
        points = points+1;
        X(i) = 1;
    else 
        X(i) = 0;
    end
end

E = points/N;
V = var(X);
area = E * 2 * 10;


