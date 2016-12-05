% Makes pretty plots for third lab dealing with cartilage transport

%% First do fluorescein d-beta galactoside

load 'DB_diffusion.mat'
load 'DB_pos.mat'
load 'DB_neg.mat'
load 'fluoro_cal.mat'
load 'fluoro.mat'

DB_cal = [.001562, .001; .003125, .006; .00625, .013; .0125, .024;...
    .025, .041; .05, .084];
DB_cal(:,1) = 1.52207.*DB_cal(:,1);


% Concatenate
datas = [DB_diffusion(:,:); DB_pos(:,:); DB_neg(:,:)];

% Do our least squares fits. Diffusion is 1, pos is 2, neg is 3
P1 = polyfit(DB_diffusion(:,1),DB_diffusion(:,2),1);
R1 = corrcoef(DB_diffusion);
Rsq1 = R1(1,2).^2

P2 = polyfit(datas(106:176,1),datas(106:176,2),1);
R2 = corrcoef(datas(106:176,1),datas(106:176,2));
Rsq2 = R2(1,2).^2

P3 = polyfit(DB_neg(29:75,1),DB_neg(29:75,2),1);
R3 = corrcoef(DB_neg(29:75,1),DB_neg(29:75,2));
Rsq3 = R3(1,2).^2


%% And now regular fluorescein

P_fluoro = sum(fluoro_cal(:,1).*fluoro_cal(:,2))/sum(fluoro_cal(:,1).^2)
R_fluoro = corrcoef(fluoro_cal);
Rsq_fluoro = R_fluoro(1,2).^2


%% Plot the given data

gch = figure(1);
clf;
hold on; box on;
axis([0, 3000, 0, .035])
xlabel('Time (sec)')
ylabel('Concentration (mM)')

line([DB_pos(1,1); DB_pos(1,1)],[0; .035],'LineStyle','--','Color','k')
line([DB_neg(1,1); DB_neg(1,1)],[0; .035],'LineStyle','--','Color','k')

plot(datas(:,1),datas(:,2),'LineWidth',1.2)

line(DB_diffusion(:,1),polyval(P1,DB_diffusion(:,1)),...
    'Color','k');
line([1143; 1903],polyval(P2,[1143; 1903]),...
    'Color','k');
line([2211; 2708],polyval(P3,[2211; 2708]),...
    'Color','k');


text(571,0.002,'Diffusion','HorizontalAlignment','center')
text(1523,0.002,'Positive Current','HorizontalAlignment','center')
text(2306,0.002,'Negative Current','HorizontalAlignment','center')

text(70,.01,{'y = 3.189 \times 10^{-6} + 0.004','R^2 = 0.866'},...
    'FontSize',8)

text(1180,.025,{'y = 1.645 \times 10^{-5} - 0.010','R^2 = 0.939'},...
    'FontSize',8)

text(2100,.023,{'y = -2.396 \times 10^{-6} + 0.037','R^2 = 0.260'},...
    'FontSize',8)

hold off

% Plot the given calibration curve

gch = figure(2);
clf;
hold on; box on;
axis([0,.04,0,.05])
xlabel('Concentration (mM)')
ylabel('Absorbance')

plot(DB_cal(:,1),DB_cal(:,2),'o','LineWidth',1.2)
line([0; .039],[0,.0432619],'Color','k')

text(.002,.045,'A = \epsilonbc')
text(.027,.025,{'y = 1.1093x','R^2 = 0.996'},'FontSize',8)

hold off


%% Plot the measured data

gch = figure(3);
clf;
hold on; box on;
axis([0, 3500, 0.005, .02])
xlabel('Time (sec)')
ylabel('Concentration (mM)')


line([1946; 1946],[0.005;0.02],'LineStyle','--','Color','k')
line([2551; 2551],[0.005;0.02],'LineStyle','--','Color','k')

plot(fluoro(:,1),fluoro(:,2),'LineWidth',1.2)

text(973,0.007,'Diffusion','HorizontalAlignment','center')
text(2249,0.007,{'Positive','Current'},'HorizontalAlignment','center')
text(2938,0.007,'Negative Current','HorizontalAlignment','center')


hold off

% Calibration curve

gcf = figure(4);
clf;
hold on; box on;
axis([0,0.07,0,1])
xlabel('Concentration (mM)')
ylabel('Absorbance')

plot(fluoro_cal(:,1),fluoro_cal(:,2),'o','LineWidth',1.2)
line([0; .068],[0,.068*12.9494],'Color','k')

text(.002,.85,'A = \epsilonbc')
text(.045,.45,{'y = 12.949x','R^2 = 0.994'},'FontSize',8)

hold off


