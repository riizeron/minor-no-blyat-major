% z = x + 1i*y
% |z + 2*i| > 20 => |x + i*(2+y)| > 20 => x^2 + (2+y)^2 > 400 (1)
% |z - 20*1i| < 2 => |x + i*(y - 20)| < 2 => x^2 + (y - 20)^2 < 4 (2)
% (1) - Область снаружи круга с радиусом 20 и центром в точке (0, -2)
% (2) - Область внутри круга с радиусом 2 и центром в точке (0, 20)
% => областью пересечения будет область внутри круга (2)

th = 0: pi/50:2*pi;
figure(1)
% Определяем функции для построения круга
xunit = 2 * cos(th) + 0;
yunit = 2 * sin(th) + 20;
% Рисуем круг с радиусом 2
plot(xunit, yunit, 'color', '#A2142F','DisplayName','|z - 20*1i| = 2')

hold on
% Закрашиваем область пересечения
fill(xunit, yunit, 'c','DisplayName','intersection')
% Определяем функции для построения круга
xunit = 20 * cos(th) + 0;
yunit = 20 * sin(th) - 2;
% Рисуем круг с радиусом 20
plot(xunit, yunit, 'color', '#EDB120', 'DisplayName','|z + 2*i| = 20')

title('Intersection')
hold off
legend
xlabel('Re(z)');
ylabel('Im(z)');


