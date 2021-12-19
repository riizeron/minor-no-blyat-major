function dz = LV_system(t, z, par)
alpha = par(1);
beta = par(2);
gamma = par(3);
delta = par(4);

dz = zeros(2, 1);
dz(1) = z(1) * (alpha - beta * z(2));
dz(2) = z(2) * (-gamma + delta * z(1));
end