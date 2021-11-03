f = @(z) z.^3 + (1i*20).*z.^2 - 2.*z + 1;
df = @(z) -3*z.^2 + 40*z - 2;

[x, y] = meshgrid(linspace(0, 2, 201), linspace(-2, 2, 201));
z = x + 1i*y;
z = z(:);

z_roots = zeros(length(z), 1);
for k = 1 : length(z)
    try
    [z_roots(k), ~] = NewtonMethod(f, df, z(k));
    catch
        z_roots(k) = NaN;
    end
end

color_ind = zeros(length(z), 3);
for k = 1 : length(z_roots)
    if(isnan(z_roots(k)))
        %color_ind(k, :) = [0 0 0]; % Black
    elseif(abs(z_roots(k)-1) < 1e-4)
        color_ind(k, :) = [0 0 1]; % Blue
    elseif (abs(z_roots(k) - (1+2i)) < 1e-4)
        color_ind(k, :) = [1 0 0]; % Red
    elseif (abs(z_roots(k) - (1-2i)) < 1e-4)
        color_ind(k, :) = [1 1 0]; % Tellow
    end
end

figure(1)
scatter(real(z), imag(z), [], color_ind, '.')
xlabel('Re(z)');
ylabel('Im(z)');