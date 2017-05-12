% Homework 9, question 1 plot of stress/strain curve

L = 0.035;      % meters
A = 150/1000^2; % meters^2

load ACL_data.mat

% Convert to meters
ACL_data(:,1) = ACL_data(:,1)/1000;

strain = ACL_data(:,1)/L;  % Strain
stress = (ACL_data(:,2)/A) / 10^6;  % MPa



close all
figure
hold on; box on;
set(gca,'XMinorTick','on','YMinorTick','on')
plot(strain, stress,'-o')
xlabel('Engineering Strain')
ylabel('Stress [MPA]')
axis([0, 0.025, 0, 30])
line([0.007143, 0.007143],[0,30],'LineStyle','--','Color','k')
line([0.01486, 0.01486],[0,27],'LineStyle','--','Color','k')
line([0.02057, 0.02057],[0,30],'LineStyle','--','Color','k')

text(0.00714/2, 5,'Toe','HorizontalAlignment','center')
text((0.00714 + 0.0149)/2, 5, sprintf('Linear  \nRegion'),'HorizontalAlignment','center')
text((0.02057 + 0.0149)/2, 5, sprintf('Plastic  \nRegion'),'HorizontalAlignment','center')
text((0.025 + 0.02057)/2, 5,'Failure','HorizontalAlignment','center')

text(0.01486, 21.48,'\sigma_{yield} = 21.5 MPa \rightarrow  ','HorizontalAlignment','right')
text(0.02057, 28.15, '\sigma_{ult} = 28.2 MPa \rightarrow  ','HorizontalAlignment','right')

line([0.01029, 0.01257, 0.01257],[10.61, 10.61, 16.03],'Color','k')
text(0.0123, 9.5,'E = 2.38 GPa','HorizontalAlignment','center','FontSize',8)

hold off