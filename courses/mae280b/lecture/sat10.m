format compact
format short e
delete sat10.out
echo on
diary sat10.out
% MAE 280 B - Linear Control Design
% Mauricio de Oliveira
%
% Multiobjective LQR Control
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

% minimum energy state feedback control (using u1 and u2)
n = size(At,1);
m = size(But,2);
Dzu = eye(m);

% declare variables
X = sdpvar(n,n,'symmetric');
Z = sdpvar(m,m,'symmetric');
L = sdpvar(m,n);

% declare LMIs
LMI1 = At*X+X*At'+But*L+L'*But'+Bwt*W*Bwt';
LMI2 = [Z Dzu*L; L'*Dzu' X];

LMI = set(LMI1 < 0) + set(LMI2 > 0);
options = sdpsettings('solver','sedumi');
solution =solvesdp(LMI,trace(Z),options)

% compute gain
K = double(L) / double(X)
Acl = At + But * K;
eig(Acl)

% look at cost
minenergy = trace(double(Z))

% try to solve Riccati
% K = -lqr(At, But, zeros(n), Dzu'*Dzu)

% solve optimal performance
Cz = eye(n);

X = sdpvar(n, n);
L = sdpvar(m, n);
Z = sdpvar(n, n);

LMI1 = At*X+X*At'+But*L+L'*But'+Bwt*W*Bwt';
LMI2 = [Z Cz*X; X*Cz' X];

LMI = set(LMI1 < 0) + set(LMI2 > 0);
options = sdpsettings('solver','sedumi');
solution =solvesdp(LMI,trace(Z),options)

% compute gain
K = double(L) / double(X)
Acl = At + But * K;
eig(Acl)

% look at cost
minperf = trace(double(Z))

% solve optimal performance
Cz = eye(n);

X = sdpvar(n, n);
L = sdpvar(m, n);
Z = sdpvar(n, n);

LMI1 = At*X+X*At'+But*L+L'*But'+Bwt*W*Bwt'+1e-5*eye(n);
LMI2 = [Z Cz*X; X*Cz' X];

LMI = set(LMI1 < 0) + set(LMI2 > 0);
options = sdpsettings('solver','sedumi');
solution =solvesdp(LMI,trace(Z),options)

% compute gain
K = double(L) / double(X)
Acl = At + But * K;
eig(Acl)

% look at cost
minperf = trace(double(Z))

% solve multiobjective performance
X = sdpvar(n, n);
L = sdpvar(m, n);
Zp = sdpvar(n, n);
Zu = sdpvar(m, m);

LMI1 = At*X+X*At'+But*L+L'*But'+Bwt*W*Bwt';
LMI2 = [Zp Cz*X; X*Cz X];
LMI3 = [Zu Dzu*L; L'*Dzu X];

LMI = set(LMI1 < 0) + set(LMI2 > 0) + set(LMI3 > 0) ...
    + set(trace(Zu) <= 1.2*minenergy);
options = sdpsettings('solver','sedumi');
solution =solvesdp(LMI,trace(Zp),options)

% compute gain
K = double(L) / double(X)
Acl = At + But * K;
eig(Acl)

% look at cost
1.2*minenergy
trace(double(Zu)) 
trace(double(Zp))

diary off
echo off
