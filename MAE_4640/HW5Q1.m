% Does some matrix inversions for HW5, Q1

% Part a
eps = [0; 0; .002; 0; 0; 0];
E1 = 12e12; E2 = 13.4e12; E3 = 20e12;
G12 = 4.53e12; G23 = 6.23e12; G31 = 5.61e12;
nu12 = 0.376; nu23 = 0.235; nu31 = 0.371;

sigma_a = findStresses(eps, E1, E2, E3, G12, G23, G31, nu12, nu23, nu31)

% Part b_i
eps = [0; 0; .002; 0; 0; 0];
E1 = 12.7e12; E2 = 12.7e12; E3 = 20e12;
G12 = 5.38e12; G23 = 5.38e12; G31 = 5.61e12;
nu12 = 0.306; nu23 = 0.306; nu31 = 0.371;

sigma_bi = findStresses(eps, E1, E2, E3, G12, G23, G31, nu12, nu23, nu31)

% Part b_ii
eps = [0; 0; .002; 0; 0; 0];
E1 = 20e12; E2 = 20e12; E3 = 20e12;
G12 = 7.69e12; G23 = 7.69e12; G31 = 7.69e12;
nu12 = 0.3; nu23 = 0.3; nu31 = 0.3;

sigma_bii = findStresses(eps, E1, E2, E3, G12, G23, G31, nu12, nu23, nu31)



function stresses = findStresses(eps, E1, E2, E3, G12, G23, G31, nu12, nu23, nu31)
% Finds missing Poissons' ratios
% Assembles a stiffness matrix
% Inverts the stiffness matrix
% Finds the stress state

nu21 = E2/E1*nu12;
nu32 = E3/E2*nu23;
nu13 = E1/E3*nu31;


S = [1/E1, -nu21/E2, -nu31/E3, 0, 0, 0;...
     -nu12/E1, 1/E2, -nu32/E3, 0, 0, 0;...
     -nu13/E1, -nu23/E2, 1/E3, 0, 0, 0;...
     0, 0, 0, 1/G23, 0, 0;...
     0, 0, 0, 0, 1/G31, 0;...
     0, 0, 0, 0, 0, 1/G12];
 
stresses = inv(S)*eps;

end