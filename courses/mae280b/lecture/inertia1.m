format compact
format short e
delete inertia1.out
echo on
diary inertia1.out
% MAE 280 B - Linear Control Design
% Mauricio de Oliveira
%
% State estimation - Part II
%

m = 100;               % 100 kg

% linearized system matrices
A = [0 1; 0 0]
Bw = [0; 1/m]

% position
Cy = [1 0]
Dyw = 0

% noise variances
Ww = 100^2

% augmented system
Bwa = [Bw zeros(2,1)]
Dywa = [zeros(1,1) 1]

% measurement noise variances
Wv = 10^2

Wa = [Ww zeros(1, 1); zeros(1, 1) Wv]

% compute using dual state feedback
[F,X,S] = lqr(A', Cy', Bwa * Wa * Bwa', Dywa * Wa * Dywa');
F = - F'

% compute using matlab's kalman
sys = ss(A, Bw, Cy, Dyw);
est = kalman(sys, Ww, Wv);
F = -est.b

% error dynamics
eig(A + F * Cy)

% try to simulate estimator
sys1 = ss(A, Bwa, Cy, Dywa);
filt1 = est * sys1;

Tmax = 240;
T = 0 : 0.1 : Tmax;
w = [randn(length(T),1)*sqrtm(Ww) randn(length(T),1)*sqrtm(Wv)];

% estimate stationary position (no noise)
figure(1)
x0 = [10; 0]
xhat0 = [0; 0]
[y,t,x] = initial(sys1, x0, T);
[yf,tf,xf] = initial(filt1, [xhat0; x0], T);
xhat = xf(:,1:2);

figure(1)
plot(t, x, t, xhat), 
title('system and estimator trajectory')
xlim([0, Tmax])
grid

figure(2)
plot(t, x-xhat(:,1:2)), 
title('estimation error')
xlim([0, Tmax])
grid
pause

% estimate stationary position (with measurement noise)
wm = w;
wm(:,1) = 0;
x0 = [10; 0]
xhat0 = [5; 0]
[y,t,x] = lsim(sys1, wm, T, x0);
[yf,tf,xf] = lsim(filt1, wm, T, [xhat0; x0]);
xhat = xf(:,1:2);

figure(1)
plot(t, x, 'g', t, xhat, 'b'), 
title('system and estimator trajectory')
xlim([0, Tmax])
grid

figure(2)
plot([0 T(end)], [0 0], 'g', t, x-xhat(:,1:2), 'b'), 
title('estimation error')
xlim([0, Tmax])
grid
pause

% estimate moving position (with measurement and process noise)
x0 = [0; 0]
xhat0 = zeros(2,1)
[y,t,x] = lsim(sys1, w, T, x0);
[yf,tf,xf] = lsim(filt1, w, T, [xhat0; x0]);
xhat = xf(:,1:2);

figure(1)
plot(t, x, 'g', t, xhat, 'b'), 
title('system and estimator trajectory')
xlim([0, Tmax])
grid

figure(2)
plot([0 T(end)], [0 0], 'g', t, x-xhat(:,1:2), 'b'), 
title('estimation error')
xlim([0, Tmax])
grid

diary off
echo off
