% Performs error estimates

E1 = 12e12; E2 = 13.4e12; E3 = 20e12;
G12 = 4.53e12; G23 = 6.23e12; G31 = 5.61e12;
nu12 = 0.376; nu23 = 0.235; nu31 = 0.371;

nu21 = E2/E1*nu12;
nu32 = E3/E2*nu23;
nu13 = E1/E3*nu31;

sigma_XY = [1;0;0];

% Stiffness matrix
S = [1/E1, -nu21/E2, -nu31/E3, 0, 0, 0;...
     -nu12/E1, 1/E2, -nu32/E3, 0, 0, 0;...
     -nu13/E1, -nu23/E2, 1/E3, 0, 0, 0;...
     0, 0, 0, 1/G23, 0, 0;...
     0, 0, 0, 0, 1/G31, 0;...
     0, 0, 0, 0, 0, 1/G12];
 
 S = [S(1:2,1:2), S(1:2,6); S(6,1:2), S(6,6)];
 
 for i = 0:10
     theta = i;
 
 % Transformation matrix
 T = [cosd(theta)^2, sind(theta)^2, 2*sind(theta)*cosd(theta);...
      sind(theta)^2, cosd(theta)^2, -2*sind(theta)*cosd(theta);...
      -sind(theta)*cosd(theta), sind(theta)*cosd(theta), cosd(theta)^2-sind(theta)^2];
  
  eps_XY = inv(T)*S*T*sigma_XY;
  E_31(i+1) = 1/eps_XY(1);
  
  
 end
 
error31 = 100*(E_31-E3)./E3;
 
 
 
 % Repeat for other plane
 
 % Being lazy
 
E2 = 12e12; E1 = 13.4e12; E3 = 20e12;
G12 = 4.53e12; G13 = 6.23e12; G23 = 5.61e12;
nu12 = 0.376; nu23 = 0.235; nu31 = 0.371;

nu21 = E2/E1*nu12;
nu32 = E3/E2*nu23;
nu13 = E1/E3*nu31;
 
% Stiffness matrix
S = [1/E1, -nu21/E2, -nu31/E3, 0, 0, 0;...
     -nu12/E1, 1/E2, -nu32/E3, 0, 0, 0;...
     -nu13/E1, -nu23/E2, 1/E3, 0, 0, 0;...
     0, 0, 0, 1/G23, 0, 0;...
     0, 0, 0, 0, 1/G31, 0;...
     0, 0, 0, 0, 0, 1/G12];
 
 S = [S(1:2,1:2), S(1:2,6); S(6,1:2), S(6,6)];


for i = 0:10
    theta = i;
 
% Transformation matrix
T = [cosd(theta)^2, sind(theta)^2, 2*sind(theta)*cosd(theta);...
     sind(theta)^2, cosd(theta)^2, -2*sind(theta)*cosd(theta);...
     -sind(theta)*cosd(theta), sind(theta)*cosd(theta), cosd(theta)^2-sind(theta)^2];
  
 eps_XY = inv(T)*S*T*sigma_XY;
 E_32(i+1) = 1/eps_XY(1);
  
  
end

error32 = 100*(E_32-E3)./E3;

close all

figure
hold on
box on
xlabel('\Theta'); ylabel('Error for 31 Plane')
plot([0,1,2,3,4,5,6,7,8,9,10],error31)
hold off


figure
hold on
box on
xlabel('\Theta'); ylabel('Error for 32 Plane')
plot([0,1,2,3,4,5,6,7,8,9,10],error32)
hold off
