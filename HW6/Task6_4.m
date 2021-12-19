% Зададим p = k/5 = 20/5 = 4
p = 4;
% Зададим промежуток, на котором нужно найти решения:
x = linspace(0,2*pi/p, 200);
% Определим начальное условие:
u01 = [1 0];

options = odeset('RelTol',1e-0,'AbsTol',1e-3,'MaxStep', 0.05);
% При первом начальном условии:
[t,u] = ode78(@(t,u)matie(t,u,p), x, u01, options);
%
N = 11;
x_t = x.';
% Зададим на промежутке равномерную сетку из 11 точек

xval = linspace(0, 2*pi/p, N);
% Получим значения в этих точках
[t_N,yval] = ode78(@(t,u)matie(t,u,p), xval, u01, options);
yval_1 = yval(:,1).';
yval_2 = yval(:,2).';

% Введем формулу получения i-го базисного многочлена
L_i = @(x, i) prod(...
    (x - xval([1:(i-1), (i+1):end])) ./ ...
    (xval(i) - xval([1:(i-1), (i+1):end])),...
    2);

%x = linspace(min(x_val), max(x_val)).';
y_1 = zeros(size(x));
y_2 = zeros(size(x));

% Вычисляем точки
for i = 1 : N
    y_i_1 = yval_1(i) * L_i(x_t, i);
    y_i_2 = yval_2(i) * L_i(x_t, i);
   
    y_1 = y_1 + y_i_1;
    y_2 = y_2 + y_i_2;
end
% График для решения
figure(1);
hold on;
plot(x, u(:,1), ':k', 'LineWidth', 1.5)
plot(x_t, y_1);
scatter(xval, yval_1, 'fill');
hold off;
legend('ode78', 'interpolation');
title('График отклонения интерполинома Лагранжа');
% График для производной
figure(2);
hold on;
plot(x, u(:,2), ':k', 'LineWidth', 1.5)
plot(x_t, y_2);
scatter(xval, yval_2, 'fill');
hold off;
legend('ode78', 'interpolation');
title('График отклонения интерполинома Лагранжа от производной')
