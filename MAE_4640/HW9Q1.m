% Homework 9, question 1 plot of stress/strain curve

L = 0.035;      % meters
A = 150/1000^2; % meters^2

load ACL_data.mat

% Convert to meters
ACL_data(:,1) = ACL_data(:,1)/1000;

strain = ACL_data(:,1)/