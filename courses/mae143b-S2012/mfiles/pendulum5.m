% MAE 143 B
%
% Mauricio de Oliveira
%

format compact

% linear control design (P + D + I)

g = 9.8
mp = 0.5
l = 0.3
r = l/2
J = mp*l^2/12

% model linearized around stable equilibiurm
b = 0
G = tf(1/(J+mp*r^2), [1, b/(J+mp*r^2), mp*r*g/(J+mp*r^2)])

den = G.den{1};
wn = sqrt(den(3)/den(1))
xi = den(2)/(2*wn*den(1))

% double the natural frequency, xi = 0.5
Kp = 3*mp*r*g
Kd = 2*sqrt(mp*r*g*(J+mp*r^2))
Ki = 4.1

ctrPID = Kp + Kd * tf([1 0],1) + Ki * tf(1, [1 0])

H = feedback(ctrPID*G,1)

den = H.den{1};
wn = sqrt(den(3)/den(1))
xi = den(2)/(2*wn*den(1))

wd = wn*sqrt(1 - xi^2)
fd = wd/(2*pi)
Td = 1/fd

figure(1), clf
subplot(2,2,1)
rlocus(ctrPID*G), hold on
plot(pole(H), 'k*'), hold off
xlabel('Re')
ylabel('Im')
title('Root Locus (PID controller)')

% Make controller proper

pd = 4*min(real(zero(ctrPID)));
ctrPIDP = ctrPID * tf(-pd,[1 -pd])

H = feedback(ctrPIDP*G,1)

figure(1)
subplot(2,2,3)
rlocus(ctrPIDP*G), hold on
plot(pole(H), 'k*'), hold off
xlabel('Re')
ylabel('Im')
title('Root Locus (PID controller + pole)')

% Simulate nonlinear pendulum with feedback around stable equilibrium point

T = 2
thetaBar = pi/4
theta0 = pi/2

num = ctrPIDP.num{1};
den = ctrPIDP.den{1};

bs = [0 .1 .5];

N = length(bs);
y = cell(1,N);
t = cell(1,N);
i = 1;
for b = bs

  [ti,x,yi] = sim('SimplePendulumWithFeedback', T, simset('OutputVariables', 'ty'));
  t{i} = ti;
  y{i} = yi;

  i = i + 1;

end

leg = [ones(N, 1) * 'b = ' num2str(bs')];

figure(1)
subplot(2,2,[2 4])
Y = [t; y];
plot(Y{:}, [0 T], thetaBar*[1 1], 'k--')
legend(leg, 'Location', 'NorthEast')
title(['$\bar{\theta} = ' num2str(thetaBar) '$'], 'FontSize', 15, 'Interpreter', 'latex')
xlabel('$t$', 'FontSize', 15, 'Interpreter', 'latex')
ylabel('$\theta(t)$', 'FontSize', 15, 'Interpreter', 'latex')
grid

% model linearized around unstable equilibiurm
b = 0
G = tf(1/(J+mp*r^2), [1, b/(J+mp*r^2), -mp*r*g/(J+mp*r^2)])

% use same K as before
H = feedback(ctrPID*G,1)

den = H.den{1};
wn = sqrt(den(3)/den(1))
xi = den(2)/(2*wn*den(1))

wd = wn*sqrt(1 - xi^2)
fd = wd/(2*pi)
Td = 1/fd

figure(2), clf
subplot(2,2,1)
rlocus(ctrPID*G), hold on
plot(pole(H), 'k*'), hold off
xlabel('Re')
ylabel('Im')
title('Root Locus (PID controller)')

% proper controller
H = feedback(ctrPIDP*G,1)

figure(2)
subplot(2,2,3)
rlocus(ctrPIDP*G), hold on
plot(pole(H), 'k*'), hold off
xlabel('Re')
ylabel('Im')
title('Root Locus (PID controller + pole)')

% Simulate nonlinear pendulum with feedback around stable equilibrium point

T = 2
thetaBar = pi - pi/4
theta0 = pi - pi/2

num = ctrPIDP.num{1};
den = ctrPIDP.den{1};

bs = [0 .1 .5];

N = length(bs);
y = cell(1,N);
t = cell(1,N);
i = 1;
for b = bs

  [ti,x,yi] = sim('SimplePendulumWithFeedback', T, simset('OutputVariables', 'ty'));
  t{i} = ti;
  y{i} = yi;

  i = i + 1;

end

leg = [ones(N, 1) * 'b = ' num2str(bs')];

figure(2)
subplot(2,2,[2 4])
Y = [t; y];
plot(Y{:}, [0 T], thetaBar*[1 1], 'k--')
legend(leg, 'Location', 'SouthEast')
title(['$\bar{\theta} = ' num2str(thetaBar) '$'], 'FontSize', 15, 'Interpreter', 'latex')
xlabel('$t$', 'FontSize', 15, 'Interpreter', 'latex')
ylabel('$\theta(t)$', 'FontSize', 15, 'Interpreter', 'latex')
grid

% Design for Ki
figure(3), clf

H = feedback(Ki*tf(1/(J+mp*r^2), [1, Kd/(J+mp*r^2), (Kp+mp*r*g)/(J+mp*r^2), 0]),1);
subplot(1,2,1)
rlocus(tf(1/(J+mp*r^2), [1, Kd/(J+mp*r^2), (Kp+mp*r*g)/(J+mp*r^2), 0])), hold on
plot(pole(H), 'k*'), hold off
sgrid
xlabel('Re')
ylabel('Im')
title('Root Locus (PD + I controller, stable equilibrium)')
axis([-10 1 -15 15])

H = feedback(Ki*tf(1/(J+mp*r^2), [1, Kd/(J+mp*r^2), (Kp-mp*r*g)/(J+mp*r^2), 0]),1);
subplot(1,2,2)
rlocus(tf(1/(J+mp*r^2), [1, Kd/(J+mp*r^2), (Kp-mp*r*g)/(J+mp*r^2), 0])), hold on
plot(pole(H), 'k*'), hold off
sgrid

xlabel('Re')
ylabel('Im')
title('Root Locus (PD + I controller, unstable equilibrium)')
axis([-10 1 -15 15])
