% Looks at the competing functions of ventricular filling and heart rate as
% they relate to cardiac output

t_systole = 0.240;
tau = 0.200;
V_stroke_max = 0.07;  % Liters

HR = linspace(0,250,500);

for i = 1:length(HR)
    t_diastole(i) = 60/HR(i) - t_systole;
    V_stroke(i) = V_stroke_max*(1-exp(-t_diastole(i)/tau));
    CO(i) = HR(i)*V_stroke(i);
    EF(i) = V_stroke(i)/(V_stroke(i) + 0.06);
end

[y,index] = max(CO);
txt = ('   Max Cardiac Output');


close all

figure
hold on
box on
grid on
plot(HR,CO)
plot(HR(index),y,'bo')
text(HR(index),y,txt)
xlabel('HR [bpm]')
ylabel('Cardiac Output [L/min]')
hold off



figure
hold on
box on
grid on
plot(HR,EF)
xlabel('HR [bpm]')
ylabel('Ejection Fraction')
hold off


