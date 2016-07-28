R = 1000;
L = 0.2;
C = 0.05;

G = tf([R],[R*C*L, R^2+C, R])
G = 30*G;
step(G);

ylabel('Output Voltage [V]')
title('Step Response of Q7.19')