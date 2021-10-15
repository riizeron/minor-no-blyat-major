P = @(z) z.^3 + (1i.*20).*z.^2 - 2.*z + 1;
% Зададим диапазон значений для мнимой и вещественной части
x = -1:0.01:1;
y = -1:0.01:1;
% Создадим матрицу значений мнимой и веществвенной части
[X,Y] = meshgrid(x,y);
% Подставим в исходную функцию вместо z - x+iy
% Выделим в выражении мнимую и вещественную часть
ReP = X.^3 - 3.*X.*Y.^2 - 40.*X.*Y - 2.*X + 1; 
ImP = 3.*X.^2.*Y - Y.^3 + 20.*X.^2 - 20.*Y.^2 - 2.*Y;

% Два корня из трех
figure(1)
% Построим изолинии вещественной части
contour(X,Y,ReP,[0 1], 'ShowText','on','LineStyle', '-.', 'LineWidth', 1.6);
hold on;
% Построим изолинии мнимой части
contour(X,Y,ImP,[0 1], 'ShowText','on', 'LineWidth', 1.6);
hold off;
legend('Re(z)', 'Im(z)')
xlabel('x');
ylabel('y');
title('$f = z^3 + (20i)\ z^2 - 2\ z + 1$', 'Interpreter', 'latex');

% Третий корень
figure(2)
y = -21:0.01:-19;
x = -1:0.01:1;
[X,Y] = meshgrid(x,y);
% Построим изолинии вещественной части 
contour(X,Y,ReP,[0 1], 'ShowText','on','LineStyle', '-.', 'LineWidth', 1.6);
hold on;
% Построим изолинии мнимой части
contour(X,Y,ImP,[0 1], 'ShowText','on', 'LineWidth', 1.6);
hold off;
legend('Re(z)', 'Im(z)')
xlabel('x');
ylabel('y');
title('$f = z^3 + (20i)\ z^2 - 2\ z + 1$', 'Interpreter', 'latex');
