load calibrata.mat
x = calibrata(:,1);
y = calibrata(:,2);

% Perform least squares
[c,s] = polyfit(x,y,1);
[y2,delta] = polyval(c,x,s);  %Evaluates polynomial

uppervals = polyfit(x,y + 3 .* delta,1);  %Upper and lower lines
y_uppers = polyval(uppervals,x);

lowervals = polyfit(x,y - 3 .* delta,1);
y_lowers = polyval(lowervals,x);

close all
figure
hold on

h1 = errorbar(x, y2, 3 .* delta, 'k');  %Multiply to get 3 sigma
h2 = errorbar(x, y2, 3 .* delta,'k');
h2.LineStyle = 'none';
h3 = scatter(x,y,15,'bs','filled');
hu = plot(x,y_uppers,'--r');
hl = plot(x,y_lowers,'--r');


H = [h3; h1; hu];

legend(H,'Experimental data','Least squares fit','3\sigma bounds')
grid on
box on
xlabel('Load [lbs]')
ylabel('Bridge output [volts]')
title('Load Cell Calibration Curve')
hold off
