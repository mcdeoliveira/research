format compact
format short e
delete sat7.out
echo on
diary sat7.out
% MAE 280 B - Linear Control Design
% Mauricio de Oliveira
%
% LMI LQR Control
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
Bu = [0 0; 0 0; 1/m 0; 0 1/(m*r)];
Bw = [0 0; 0 0; 1/m 0; 0 1/(m*r)];

% noise variances
W = 0.1 * eye(2) 

% scale
T = diag([1 r 1 r])

% similarity transformation
At = T * A / T
But = T * Bu
Bwt = T * Bw

% optimal LQR state feedback control (using u1 and u2)
n = size(At,1);
m = size(But,2);

% LQR solution
Cz = [eye(n); zeros(m,n)];
Dzu = [zeros(n,m); eye(m)];

[K,X,S] = lqr(At, But, Cz' * Cz, Dzu' * Dzu);
Klqr = - K

% LMI solution (second form)
E = null([But' Dzu']);

% declare variables
X = sdpvar(n,n,'symmetric');
Z = sdpvar(m,m,'symmetric');

% declare LMIs
LMI1 = E'*[At*X+X*At', X*Cz';...
        Cz*X, -eye(m+n)]*E;
LMI2 = [Z, Bwt'; Bwt, X];

LMI = set(LMI1 < 0) + set(LMI2 > 0);
options = sdpsettings('solver','sedumi');
solution =solvesdp(LMI,trace(W*Z),options)

% Construct K and check closed loop stability
Y = inv(double(X));
QQ = [Y*At+At'*Y, Cz';...
     Cz, -eye(m+n)];
BB = [But'*Y Dzu'];
CC = [eye(n) zeros(n,m+n)];

mu = 1e8
max(eig(QQ - mu*BB'*BB))
max(eig(QQ - mu*CC'*CC))

Phi = QQ - mu*BB'*BB - mu*CC'*CC;
XX = mu^2 * CC * inv(Phi) * BB';

% Check closed loop stability
Klqr
Klmi = XX'
Acl = At + But*Klmi;
eig(Acl)

diary off
echo off
