%%% Calculates dP/dt / P_tot for Q2 of HW4

t = [0 4 8 12 16 20 24];
P = [11 19 20 21 34 30 37];      % Labeled cells
P_tot = [59 68 65 55 71 55 69];  % Total cells

LI = P./P_tot; % labeling index

%% Start doing the least squares line

coeff = polyfit(t,LI,1);

% Because we're doing a straight line, we don't need it fine-grained

LI_fitted = coeff(1)*t + coeff(2);




%% Plot it!

close all
figure
hold on
box on

plot(t,LI,'o')
plot(t,LI_fitted)
xlabel('Time (hrs)')
ylabel('P/P_{tot}')
axis([0 25 0 .6])
line([12 16],[LI_fitted(4) LI_fitted(4)])
line([16 16],[LI_fitted(4) LI_fitted(5)])
text(16.5,0.42,{'Proliferation';'Rate'})


hold off



%% And now plot the total number of proliferating cells

coeff2 = polyfit(t,P,1);
P_fitted = coeff2(1)*t + coeff2(2);

figure
hold on
box on

plot(t,P,'o')
plot(t,P_fitted)

axis([0 25 0 40])
xlabel('Time (hrs)')
ylabel('P')

hold off