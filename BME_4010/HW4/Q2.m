%%% Calculates dP/dt / P_tot for Q2 of HW4

t = [0 4 8 12 16 20 24];
P = [11 19 20 21 34 30 37];      % Labeled cells
P_tot = [59 68 65 55 71 55 69];  % Total cells

LI = P./P_tot; % labeling index

%% Start doing the least squares line

coeff = polyfit(t,LI,1);

% Because we're doing a straight line, we don't need it fine-grained

P_fitted = coeff(1)*t + coeff(2);




%% Plot it!

close all
figure
hold on
box on

plot(t,LI,'o')
plot(t,P_fitted)
xlabel('Time (hrs)')
ylabel('P/P_{tot}')
axis([0 25 0 .6])
line([12 16],[P_fitted(4) P_fitted(4)])
line([16 16],[P_fitted(4) P_fitted(5)])
text(16.5,0.42,{'Proliferation';'Rate'})


hold off