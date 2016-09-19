% Calculates and plots P_minus and P_plus as a function of beat number

% Constants
R_s = 17.5;
C_sa = 0.00175;
HR = 80;

j = 25;      % number of beats
T = 1/HR;    % period

V_stroke = 0.07*ones(j,1);  % change this around as desired
V_stroke(2) = 0.03;
V_stroke(15) = 0.03;

% V_stroke(2) = 0.02;
% V_stroke(6) = 0.02;
% V_stroke(10) = 0.02;
% V_stroke(14) = 0.02;
% V_stroke(18) = 0.02;


P_minus = zeros(j,1);
P_plus  = zeros(j,1);
P_minus(1) = 100;        % change this IC around

for i = 1 : j-1
    P_plus(i)    = P_minus(i) + V_stroke(i)/C_sa;
    P_minus(i+1) = P_plus(i)*exp(-T/(R_s*C_sa));    
end

P_plus(j) = P_minus(j) + V_stroke(j)/C_sa;


close all

figure
hold on
plot(P_plus,'-o')
plot(P_minus,'-o')
box on
xlabel('Beat Number')
ylabel('Arterial Pressure [mmHg]')
axis([0,25,50,150])
legend('P(t_j^+)','P(t_j^-)','location','southeast')

fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 6 3];
print('figures/P_B100','-depsc','-r0')  % change the filename each time

hold off