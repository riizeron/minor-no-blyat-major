% m = 2, k = 20
%
% Исходная функция
f = @(x) 2./(x+1i*20) + 1i*20./(x - 1i*2);
% Зададим массив значений аргумента
X = -10:0.1:10;
% Вычислим массив значчений исходной функции
F = f(X);
% Осуществим преобразование Фурье
Fur = fft(F);
% Построим графики мнимой и вещественной части образа Фурье исходной
% функции
figure(1);
plot(real(Fur), 'LineWidth', 1.6);
hold on;
plot(imag(Fur), 'LineWidth', 1.6);
legend('real','imag');
xlabel = 'freq';
ylabel = 'Furie';
