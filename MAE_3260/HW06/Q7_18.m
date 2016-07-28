J = 0.1;
c = 6;
k = 343.77;
sys = tf(24,[J,c,k])
step(sys)

ylabel('\theta [rad]')
title('Q7.18 Step Response')