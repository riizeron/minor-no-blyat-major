% Исходная функция
F = @(z) exp((2 + 20*1i).*z);
% Создаем диапазоны значений
x = 2:0.1:3;
y = -1:0.1:3;
% Создаем матрицу значений мнимой и вещественной части
[X,Y] = meshgrid(x,y);
% Подставим в исходную функцию вместо z -> x + iy
% Выделим вещественную и мнимую часть функции по формуле разложения
% экспоненты на мнимую и вещественную часть
ReF = exp(2.*X - 20.*Y).*cos(2.*Y+20.*X);
ImF = exp(2.*X - 20.*Y).*sin(2.*Y+20.*X);
figure(1);
contour(X,Y,ReF,[0 1], 'ShowText','on','LineStyle', '-.', 'LineWidth', 1.6);
hold on;
% Строим изолинии функции
contour(X,Y,ImF,[0 1], 'ShowText','on', 'LineWidth', 1.6);
xlabel('x');
ylabel('y');
legend('ReF(z)', 'ImF(z)');
title('$f(z) = exp((2 + 20i)\ z)$', 'Interpreter', 'latex');

% Исходная функция
G = @(z) cos((2 + 20*1i).*z);
% Создаем диапазоны значений
x = -0.5:0.1:0.5;
y = -0.5:0.1:0.5;
% Создаем матрицу значений мнимой и вещественной части
[X,Y] = meshgrid(x,y);
% Подставим в исходную функцию вместо z -> x + iy
% Выделим вещественную и мнимую часть функции по формуле разложения
% косинуса на мнимую и вещественную часть
ReG = cos(2.*X - 20.*Y).*cosh(2.*Y+20.*X);
ImG = -sin(2.*X - 20.*Y).*sinh(2.*Y+20.*X);
figure(2);
% Строим изолинии функции
contour(X,Y,ReG,[0 1], 'ShowText','on', 'LineWidth', 1.6);
hold on;
contour(X,Y,ImG,[0 1], 'ShowText','on','LineStyle', '-.', 'LineWidth', 1.6);

xlabel('x');
ylabel('y');
legend('ReG(z)', 'ImG(z)');
title('$f(z) = cos((2 + 20i)\ z)$', 'Interpreter', 'latex');




