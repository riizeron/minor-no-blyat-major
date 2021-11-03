% m = 2; k = 20
% Исходное уравнение:
f = @(z) 2./(z - 0.1) + 1./(z - 4) + 1./z;
z = @(x,y) x + 1i.*y;
% Запишем уравнения данных окружностей
O1 = @(x) sqrt(0.01 - x.^2);
O1n = @(x) -sqrt(0.01 - x.^2);
O2 = @(x) sqrt(1 - x.^2);
O2n = @(x) -sqrt(1 - x.^2);
O3 = @(x) sqrt(100 - x.^2);
O3n = @(x) -sqrt(100 - x.^2);

% Заметим, что наша функция неопределена в точках (0,0) (4,0) (0.1,0)
% Из которых только одна - (0.1,0) - лежит на выбранной окружности
% Поэтому нам необходимо будет выколоть эту точку в дальнейшем 
% Зададим количество вершин
N = 3:3:90;
% Инициализируем нулями массивы значений интегралов
I1 = zeros(30);
I2 = zeros(30);
I3 = zeros(30);
counter = 1;
for n=N
    integ1 = 0;
    integ2 = 0;
    integ3 = 0;
    % Далее идут три отдельных цикла в связи с тем что пределы
    % интегрирования в каждом случае разные
    % Исключим из интегрирования по окружности с радиусом 0.1 точку (0.1,0)
    % Зададим шаг
    step1 = 0.2/n;
    xi1 = -0.1+step1+0.0001:step1:0.1-step1-0.0001;
    for k=xi1
        integ1 = integ1 + f(z(k,O1n(k)))*(z(k+step1,O1n(k+step1))-z(k,O1n(k)));
        integ1 = integ1 + f(z(0.1-abs(k),O1(0.1-abs(k))))*(z(0.1-abs(k)-step1,O1(0.1-abs(k)-step1))-z(0.1-abs(k),O1(0.1-abs(k))));
    end
    step2 = 2/n;
    xi2 = -1:step2:1;
    for k=xi2
        integ2 = integ2 + f(z(k,O2n(k)))*(z(k+step2,O2n(k+step2))-z(k,O2n(k)));
        integ2 = integ2 + f(z(1-abs(k),O2(1-abs(k))))*(z(1-abs(k)-step2,O2(1-abs(k)-step2))-z(1-abs(k),O2(1-abs(k))));
    end
    step3 = 20/n;
    xi3 = -10:step3:10;
    for k=xi3
        integ3 = integ3 + f(z(k,O3n(k)))*(z(k+step3,O3n(k+step3))-z(k,O3n(k)));
        integ3 = integ3 + f(z(10-abs(k),O3(10-abs(k))))*(z(10-abs(k)-step3,O3(10-abs(k)-step3))-z(10-abs(k),O3(10-abs(k))));
    end
    I1(counter) = integ1;
    I2(counter) = integ2;
    I3(counter) = integ3;
    counter = counter + 1;
end
figure(1);
hold on;
% Отобразим график абсолютного значения интеграла в зависимости от
% количества отрезков аппроксимации
plot(N,abs(I1), 'LineWidth', 1.6);
plot(N,abs(I2), 'LineWidth', 1.6);
plot(N,abs(I3), 'LineWidth', 1.6);
% Отчего-то подписи к графикам формируются в непонятном порядке
% Поэтому я добавил в легенду две лишнии подписи
% Чтобы цвета обозначались корректно
legend('rad = 0.1', 'error', 'rad = 1', 'error', 'rad = 10');
xlabel('N');
ylabel('Integral');
title('$\oint f(z)dz = \oint (\frac{2}{z - 0.1} + \frac{1}{z - 4} + \frac{1}{z})dz$', 'Interpreter', 'latex');







