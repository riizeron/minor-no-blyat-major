function ds = ode_system(t, s)
ds = zeros(3, 1);
ds(1) = -0.01*s(1) - atan(s(3));
ds(2) = s(1) - 0.02*s(2);
ds(3) = s(2) - 3*s(3);
end

