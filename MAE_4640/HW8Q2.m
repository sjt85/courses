% Computes the depths of max shear stress as a function of diameter

% Constants
E1 = 1.3e9 ; nu1 = 0.4;
E2 = 210e9 ; nu2 = 0.29;
P = 1500;
D2 = 0.04;
D1 = [-.041, -.08, 10, .08, .04];

% CM and CG

CM = (1 - nu1^2)/E1 + (1 - nu2^2)/E2;
CG = (D1.*D2)./(D1 + D2);

% Solve it
Depth = 0.368*(P.*CG.*CM).^(1/3)

