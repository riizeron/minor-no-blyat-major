function P = hermit_interpolation(a, b, Pvals, x)
    Pa = Pvals(1);
    dPa = Pvals(2);
    Pb = Pvals(3);
    dPb = Pvals(4);
    h = b - a;
    
    P = dPa*(x-a).*(x-b).^2/h^2 + Pa*(2*(x-a).*(x-b).^2/h^3 + (x-b).^2/h^2) +...
    dPb*(x-b).*(x-a).^2/h^2 + Pb*(2*(x-a).^2.*(b-x)/h^3 + (x-a).^2/h^2);
end