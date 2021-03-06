% Данный файл содержит реализацию алгоритма метода Ньютона
%
function [z_root, z_path] = newton_method(f, df, z_0)
% Погрешность вычислений, то есть некоторая окрестность. 
% Будем считать, что если в ходе вычислений промежуточное
% значение попадает в данную окрестность предыдущего значения, то оно будет являтся корнем
eps = 1e-6;
% Зададим максимальное количество повторений
% Если количество повторений превысит это значений, то корень найден не
% будет и вызовется ошибка
max_k = 50;
% Инициализируем массив точек приближения
z_path = NaN(max_k + 1, 1);
% Задаим первую выбранную точку
z_path(1) = z_0;
% Зададим начало рекуррентным вычислениям
z_path(2) = z_path(1) - f(z_path(1)) / df(z_path(1));

% Итератор
k = 1;
% Цикл рекуррентного вычисления
while abs(z_path(k + 1) - z_path(k)) > eps
    k = k + 1;
    if k > max_k
        error('Method did not converge');
    end
    z_path(k + 1) = z_path(k) - f(z_path(k)) / df(z_path(k));
end

% Зададим значение выходным параметрам
z_path = z_path(~isnan(z_path));
z_root = z_path(end);

