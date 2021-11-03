f = @(z) exp((2 + 20*1i).*z);
g = @(z) cos((2 + 20*1i).*z);

Ref = @(x,y) exp(2.*x - 20)*cos(2.*y+20.*x);
Imf = @(x,y) exp(2.*x - 20)*1i*sin(2.*y+20.*x);

plot(real(f),imag(f));
figure(1)