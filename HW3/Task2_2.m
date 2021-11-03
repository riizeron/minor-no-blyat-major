% m = 2, k = 20
%
syms x y z k
% Запишем функцию расстояния в пространсвах размерности 3 и 4
r3 = sqrt(x^2 + y^2 + z^2)^20;
r4 = sqrt(x^2 + y^2 + z^2 + k^2)^20;
% Вычислим производные функций
% r3
r3_x = diff(r3,x);
r3_xx = diff(r3,x,x);
r3_xy = diff(r3,x,y);
% r4
r4_x = diff(r4,x);
r4_xx = diff(r4,x,x);
r4_xy = diff(r4,x,y);


% Выведем полученные результаты
% r3
display(r3_x);
display(r3_xx);
display(r3_xy);
% r4
display(r4_x);
display(r4_xx);
display(r4_xy);