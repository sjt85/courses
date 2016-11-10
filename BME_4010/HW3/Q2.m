%%% Plots mechanical energy and free energy required to expand lung

% Constants and such
C = 150;
V = linspace(0,4500,200);
V_conv = 1e-6 * V;
gamma = 0.072;
n = 3e8;

%% Find mech work
W = (98e-6)*V.^2 / C;


%% Free energy for the first gamma
F = 4*pi*gamma*n* (0.75*V_conv/n).^(2/3);




%% Plot shit for the first gamma, without surfactant
close all

figure(1)
hold on
box on
axis([0 4500 0 14])
plot(V,W)
plot(V,F)
xlabel('Volume (mL)')
ylabel('Energy (J)')

gamma = 0.040;
F = 4*pi*gamma*n* (0.75*V_conv/n).^(2/3);

plot(V,F)

hold off

legend('Mechanical Work','Free Energy, \gamma = 0.072','Free Energy, \gamma = 0.040','Location','Northwest')