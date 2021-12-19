%%
N = 5;

xval = linspace(0, pi, N+1);
%rng(1);
xval = [0, sort(unifrnd(0, pi, 1, N-1)), pi];
yval = sin(xval);

x = linspace(0, pi, 200);

h = diff(xval);
lam = h(2:end)./(h(1:end-1) + h(2:end));
mu = 1 - lam;

C = 3*lam.*(yval(2:end-1) - yval(1:end-2))./(h(1:end-1)) +...
    3*mu.*(yval(3:end) - yval(2:end-1))./(h(2:end));
%% Matrix
A = 2*eye(N+1) + diag([0,mu].*ones(1,N), 1) + diag([lam,0].*ones(1,N), -1); 

%% Border condition
A(1,1) = 1; A(end,end) = 1;
C = [1; C.'; -1];
m = A\C;

%% Spline cycle
S = zeros(size(x));
for k = 1 : N
    ind = x >= xval(k) & x < xval(k+1);
    if k == N
        ind = x >= xval(k) & x <= xval(k+1);
    else
        int = x >= xval(k) & x < xval(k+1);
    end
    xx = x(ind);
    S(ind) = hermit_interpolation(xval(k), xval(k+1), [yval(k), m(k), yval(k+1), m(k+1)], xx);
end

%% Visualisation
figure(2);
scatter(xval, yval, 'fill');
hold on;
plot(x, S);
hold off;

%% Spline
S_m = spline(xval, yval, x);
figure(2);
hold on;
plot(x, S_m, ':k');
hold off;
legend('Data', 'Custon Spline', 'Matlab Spline', 'FontSize', 14);