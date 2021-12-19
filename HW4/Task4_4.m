% m = 2, k = 20
m = 2;
k = 20;

% Задаим сетку
[x, y] = meshgrid(linspace(-3,3,101));

% Зададим значения eps
eps1 = 0;
eps2 = (2*k + m/2)^(-1);
eps3 = -(2*k + m/2)^(-1);

% Зададим производные при eps1, eps2, eps3
dx1 = y - x.*(eps1*x.^2 + y.^2 - k);
dy1 = -eps1*x - y.*(eps1*x.^2 + y.^2 - k);

dx2 = y - x.*(eps2*x.^2 + y.^2 - k);
dy2 = -eps2*x - y.*(eps2*x.^2 + y.^2 - k);

dx3 = y - x.*(eps3*x.^2 + y.^2 - k);
dy3 = -eps3*x - y.*(eps3*x.^2 + y.^2 - k);

% Строим фазовые портреты
figure(1);
streamslice(x, y, dx1, dy1);
legend("eps = 0");

figure(2);
streamslice(x, y, dx2, dy2);
legend("eps = (2k + m/2)^{-1}");

figure(3);
streamslice(x, y, dx3, dy3);
legend("eps = -(2k + m/2)^{-1}");
