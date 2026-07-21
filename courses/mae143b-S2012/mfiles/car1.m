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

% P design
Kp = 4/L

num = Kp
den = 1
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
T = .2

[t,x,y] = sim('CarClosedLoopLine', T, simset('OutputVariables', 'ty'));

figure(2)
plot(y(:,1), y(:,2), '-'), hold on
plot(xlim, RyBar*[1 1], 'k-'), hold off, grid
xlabel('r_x')
ylabel('r_y')
title('Trajectory')

leg = {'\theta', '\psi'};
figure(3)
plot(t, y(:,[3 4])*180/pi), grid
legend(leg)
xlabel('t (s)')
ylabel('(degrees)')

pause

% lower gain P design
Kp = 1

num = Kp
den = 1
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
T = 10

[t,x,y] = sim('CarClosedLoopLine', T, simset('OutputVariables', 'ty'));

figure(2)
plot(y(:,1), y(:,2), '-'), hold on
plot(xlim, RyBar*[1 1], 'k-'), hold off, grid
xlabel('r_x')
ylabel('r_y')
title('Trajectory')

leg = {'\theta', '\psi'};
figure(3)
plot(t, y(:,[3 4])*180/pi), grid
legend(leg)
xlabel('t (s)')
ylabel('(degrees)')

pause

% lower gain P design
Kp = .1

num = Kp
den = 1
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
T = 30

[t,x,y] = sim('CarClosedLoopLine', T, simset('OutputVariables', 'ty'));

figure(2)
plot(y(:,1), y(:,2), '-'), hold on
plot(xlim, RyBar*[1 1], 'k-'), hold off, grid
xlabel('r_x')
ylabel('r_y')
title('Trajectory')

leg = {'\theta', '\psi'};
figure(3)
plot(t, y(:,[3 4])*180/pi), grid
legend(leg)
xlabel('t (s)')
ylabel('(degrees)')
