syms J s Theta c1 c2 c3 k1 k2 N1 N2 N3 N4 Kt Ia Ml Theta1 Theta4

eq1 = J*s^2*Theta + c2*s*Theta + (k1+k2)*Theta + k1*(N1/N2)*Theta1 + k2*(N4/N3)*Theta4 == 0;
eq2 = k2*(N4/N3)*Theta + c3*s*Theta4 + k2*(N4/N3)^2*Theta4 == Ml;
eq3 = -k1*(N1/N2)*Theta + c1*s*Theta1 - k1*(N1/N2)^2*Theta1 == Kt*Ia;

Theta1_new = solve(eq3,Theta1);
simplify(Theta1_new);
%pretty(Theta1_new)

Theta4_new = solve(eq2,Theta4);
simplify(Theta4_new);
%pretty(Theta4_new)

eq1 = subs(eq1, Theta1, Theta1_new);
eq1 = subs(eq1, Theta4, Theta4_new);

simplify(eq1);
collect(eq1,s);
pretty(eq1)