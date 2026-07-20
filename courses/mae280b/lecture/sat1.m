format compact
format short e
delete sat1.out
echo on
diary sat1.out
% MAE 280 B - Linear Control Design
% Mauricio de Oliveira
% LQR Control - Part I

m = 100       % 100 kg
r = 300E3     % 300 km
R = 6.37E6    % 6.37 10^3 km
G = 6.673E-11 % 6.673 N m^2/kg^2
M = 5.98E24   % 5.98 10^24 kg

% gravitational force constant
k = G * M

% angular velocity (rad/s)
w = sqrt(k/((R+r)^3))

% "ground" velocity (m/s)
v = w * (R + r)

% linearized system matrices
A = [0 0 1 0; 0 0 0 1; 3*w^2 0 0 2*(r+R)*w; 0 0 -2*w/(r+R) 0]
Bu = [0 0; 0 0; 1/m 0; 0 1/(m*(r+R))]
Bw = [0 0; 0 0; 1/m 0; 0 1/(m*(r+R))]

% noise variances
W = 0.1 * eye(2)

% open loop system eigenvalues
eig(A)

% LQR weights
Q = diag([1 1 1 1])
R = eye(1)

% Cheapest control (using u2 only)
rho = 1e6
[K,X,S] = lqr(A, Bu(:,2), Q, rho * R);
K = - K
trace(X * Bw * W * Bw')

% closed loop eigenvalues
Acl = A + Bu(:,2)*K;
eig(Acl)

% Cheapest control (using u1 only)
% WARNING: Recall this can't be done because 
% (A,Bu(:,1) is not controllable 
% (in this case also not stabilizable!)
rho = 1
[K,X,S] = lqr(A, Bu(:,1), Q, rho * R);
K = - K
trace(X * Bw * W * Bw')

% closed loop eigenvalues
Acl = A + Bu(:,1)*K;
eig(Acl)

diary off
echo off
