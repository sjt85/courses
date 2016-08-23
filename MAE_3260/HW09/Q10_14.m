syms m_eq omega k_eq c_eq

M = sqrt(m_eq*omega^2)/sqrt((k_eq - m_eq*omega^2)^2 + (c_eq*omega)^2);

M_prime = diff(M,omega);
simplify(M_prime);
pretty(M_prime);

M = subs(M,omega,sqrt(k_eq*m_eq)/m_eq);

eq1 = M*5 == 585.144e-6;

c_eq = 4.27e-9;
k_eq = 1.54495;

m_eq = solve(eq1,m_eq)

