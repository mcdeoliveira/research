format compact
format short e
delete sat3.out
echo on
diary sat3.out
% MAE 280 B - Linear Control Design
% Mauricio de Oliveira
%
% State estimation - Part I
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

% any measurement that does not include x2 (theta) is not observable!
% for instance
Cy = [1 0 0 0; 0 0 1 0; 0 0 0 1];

% system
sys = ss(A, Bw, Cy, 0)
% take the comment out of next line to see error messages!
%est = kalman(sys, W, eye(size(Cy,1)));

% back to the problem
% measuring x2 (theta)
Cy = [0 r+R 0 0];

% augment noise matrices
Bwa = [Bw zeros(4,1)]
Dywa = [zeros(1,2) 1]

% scale
T = diag([1 r+R 1 r+R])

% similarity transformation
At = T * A / T
But = T * Bu
Bwt = T * Bwa
Cyt = Cy / T
Dywt = Dywa

Ww = W
Wv = 0.1

Wt = [Ww zeros(2, 1); zeros(1, 2) Wv]

% compute using dual state feedback
[F,X,S] = lqr(At', Cyt', Bwt * Wt * Bwt', Dywt * Wt * Dywt');
F = - F'

% compute using matlab's kalman
sys = ss(At, Bwt(:,1:2), Cyt, 0);
est = kalman(sys, Ww, Wv/r^2);
F = -est.b

% error dynamics
eig(At + F * Cyt)

% simulate estimator
sys = ss(T * A / T, T * Bwa, Cy / T, Dywa);
filt = est * sys;

Tmax = 20000;
T = 0 : 0.1 : Tmax;
w = [randn(length(T),2)*sqrtm(Ww) randn(length(T),1)*sqrtm(Wv)];

% estimate stationary position
figure(1)
x0 = [0; 0; 0; 0]
xhat0 = [0; 0; -6; 0]
[y,t,x] = lsim(sys, w, T, x0);
[yf,tf,xf] = lsim(filt, w, T, [xhat0; x0]);
xhat = xf(:,1:4);

figure(1)
plot(t, x(:,[1 2]), 'g', t, xhat(:,[1 2]), 'b'), 
title('system and estimator trajectory (x_1 and x_2)')
xlim([0, Tmax])
grid

figure(2)
plot(t, x(:,[3 4]), 'g', t, xhat(:,[3 4]), 'b'), 
title('system and estimator trajectory (x_3 and x_4)')
xlim([0, Tmax])
grid

figure(3)
plot([0 T(end)], [0 0], 'g', t, x(:,[1 2])-xhat(:,[1 2]), 'b'), 
title('estimation error (x_1 and x_2)')
xlim([0, Tmax])
grid

figure(4)
plot([0 T(end)], [0 0], 'g', t, x(:,[3 4])-xhat(:,[3 4]), 'b'), 
title('estimation error (x_3 and x_4)')
xlim([0, Tmax])
grid

diary off
echo off
