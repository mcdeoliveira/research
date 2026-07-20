format compact
format short e
delete inertia2.out
echo on
diary inertia2.out
% MAE 280 B - Linear Control Design
% Mauricio de Oliveira
%
% State estimation - Part III
%

m = 100;               % 100 kg

% linearized system matrices
A = [0 1; 0 0]
Bw = [0; 1/m]

% position
Cy1 = [1 0]
Dyw1 = 0

% accelerometer
P = [0 1];
Cy2 = P*A
Dyw2 = P*Bw

Cy = [Cy1; Cy2];
Dyw = [Dyw1; Dyw2];

% noise variances
Ww = 100^2
Wv = diag([10^2 100]);

% augmented system matrices
Bwa = [Bw zeros(2,2)]
Dywa = [zeros(2,1) eye(2)]
Wa = [Ww zeros(1, 2); zeros(2, 1) Wv]

% compute using matlab's kalman
sys = ss(A, Bw, Cy, Dyw);
est = kalman(sys, Ww, Wv);
F = -est.b

% error dynamics
eig(A + F * Cy)

% try to simulate estimator
sys2 = ss(A, Bwa, Cy, Dywa);
filt2 = est * sys2;

Tmax = 240;
T = 0 : 0.1 : Tmax;
w = [randn(length(T),1)*sqrtm(Ww) randn(length(T),2)*sqrtm(Wv)];

% estimate stationary position (with measurement noise)
wm = w;
wm(:,1) = 0;
x0 = [10; 0]
xhat0 = [5; 0]
[y,t,x] = lsim(sys2, wm, T, x0);
if exist('filt1')
  [yf1,tf1,xf1] = lsim(filt1, wm(:,1:2), T, [xhat0; x0]);
  xhat1 = xf1(:,1:2);
end
[yf2,tf2,xf2] = lsim(filt2, wm, T, [xhat0; x0]);
xhat2 = xf2(:,1:2);

figure(1)
if exist('filt1')
  plot(t, x, 'g', t, xhat1, 'b', t, xhat2, 'r'),
else
  plot(t, x, 'g', t, xhat2, 'b'),
end
title('system and estimator trajectory')
xlim([0, Tmax])
grid

figure(2)
if exist('filt1')
  plot([0 T(end)], [0 0], 'g', t, x-xhat1(:,1:2), 'b', t, x-xhat2(:,1:2), 'r'), 
else
  plot([0 T(end)], [0 0], 'g', t, x-xhat2(:,1:2), 'b'), 
end
title('estimation error')
xlim([0, Tmax])
grid
pause

% estimate moving position (with measurement and process noise)
x0 = [10; 0]
xhat0 = [5; 0]
[y,t,x] = lsim(sys2, w, T, x0);
if exist('filt1')
  [yf1,tf1,xf1] = lsim(filt1, w(:,1:2), T, [xhat0; x0]);
  xhat1 = xf1(:,1:2);
end
[yf2,tf2,xf2] = lsim(filt2, w, T, [xhat0; x0]);
xhat2 = xf2(:,1:2);

figure(1)
if exist('filt1')
  plot(t, x, 'g', t, xhat1, 'b', t, xhat2, 'r'),
else
  plot(t, x, 'g', t, xhat2, 'b'),
end
title('system and estimator trajectory')
xlim([0, Tmax])
grid

figure(2)
if exist('filt1')
  plot([0 T(end)], [0 0], 'g', t, x-xhat1(:,1:2), 'b', t, x-xhat2(:,1:2), 'r'), 
else
  plot([0 T(end)], [0 0], 'g', t, x-xhat2(:,1:2), 'b'), 
end
title('estimation error')
xlim([0, Tmax])
grid

diary off
echo off
