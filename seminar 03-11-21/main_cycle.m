eps = 0.1;
R = 1;  
phi = linspace(0, 2*pi, 101);

[x, y]= meshgrid(linspace(-2,2,101));
r = sqrt(x.^2+y.^2);
dx = y + eps * x .* (R - r);
dy = -x + eps * y .* (R - r);

figure(3);
streamslice(x, y, dx, dy);
hold on;
plot(R*cos(phi), R*sin(phi), '-r', 'LineWidth', 2);