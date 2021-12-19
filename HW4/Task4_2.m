% m = 2, k = 20

% g на Сатурне
gSaturn = 9.81*1.1;

% Длина маятника
L = 20;
omegaSaturn = sqrt(gSaturn/L);

% Зададим диапазон углов, период колебаний которых надо измерить
angles =linspace(0,pi,1001);

% Погрешность равенства углов отклонения
eps=0;

% Диапазон времени
T = 30;
tspan = linspace(0,T,1001);

%%
periodsSaturn = zeros(1,length(angles));
for k = 1:length(angles)
    % Задаем начальные значения Коши
    z_0 = [angles(k),0];
    % Вычисляем массив значений угла и времени 
    [tS, zS] = ode45(@(t, z) pendulum_sys(t, z, omegaSaturn), tspan, z_0);
    
    % Бегаем по углам полученного массива
    for p = 1:length(zS(:,1))
        % Проверяем, совершилось ли полное колебание.
        if(zS(p,1)<0 && angle(k) <= -zS(p,1))
            periodsSaturn(k) = tS(p);
            break;
        end
    end
end

figure(1);
plot(angles, periodsSaturn);
xlabel('angle');
ylabel('time');
legend("график времени колебания")
