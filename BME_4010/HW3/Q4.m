%%% Solves and plots the Hill equation for a healthy human
%%% and then iterates for anemic cases


%% Constants
P_star = 25;
c_star = 7.2;

c = linspace(0,c_star,200);

%% Solve the equation
for i = 1:length(c)
    
    P1(i) = P_star*((c(i)/(c_star - c(i))).^(1/1));
    P2(i) = P_star*((c(i)/(c_star - c(i))).^(1/2));
    P3(i) = P_star*((c(i)/(c_star - c(i))).^(1/3));
    
end

%% Plot it
close all

figure
hold on
box on
plot(P1,c)
plot(P2,c)
plot(P3,c)

line([0 150],[7.2 7.2],'LineStyle','--','Color','k')


axis([0 150 0 8])

xlabel('Partial Pressure O_2 (mmHg)')
ylabel('Concentration (mM)')

hold off

legend('n = 1','n = 2','n = 3','Location','SouthEast')


%% Now do this for varying degrees of anemia


c_star_a = 0.8 * c_star;
c_a = linspace(0,c_star_a,200);
c_star_s = 0.5 * c_star;
c_s = linspace(0,c_star_s,200);



for i = 1:length(c_a)
    
    P_a(i) = P_star*((c_a(i)/(c_star_a - c_a(i))).^(1/3));
    P_s(i) = P_star*((c_s(i)/(c_star_s - c_s(i))).^(1/3));

end


figure
hold on
box on
plot(P3,c)
plot(P_a,c_a)
plot(P_s,c_s)


axis([0 100 0 8])

xlabel('Partial Pressure O_2 (mmHg)')
ylabel('Concentration (mM)')

hold off

legend('Normal case','Slightly anemic','Severely anemic','Location','SouthEast')





