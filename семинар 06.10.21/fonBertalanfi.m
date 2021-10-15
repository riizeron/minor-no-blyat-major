alpha = 2;
beta = 3;

V_0 = [.01, .25, 2.25];
tspan = [0, 10];
dV_fun = @(t,V) alpha*V.^(2/3) - beta*V;

[t,V] = ode45(dV_fun, tspan, V_0);

figure(1);
plot(t, V);
grid on;
xlabel('t');
ylabel('V');
tl = title('$\frac{dV}{dt} = \alpha V^(2/3) - \beta V$', 'Interpreter', 'latex');
tl.FontSize = 18;
subtitle(['\alpha = ', num2str(alpha), ', \beta = ', num2str(beta) ]);
line(tspan, [(alpha/beta)^(3) (alpha/beta)^(3)], 'Color', 'red', 'LineStyle', '--');