a = 2;
b = 2;
alpha = 1;
beta = 4;
A = [alpha, -a;
    -b, beta];
[V, D] = eig(A);

[x, y] = meshgrid(linspace(0, 3));

dx = A(1, 1)*x + A(1,2)*y;
dy = A(2, 1)*x + A(2,2)*y;

figure(1);
streamslice(x, y, dx, dy);
xlabel('x');
ylabel('y');
line([0, -V(1,1)], [0, -V(2,1)], 'Color', 'red', 'LineWidth', 2);

