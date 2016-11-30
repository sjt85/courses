% Does the plots for question 1 of hw5 concerning the nephron

%% Constants
Q1_0 = 0.125e-6;
c0 = 120;

%% Equations portion
c1_0 = c0;

fstarL = linspace(0,1.5e-5,200);
alpha = fstarL/(Q1_0*c0);

c2_0 = c0*(1-alpha).*exp(alpha);

%% Plotting

figure(1)
hold on; clf; box on;

plot(fstarL,c1_0)
plot(fstarL,c2_0)

xlabel('Pumping rate')
ylabel('Concentration')

hold off



