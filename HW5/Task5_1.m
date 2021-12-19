% Суть алгоритма
%
% Заключаетс она в том, что бы на основе линейной комбинации, с коэффициентами 
% данных значений искомой функции, базисных многочленов, которые во
% всех точках кроме выбранной одной равны нулю, а в выбранной равны
% единице, получить значение искомого интерполяционного многочлена Лагранжа.
% 
% Описание алгоритма
%
% Пусть нам заданы n аргументов функции и их значения.
% I-ый многочлен найдем таким образом.
% Нам изместно, что он во всех точках кроме i-ой дает ноль, в таком случае
% его можно записать так:
% (x-x_1)*(x-x_2)*...*(x-x_{i-1})*(x-x_{i+1})*...*(x-x_n).
% Но для того чтобы при x_i он давал значение ноль нам необходимо взять его
% нормаровку по x_i. Тогда мы получим многочлен записывающийся в виде
% дроби:        (x-x_1)*(x-x_2)*...*(x-x_{i-1})*(x-x_{i+1})*...*(x-x_n)
%        L_i = -----------------------------------------------------------------
%               (x_i-x_1)*(x_i-x_2)*...*(x_i-x_{i-1})*(x_i-x_{i+1})*...*(x_i-x_n)
%
% Таким образом нам необходимо найти n базисных многочленов.
% Далее возмем их линейную комбинацию с коэффициентами значений функции.
% y = \sigma_{i=1,n} y_i*L_i - искомый многочлен.
% 
m = 2;
k = 20;
% аппроксимируем вещественные значения
sq_2 = 1.4142; % ~sqrt(2)
sq_7 = 2.6458; % ~sqrt(7)
% Зададим аргументы и их знаения искомой функции.
x_val = [-m, m*sq_2, sq_7, 2*sq_7];
y_val = [1, -k, sq_7, -2*sq_7];


n = length(x_val);

% Зададим функцию получения значений i-го базисного многочлена
L_i = @(x, i) prod(...
    (x - x_val([1:(i-1), (i+1):end])) ./ ...
    (x_val(i) - x_val([1:(i-1), (i+1):end])),...
    2);

x = linspace(min(x_val), max(x_val)).';
y = zeros(size(x));

figure(1);
for i = 1 : n
    y_i = y_val(i) * L_i(x, i);
    y = y + y_i;
    pl = plot(x, y_i); hold on;
    sc = scatter(x_val(i), y_val(i), 60, 'LineWidth', 1, ...
        'MarkerFaceColor', pl.Color, 'MarkerEdgeColor', 'none');
    sc.HandleVisibility = 'off'; % Don't show the scatter points in (future) legend
end
plot(x, y, '--k', 'LineWidth', 1.5);
hold off;
legend('L_1', 'L_2', 'L_3', 'L_4', 'L');
syms x;
for i = 1 : n
    y_i = y_val(i) * L_i(x, i);
    y = y + y_i;
end
% Тут я стараюсь вывести искомый многочлен
% Однако он никак не хочет нормально сокращаться.
% Вот сократился бы, я бы получил что хотел.
assume(y,'real');
y = expand(y);
y = simplifyFraction(y);
display(y);