dem = [1, 4, 25];
G = [tf([3, 2],dem), tf([2],dem); tf([1],dem), tf([1, 3],dem)]

t = 0:0.01:5;
U2 = exp(-t);

Y_11 = step(G(1,1),t);
Y_12 = lsim(G(1,2),U2,t);
Y_21 = step(G(2,1),t);
Y_22 = lsim(G(2,2),U2,t);

Y1 = Y_11 + Y_12;
Y2 = Y_21 + Y_22;


subplot(2,1,1)
title('MATLAB Output from Q7.25')
plot(t,Y1)
axis([0, 5, 0, .5])
ylabel('y_1(t)')

subplot(2,1,2)
plot(t,Y2)
axis([0, 5, 0, .5])
xlabel('Time [seconds]')
ylabel('y_2(t)')