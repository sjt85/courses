% Does the plots for question 1 of hw5 concerning the nephron

%% Constants
Q1_0 = 0.125e-6;
c0 = 120;

%% Equations portion
c1_0(1,1:200) = c0;

fstarL = linspace(0,1.5e-5,200);
alpha = fstarL/(Q1_0*c0);

c2_0 = c0*(1-alpha).*exp(alpha);

%Total flux in and out of the loop
flux_in = Q1_0 * c0;
flux_out = flux_in*(1-alpha);
flux_in(1,1:200) = flux_in;

%% Plotting

close all
figure
hold on; box on;
axis([0, 1.6e-5, 0, 150])

plot(fstarL,c1_0)
plot(fstarL,c2_0)
%line([0,1.6e-5],[120,120],'LineStyle','--','Color','k')
legend('c_1(0)','c_2(0)','Location','SouthWest')

xlabel('Total pumping rate, f^*_{Na}L (mEq/min)')
ylabel('Concentration (mEq/L)')

hold off

figure
hold on; box on;

plot(fstarL,flux_in)
plot(fstarL,flux_out)

legend('flux in','flux out','Location','SouthWest')

xlabel('Total pumping rate, f^*_{Na}L (mEq/min)')
ylabel('Total sodium flux (mEq/min)')

hold off





