function [  ] = Q4_28( )
% Solves the 2nd order ODE in Q4.28
%   Plots the answer

% Constants
global R L C
R = 35;
L = 0.5;
C = 95e-6;


% Solve it numerically
[TOUT,YOUT] = ode45(@dydtsys,[0, 10],[0; 0]);

% Plot
close all
figure
hold on
plot(TOUT,YOUT(:,1));
box on
grid on
xlabel('Time [s]')
ylabel('Output Voltage v_o [V]')
title('Output Voltage in Q4.28')
hold off


end



function vdot = dydtsys(t,v)
% The function dydtsys is used to hold the ODEs
% t is the current time (a single number).
% v is a two element vector;
% v = [v; vdot]
% vdot = [vdot; vddot]

% Hard coding constants
global R L C

v_i = 40/(1+0.01*t);
v_idot = -2/(5*(t/100 + 1)^2);

vdot(1,1)= v(2);
vdot(2,1)= (-1/R*v_idot - 1/L*v_i)/C;


end

