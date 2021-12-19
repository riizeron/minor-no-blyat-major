function dzdt = pendulum_sys(t, z, omega)

dzdt = [z(2); -omega^2 * sin(z(1))];
