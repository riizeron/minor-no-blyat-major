c = 0.1;

x = logspace(-1.5, 0.8, 35);
tspan = [0, 2];
dV_fun = @(t,x) x - x.^2 - c;

[t,V] = ode45(dV_fun, tspan, x);

figure(1);
plot(t, V, '-black');
axis([0, 2, 0, 1]);
grid on;
xlabel('t');
ylabel('x');
tl = title('c = 0.1');
% tl.FontSize = 18;
% subtitle(['\alpha = ', num2str(alpha), ', \beta = ', num2str(beta) ]);
line(tspan, [(1/2+1/2*sqrt(1-4*c)) (1/2+1/2*sqrt(1-4*c))], 'Color', 'red', 'LineStyle', '--', 'LineWidth', 2);
line(tspan, [(1/2-1/2*sqrt(1-4*c)) (1/2-1/2*sqrt(1-4*c))], 'Color', 'blue', 'LineStyle', '--', 'LineWidth', 2);