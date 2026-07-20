format compact
format short e
delete sat2.out
echo on
diary sat2.out
% MAE 280 B - Linear Control Design
% Mauricio de Oliveira
%
% LQR Control - Part II
%

m = 100;               % 100 kg
r = 300E3;             % 300 km
R = 6.37E6;            % 6.37 10^3 km
G = 6.673E-11;         % 6.673 N m^2/kg^2
M = 5.98E24;           % 5.98 10^24 kg
k = G * M;             % gravitational force constant
w = sqrt(k/((R+r)^3)); % angular velocity (rad/s)
v = w * (R + r);       % "ground" velocity (m/s)

% linearized system matrices
A = [0 0 1 0; 0 0 0 1; 3*w^2 0 0 2*(r+R)*w; 0 0 -2*w/(r+R) 0];
Bu = [0 0; 0 0; 1/m 0; 0 1/(m*(r+R))];
Bw = [0 0; 0 0; 1/m 0; 0 1/(m*(r+R))];

% noise variances
W = 0.1 * eye(2) 

% scale
T = diag([1 r+R 1 r+R])

% similarity transformation
At = T * A / T
But = T * Bu
Bwt = T * Bw

% LQR weights
Q = diag([1 1 1 1])
R = eye(1)

% Cheapest control (using u2 only)
rho = 1e6
[Kt,X,S] = lqr(At, But(:,2), Q, rho * R);
Kt = - Kt
trace(X * Bwt * W * Bwt')

% closed look eigenvalues
Acl = At + But(:,2)*Kt;
eig(Acl)

% gain in original coordinates
K = Kt * T

% state covariance 
Y = lyap(Acl, Bwt * W * Bwt')
sqrt(trace(Y))
sqrt(diag(Y))

% optimal control (using u2 only)
rho = 1
[Kt,X,S] = lqr(At, But(:,2), Q, rho * R);
Kt = - Kt
trace(X * Bwt * W * Bwt')

% closed loop eigenvalues
Acl = At + But(:,2)*Kt;
eig(Acl)

% gain in original coordinates
K = Kt * T

% state covariance 
Y = lyap(Acl, Bwt * W * Bwt')
sqrt(trace(Y))
sqrt(diag(Y))

% optimal control (using u1 and u2)
R = eye(2);
rho = 1
[Kt,X,S] = lqr(At, But, Q, rho * R);
Kt = - Kt
trace(X * Bwt * W * Bwt')

% closed loop eigenvalues
Acl = At + But*Kt;
eig(Acl)

% gain in original coordinates
K = Kt * T

% state covariance 
Y = lyap(Acl, Bwt * W * Bwt')
sqrt(trace(Y))
sqrt(diag(Y))

diary off
echo off
