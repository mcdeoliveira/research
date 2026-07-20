format compact
format short e
delete sat8.out
echo on
diary sat8.out
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

% another similarity to change state
T = [1 0 0 0; 0 0 1 0; 0 1 0 0; 0 0 0 1]
Att = T * At / T
Butt = T * But
Bwtt = T * Bwt

% optimal LQR state feedback control (using u1 and u2)
n = size(Att,1);
m = size(Butt,2);

% LQR solution
Cz = [eye(n); zeros(m,n)];
Dzu = [zeros(n,m); eye(m)];

[K,X,S] = lqr(Att, Butt, Cz' * Cz, Dzu' * Dzu);
Klqr = - K

% LMI solution with decentralization

% declare variables
X = sdpvar(n,n,'symmetric');
Z = sdpvar(m,m,'symmetric');
L = sdpvar(m,n);

% declare LMIs
LMI1 = [Att*X+X*Att'+Butt*L+L'*Butt', X*Cz'+L'*Dzu';...
        Cz*X+Dzu*L, -eye(m+n)];
LMI2 = [Z, Bwtt'; Bwtt, X];

% Structural constraints
Xmask = [zeros(2,2) ones(2,2); ones(2,2) zeros(2,2)]
Lmask = [zeros(1,2) ones(1,2); ones(1,2) zeros(1,2)]

pause

LMI = set(LMI1 < 0) + set(LMI2 > 0) + set(Xmask.*X == 0) + set(Lmask.*L == 0);
options = sdpsettings('solver','sedumi');
solution =solvesdp(LMI,trace(W*Z),options)

pause

% Construct K and check closed loop stability and performance
double(L)
double(X)
Ld = double(L) - double(L) .* Lmask
Xd = double(X) - double(X) .* Xmask
Klmi = Ld / Xd
Acl = Att + Butt*Klmi;
eig(Acl)
Y = lyap(Acl, Bwtt * W * Bwtt')
sqrt(trace(Y))
sqrt(diag(Y))

% Try stripping lqr gain
Klqr
Klqrd = double(Klqr) - double(Klqr) .* Lmask
Acl = Att + Butt*Klqrd;
eig(Acl)
Y = lyap(Acl, Bwtt * W * Bwtt')
sqrt(trace(Y))
sqrt(diag(Y))

% LQR solution
Cz = [eye(n); zeros(m,n)];
Dzu = 1e3*[zeros(n,m); eye(m)];
w
[K,X,S] = lqr(Att, Butt, Cz' * Cz, Dzu' * Dzu);
Klqr = - K

% LMI solution with decentralization

% declare variables
X = sdpvar(n,n,'symmetric');
Z = sdpvar(m,m,'symmetric');
L = sdpvar(m,n);

% declare LMIs
LMI1 = [Att*X+X*Att'+Butt*L+L'*Butt', X*Cz'+L'*Dzu';...
        Cz*X+Dzu*L, -eye(m+n)];
LMI2 = [Z, Bwtt'; Bwtt, X];

% Structural constraints
Xmask = [zeros(2,2) ones(2,2); ones(2,2) zeros(2,2)]
Lmask = [zeros(1,2) ones(1,2); ones(1,2) zeros(1,2)]

LMI = set(LMI1 < 0) + set(LMI2 > 0) + set(Xmask.*X == 0) + set(Lmask.*L == 0);
options = sdpsettings('solver','sedumi');
solution =solvesdp(LMI,trace(W*Z),options)

pause

% Construct K and check closed loop stability and performance
double(L)
double(X)
Ld = double(L) - double(L) .* Lmask
Xd = double(X) - double(X) .* Xmask
Klmi = Ld / Xd
Acl = Att + Butt*Klmi;
eig(Acl)

% Try stripping lqr gain
Klqr
Klqrd = double(Klqr) - double(Klqr) .* Lmask
Acl = Att + Butt*Klqrd;
eig(Acl)

diary off
echo off
