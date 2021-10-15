% Исходная функция
P = @(z) 1/(z.^3 + (1i.*20).*z.^2 - 2.*z + 1);
% Зададим диапазон значений для мнимой и вещественной части
x = -1:0.1:1;
y = -1:0.1:1;
% Создадим матрицу значений мнимой и веществвенной части
[X,Y] = meshgrid(x,y);
% Подставим в исходную функцию вместо z - x+iy
% Q = ((X.^3 - 3*X.*Y.^2 - 40*X.*Y - 2*X + 1) - 1i*(3*X.^2 - Y.^3 + 20*X.^2 - 20*Y.^2 - 2*Y))/((X.^3 - 3*X.*Y.^2 - 40*X.*Y - 2*X + 1).^2 + (3*X.^2 - Y.^3 + 20*X.^2 - 20*Y.^2 - 2*Y));
Q = 1./((X.^3 - 3*X.*Y.^2 - 40*X.*Y - 2*X + 1) + 1i*(3*X.^2 - Y.^3 + 20*X.^2 - 20*Y.^2 - 2*Y));
figure(1)
% Построим изолинии модуля функции
contour(X,Y,abs(Q),[0 1], 'ShowText','on','LineStyle', '-.', 'LineWidth', 1.6);
hold on;
% Построим изолинии аргумента функции
contour(X,Y,angle(Q),[0 1], 'ShowText','on', 'LineWidth', 1.6);
hold off;
legend('Abs(z)', 'Angle(z)')
xlabel('x');
ylabel('y');
title('$f = 1/(z^3 + (20i)\ z^2 - 2\ z + 1)$', 'Interpreter', 'latex');


