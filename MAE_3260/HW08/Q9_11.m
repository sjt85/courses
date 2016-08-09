R = 20;
L = 10;
C = 1;

den = [R*L*C, L, R];

G11 = tf([R*C, 1],den);
G12 = tf([1],den);
G21 = G12;
G22 = tf([L*C, 0, 1],den);

sys = [G11, G12; G21, G22]

sys.InputName = ['V_1'; 'V_2'];
sys.OutputName = ['I_1'; 'I_2'];

bode(sys)
grid on
