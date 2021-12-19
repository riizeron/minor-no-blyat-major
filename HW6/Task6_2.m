% Возьмем кусок кода из первой задачи
% Зададим p = k/5 = 20/5 = 4
p = 4;
% Зададим промежуток, на котором нужно найти решения:
tspan = [0 2*pi/p];
% Определим начальное условие:
u01 = [1 0];

options = odeset('RelTol',1e-0,'AbsTol',1e-3,'MaxStep', 0.05);
% При первом начальном условии:
[t,u] = ode78(@(t,u)matie(t,u,p), tspan, u01, options);
%
% Зададим на промежутке равномерную сетку из 11 точек
N = 10;
x = linspace(0,2*pi/p, 200);
xval = linspace(0, 2*pi/p, N+1);
% Получим значения в этих точках
[t_N,yval] = ode78(@(t,u)matie(t,u,p), xval, u01, options);
yval = yval(:,1).';
% Вычислим интервалы
h = diff(xval);
% Найдем лямбды и мюшки
lam = h(2:end)./(h(1:end-1) + h(2:end));
mu = 1 - lam;
% Вычислим столбец C
C = 3*lam.*(yval(2:end-1) - yval(1:end-2))./(h(1:end-1)) +...
    3*mu.*(yval(3:end) - yval(2:end-1))./(h(2:end));
% Составим матрицу сплайна
A = 2*eye(N+1) + diag([0,mu].*ones(1,N), 1) + diag([lam,0].*ones(1,N), -1); 
A(1,1) = 1; A(end,end) = 1;
% Граничные условия
C_1 = [0; C.'; 0];
C_2 = [-70; C.'; 70];
C_3 = [100; C.'; 100];
m_1 = A\C_1;
m_2 = A\C_2;
m_3 = A\C_3;


% С помощью цикла найдем необходимый интерполяционный многочлен
S_1 = zeros(size(x));
S_2 = zeros(size(x));
S_3 = zeros(size(x));
for k = 1 : N
    ind = x >= xval(k) & x < xval(k+1);
    if k == N
        ind = x >= xval(k) & x <= xval(k+1);
    else
        int = x >= xval(k) & x < xval(k+1);
    end
    xx = x(ind);
    S_1(ind) = hermit_interpolation(xval(k), xval(k+1), [yval(k), m_1(k), yval(k+1), m_1(k+1)], xx);
    S_2(ind) = hermit_interpolation(xval(k), xval(k+1), [yval(k), m_2(k), yval(k+1), m_2(k+1)], xx);
    S_3(ind) = hermit_interpolation(xval(k), xval(k+1), [yval(k), m_3(k), yval(k+1), m_3(k+1)], xx);
end
% Потсроим график численного решения и график интерполяции

figure(1);
hold on;
plot(t,u(:,1));
plot(x, S_1);
plot(x, S_2);
plot(x, S_3);
scatter(xval, yval, 'fill');
hold off;
legend('ode78 solution', 'spline [0 0]', 'spline [-70 70]', 'spline [100 100]');
title('График отклонения сплайна');
