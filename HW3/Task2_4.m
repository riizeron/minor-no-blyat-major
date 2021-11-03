% Зададим значения аргументам функций
x = -10:1:10;
y = -10:1:10;
% Инициализируем нулями матрицу значений функций нулями
F1 = zeros(length(x), length(y));
F2 = zeros(length(x), length(y));
count1 = 1;
% Вычислим значения функций при различных аргументах и запишем результаты в
% матрицу
for k=x
    count2 = 1;
    for t=y
        F1(count1, count2) = f1(k,t);
        F2(count1, count2) = f2(k,t);
        count2 = count2 + 1;
    end
    count1 = count1 + 1;
end

% Строим изолинии первой функции
figure(1);
contour(x,y,F1,[-0.05 0 0.05], 'ShowText','on', 'LineWidth', 1.6);
xlabel('x');
ylabel('y');
legend('$f1(x,y)$', 'Interpreter', 'latex');
title('Изолинии функции', '$f1(x,y)$', 'Interpreter', 'latex');

% Строим изолинии второй функции
figure(2);
contour(x,y,F2,[-0.05 0 0.05], 'ShowText','on', 'LineWidth', 1.6);
xlabel('x');
ylabel('y');
legend('$f2(x,y)$', 'Interpreter', 'latex');
title('Изолинии функции','$f2(x,y)$', 'Interpreter', 'latex');

% Зададим исходные функции
function root = f1(x, y)
    if(x^2 + y^2) > 0
        root = x^2*y/(x^4 + y^2);
    else
        root = 0;
    end
end

function root = f2(x, y)
    if x ~= 0
        root = exp(-1/x^2)*y/(exp(-2/x^2)+y^2);
    else
        root = 0;
    end
end
