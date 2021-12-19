a = 0;
b = 1;
Pa = -2;
dPa = 3;
Pb = -4;
dPb = 5;

x = linspace(a,b);
P = hermit_interpolation(a, b, [Pa, dPa, Pb, dPb], x);
plot(x, P);
axis equal;