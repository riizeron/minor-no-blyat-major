x_val = [-9, -4, -1, 7];
y_val = [5, 2, -2, 9];

L_i = @(x, i) prod(...
    (x - x_val([1:(i-1), (i+1):end])) ./...
    (x_val(i) - x_val([1:(i-1), (i+1):end])),...
    2);

x = linspace(min(x_val), max(x_val)).';
y = zeros(size(x));

figure(1);
for i = 1 : length(x_val)
    y_i = y_val(i) * L_i(x, i);
    y = y + y_i;
    plot(x, y_i);
    hold on;
end
plot(x, y, '-k', 'LineWidth', 1.8);
scatter(x_val, y_val, 40, 'red', 'filled');
hold off;