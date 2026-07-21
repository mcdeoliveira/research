% MAE 143 B
%
% Mauricio de Oliveira
%

format compact

% pendulum and linearization

g = 9.8
mp = 0.5
l = 0.3
r = l/2
J = mp*l^2/12

b = 0
G = tf(1, [(J+mp*r^2), b, g*mp*r])

den = G.den{1};
wn = sqrt(den(3)/den(1))
xi = den(2)/(2*wn*den(1))

wd = wn*sqrt(1 - xi^2)
fd = wd/(2*pi)
Td = 1/fd

b = .1
G = tf(1, [(J+mp*r^2), b, g*mp*r])

den = G.den{1};
wn = sqrt(den(3)/den(1))
xi = den(2)/(2*wn*den(1))

wd = wn*sqrt(1 - xi^2)
fd = wd/(2*pi)
Td = 1/fd

b = .5
G = tf(1, [(J+mp*r^2), b, g*mp*r])

den = G.den{1};
wn = sqrt(den(3)/den(1))
xi = den(2)/(2*wn*den(1))

% Simulate nonlinear pendulum around stable equilibrium point

T = 4
uBar = 0
theta0 = pi/2

bs = [0 .1 .5];

N = length(bs);
y = cell(1,N);
t = cell(1,N);
i = 1;
for b = bs

  [ti,x,yi] = sim('SimplePendulum', T, simset('OutputVariables', 'ty'));
  t{i} = ti;
  y{i} = yi;

  i = i + 1;

end

leg = [ones(N, 1) * 'b = ' num2str(bs')];

figure(1), clf
subplot(2,1,1)
Y = [t; y];
plot(Y{:}, [0 T], 0*[1 1], 'k--')
legend(leg, 'Location', 'SouthEast')
title('Pendulum around stable equilibrium $\theta = 0$', 'FontSize', 15, 'Interpreter', 'latex')
xlabel('$t$', 'FontSize', 15, 'Interpreter', 'latex')
ylabel('$\theta(t)$', 'FontSize', 15, 'Interpreter', 'latex')
grid

% Simulate nonlinear pendulum around unstable equilibrium point

T = 4
uBar = 0
theta0 = pi - pi/8
theta0 = pi - 0.05

N = length(bs);
y = cell(1,N);
t = cell(1,N);
i = 1;
for b = bs

  [ti,x,yi] = sim('SimplePendulum', T, simset('OutputVariables', 'ty'));
  t{i} = ti;
  y{i} = yi;

  i = i + 1;

end

leg = [ones(N, 1) * 'b = ' num2str(bs')];

figure(1)
subplot(2,1,2)
Y = [t; y];
plot(Y{:}, [0 T], pi*[1 1], 'k--')
legend(leg, 'Location', 'SouthEast')
title('Pendulum around unstable equilibrium $\theta = \pi$', 'FontSize', 15, 'Interpreter', 'latex')
xlabel('$t$', 'FontSize', 15, 'Interpreter', 'latex')
ylabel('$\theta(t)$', 'FontSize', 15, 'Interpreter', 'latex')
grid
