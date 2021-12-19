function dudt = matie(t, u, p)

dudt = [u(2); -u(1).*(2 + 20*cos(p*t)) ];
end

