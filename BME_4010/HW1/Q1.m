%  Makes the two graphs called for in HW1, Q1

P_v = 10;
C_s = 0.5;
C_d = 10;
V0 = 30;

P_a = 0:0.5:180;

V_stroke = C_d*P_v - C_s*P_a;

close all
figure
hold on
plot(P_a,V_stroke)
xlabel('P_{arterial} [mmHg]')
ylabel('V_{stroke} [mL]')
grid on
box on
hold off

W_heart = (1.33322e-4) * (P_a - P_v).*(C_d*P_v - C_s*P_a);

figure
hold on
plot(P_a,W_heart)
xlabel('P_{arterial} [mmHg]')
ylabel('W_{heart} [Joules]')
grid on
box on
hold off