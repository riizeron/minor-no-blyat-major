% Задаем константы
alpha = 5;
beta = 2;
gamma = 5;
delta = 4;

% Считаем стационарную точку
z_st = [gamma/delta; alpha/beta];

% Задаем первый интеграл
V = @(x,y) delta*x + beta*y - log(x.^gamma.*y.^alpha);


T = 1.3 * 10;
tspan = [0 T];
% Начальное положение. Начинаем интегрировать именно из этой точки
z_0 = [1.2, 1.2];
% Начальное значение интеграла
V_0 = V(z_0(1), z_0(2));
%%
[t, z] = ode45(@(t, z) LV_system(t, z, [alpha, beta, gamma, delta]), tspan, z_0);

figure(1);
plot(z(:,1), z(:,2));
hold on;
plot(z_st(1), z_st(2), '*r');
plot(z_0(1), z_0(2), '*g');
xlabel('x');
ylabel('y');
hold off;


V_z = V(z(:, 1), z(:, 2));
figure(2);
plot(t, V_z);
line([0, T], [V_0, V_0], 'Color', 'red');
xlabel('t');
ylabel('V(x, y)')

%%
tau = logspace(-4, 0, 50);
tau = tau(2:end);

V_tau_max = zeros(size(tau));
V_tau_int = zeros(size(tau));
for k = 1 : length(tau)
    tspan = (0 : tau : T).';
    
    [t, z] = ode45(@(t, z) LV_system(t, z, [alpha, beta, gamma, delta]),...
        tspan, z_0);
    
    V_z = V(z(:, 1), z(:, 2));
    V_tau_max(k) = max(abs(V_0 - V_z));
    V_tau_int(k) = sqrt(sum((V_0 - V_z).^2)*tau(k));
end
%%
figure(3);
loglog(tau, V_tau_max);
hold on;
loglog(tau, V_tau_int);
% line([0, T], [V_0, V_0], 'Color', 'red');
xlabel('\tau');
legend('$\max_t [V_0 - V_z]$', '$\sqrt[\tau \sum [V_0 - V_z]^2$]', 'Interpreter', 'latex');
ylabel('max_T');


