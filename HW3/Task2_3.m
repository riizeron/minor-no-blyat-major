% m = 2, k = 20
%
% Определим исходную функцию
f = @(z) (z - 20).*(z + 2i).*(z - (20 + 2i));
% Степень исходной функции равна 3 => она имеет 3 корня. 
% Вычислим ее производную
df = @(z) (z + 2i)*(z - 20) + (z + 2i)*(z - 20 - 2i) + (z - 20)*(z - 20 - 2i);
true_roots = [-2i, 20, 20+2i];
% Создадим матрицу аргументов для вещественной и мнимой части
[x, y] = meshgrid(linspace(-30, 30, 501), linspace(-10, 10, 501));
z = x + 1i*y;
% Преобразуем матрицу значений z в столбец
z = z(:);
% Зададим массив корней нулями
z_roots = zeros(length(z), 1);
% Пробежимя циклом по заданным значениям z
for k = 1 : length(z)
    try
        % Применим метод Ньютона 
        z_roots(k) = newton_method(f, df, z(k));
    catch
        z_roots(k) = NaN;
    end
end
% Теперь разберемся с цветами
color_mat = zeros(length(z), 3);
color_set = [0, 0.4470, 0.7410; % Синий
    0.8500, 0.3250, 0.0980;     % Красный
    0.9290, 0.6940, 0.1250];    % Желтый
% Зададим различный цвет различным точкам в зависимости от попадания их в
% тот или иной бассейн притяжения
for k = 1 : length(true_roots)
    ind = abs(z_roots - true_roots(k)) < 1e-4;
    color_mat(ind, :) = repmat(color_set(k, :), sum(ind), 1);
end
% Изобразим бассейны притяжения на графике
figure(1);
scatter(real(z), imag(z),[], color_mat, '.');
hold on;
plot(real(true_roots), imag(true_roots), 'kx', 'MarkerSize', 10);
hold off;
title('Attraction regions', '$f(z) = (z - 20)(z + 2i)(z - (20 + 2i))$','Interpreter', 'latex');
xlabel('\Re(z)');
ylabel('\Im(z)');