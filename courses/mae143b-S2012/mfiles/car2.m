% MAE 143 B
%
% Mauricio de Oliveira
%

format compact

% forward motion

L = 0.2
v = 1

% model linearized around rx = vt, ry = 0, theta = 0, phi = 0
G = v*tf([L v],[L 0 0])

% PD design with pole-zero cancelation
fn = 1
wn = fn/(2*pi)
Kp = L*wn^2/v
xi = 1 % real poles
Kd = 2*L*wn/v

num = [Kd Kp]
den = [L v]
ctr = tf(num, den)

H = feedback(ctr*G,1)

figure(1), clf
rlocus(minreal(ctr*G)), hold on
plot(real(pole(H)), imag(pole(H)), 'k*'), hold off
xlabel('Re')
ylabel('Im')
title('Root Locus (PD controller)')

% Simulate car

num = ctr.num{1};
den = ctr.den{1};

RyBar = 1
T = 60

[t,x,y] = sim('CarClosedLoopLine', T, simset('OutputVariables', 'ty'));

figure(2)
plot(y(:,1), y(:,2), '-'), hold on
plot(xlim, RyBar*[1 1], 'k-'), hold off, grid
xlabel('r_x')
ylabel('r_y')
title('Trajectory')

leg = {'\theta', '\psi'}
figure(3)
plot(t, y(:,[3 4])*180/pi), grid
legend(leg)
xlabel('t (s)')
ylabel('(degrees)')

pause

% higher reference change
RyBar = 10

T = 60

[t,x,y] = sim('CarClosedLoopLine', T, simset('OutputVariables', 'ty'));

figure(2)
plot(y(:,1), y(:,2), '-'), hold on
plot(xlim, RyBar*[1 1], 'k-'), hold off, grid
xlabel('r_x')
ylabel('r_y')
title('Trajectory')

figure(3)
plot(t, y(:,[3 4])*180/pi), grid
legend(leg)
xlabel('t (s)')
ylabel('(degrees)')

pause

% PD design with pole-zero cancelation (lower fn)
fn = .5
wn = fn/(2*pi)
Kp = L*wn^2/v
Kd = 2*L*wn/v

num = [Kd Kp]
den = [L v]
ctr = tf(num, den)

H = feedback(ctr*G,1)

figure(1), clf
rlocus(minreal(ctr*G)), hold on
plot(real(pole(H)), imag(pole(H)), 'k*'), hold off
xlabel('Re')
ylabel('Im')
title('Root Locus (PD controller)')

% Simulate car

num = ctr.num{1};
den = ctr.den{1};

RyBar = 10
T = 120

[t,x,y] = sim('CarClosedLoopLine', T, simset('OutputVariables', 'ty'));

figure(2)
plot(y(:,1), y(:,2), '-'), hold on
plot(xlim, RyBar*[1 1], 'k-'), hold off, grid
xlabel('r_x')
ylabel('r_y')
title('Trajectory')

figure(3)
plot(t, y(:,[3 4])*180/pi), grid
legend(leg)
xlabel('t (s)')
ylabel('(degrees)')
