format compact
format short e
delete sat4.out
echo on
diary sat4.out
% MAE 280 B - Linear Control Design
% Mauricio de Oliveira
%
% LQG Control - Part II
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

% measuring x2 (theta)
Cy = [0 r+R 0 0];
Cyt = Cy / T

% augment noise matrices
Bwt = [Bwt zeros(4,1)]
Dywt = [zeros(1,2) 1]

Ww = W
Wv = 0.1

Wt = [Ww zeros(2, 1); zeros(1, 2) Wv]

% optimal state feedback control (using u2 only)
rho = 1
Czt = [eye(4); zeros(1,4)];
Dzut = sqrt(rho)*[zeros(4,1); eye(1)];
Czt'*Dzut
[K,X,S] = lqr(At, But(:,2), Czt'*Czt, Dzut'*Dzut);
K = - K

Acl = At + But(:,2)*K;
eig(Acl)

% optimal state estimation
[F,X,S] = lqr(At', Cyt', Bwt * Wt * Bwt', Dywt * Wt * Dywt');
F = - F'

Acl = At + F*Cy;
eig(Acl)

% optimal controller
ctr1 = ss(At + But(:,2) * K + F * Cyt, -F, K, 0)

% controller transfer-function
zpk(ctr1)

% compute using matlab's lqg
sys = ss(At, But(:,2), Cyt, 0);
ctr2 = lqg(sys, [Czt Dzut]' * [Czt Dzut], ...
           [Bwt; Dywt] * Wt * [Bwt; Dywt]')

% compute closed loop system
Acl = [At But(:,2)*K; -F*Cyt, At+But(:,2)*K+F*Cyt];
Bcl = [Bwt; -F*Dywt];
Ccl = [Czt; Dzut*K];

eig(Acl)

% state variance
Y = lyap(Acl, Bcl * Wt * Bcl')
sqrt(trace(Y))
sqrt(diag(Y))

% optimal state feedback control (using u1 and u2)
rho = 1
Czt = [eye(4); zeros(2,4)];
Dzut = sqrt(rho)*[zeros(4,2); eye(2)];
Czt'*Dzut
[K,X,S] = lqr(At, But, Czt'*Czt, Dzut'*Dzut);
K = - K

Acl = At + But*K;
eig(Acl)

% optimal state estimation
[F,X,S] = lqr(At', Cyt', Bwt * Wt * Bwt', Dywt * Wt * Dywt');
F = - F'

Acl = At + F*Cy;
eig(Acl)

% optimal controller
ctr1 = ss(At + But * K + F * Cyt, -F, K, 0)

% controller transfer-function
zpk(ctr1)

% compute using matlab's lqg
sys = ss(At, But, Cyt, 0);
ctr2 = lqg(sys, [Czt Dzut]' * [Czt Dzut], ...
           [Bwt; Dywt] * Wt * [Bwt; Dywt]')

% compute closed loop system
Acl = [At But*K; -F*Cyt, At+But*K+F*Cyt];
Bcl = [Bwt; -F*Dywt];
Ccl = [Czt; Dzut*K];

eig(Acl)

% state variance
Y = lyap(Acl, Bcl * Wt * Bcl')
sqrt(trace(Y))
sqrt(diag(Y))

diary off
echo off
