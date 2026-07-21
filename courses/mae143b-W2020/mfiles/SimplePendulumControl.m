% Root-locus based control design for the simple pendulum
%
% Author: Mauricio de Oliveira
% Date: 05/10/2014

format compact

% data

m = 0.5
l = 0.3
r = l/2
g = 9.8
J = m*l^2/12
Jr = (J+m*r^2)

% assume no damping during control design
b = 0

% model linearized around unstable equilibiurm
Gpi = tf(1/Jr, [1, b/Jr, -m*r*g/Jr])

% model linearized around stable equilibiurm
G0 = tf(1/Jr, [1, b/Jr, m*r*g/Jr])

% wn_ol and zeta_ol
den = G0.den{1};
wn_ol = sqrt(den(3)/den(1))
zeta_ol = den(2)/(2*wn_ol*den(1))

pause

% PD controller
% sqrt(2) * wn_ol, zeta_ol = 0.5

Kp = 3*m*r*g
Kd = 2*sqrt(m*r*g*Jr)
z = Kp/Kd

ctr_PD = Kp + Kd * tf([1 0],1)

% closed-loop with PD controller
Spi = feedback(1, ctr_PD*Gpi)

den = Spi.den{1};
wn_PD = sqrt(den(3)/den(1))
zeta_PD = den(2)/(2*wn_PD*den(1))

wd_PD = wn_PD*sqrt(1 - zeta_PD^2)
fd_PD = wd_PD/(2*pi)

% root locus
L = ctr_PD*Gpi;

figure(1), clf
rlocus(L), hold on;

t = 0 : 0.1 : 2*pi;
circ = wn_PD*cos(t) + j*wn_PD*sin(t);

plot(pole(Spi), 'd');
plot(real(circ), imag(circ), 'k--')
set(gca, 'PlotBoxAspectRatio', [1 diff(ylim)/diff(xlim) 1]);
hold off

pause

% Add integral control pole

ctr_PDI = ctr_PD * tf(1,[1 0])

L = ctr_PDI*Gpi;

figure(2), clf
rlocus(L)

pause

% Place pole 8 times

pd = 8*zero(ctr_PD)
ctr_PDP = 0.9 * ctr_PD * tf(-pd,[1 -pd])

Spi = feedback(1,ctr_PDP*Gpi)
L = ctr_PDP*Gpi;

figure(3), clf
rlocus(L), hold on
plot(real(circ), imag(circ), 'k--')
plot(pole(Spi), 'd');
hold off
ylim([-20 20])
set(gca, 'PlotBoxAspectRatio', [1 diff(ylim)/diff(xlim) 1]);

pause

% Place pole 2 times

pd = 2*zero(ctr_PD)
ctr_PDP = 0.8*ctr_PD * tf(-pd,[1 -pd])

Spi = feedback(1,ctr_PDP*Gpi)
L = ctr_PDP*Gpi;

figure(4), clf
rlocus(L), hold on
plot(real(circ), imag(circ), 'k--')
plot(pole(Spi), 'd');
hold off
xlim([-30 10])
ylim([-20 20])
set(gca, 'PlotBoxAspectRatio', [1 diff(ylim)/diff(xlim) 1]);
sgrid

pause

% Place pole 2 times adjust zero

pd = 2*zero(ctr_PD)

ctr_PDD = 0.9*Kp*tf([1.4*Kd/Kp 1],1)/1.45

ctr_PDP = ctr_PDD * tf(-pd,[1 -pd])

Spi = feedback(1,ctr_PDP*Gpi)
L = ctr_PDP*Gpi;

figure(5), clf
rlocus(L), hold on
plot(real(circ), imag(circ), 'k--')
plot(pole(Spi), 'd');
hold off
xlim([-30 10])
ylim([-20 20])
set(gca, 'PlotBoxAspectRatio', [1 diff(ylim)/diff(xlim) 1]);
sgrid

pause

% root locus for stable equilibrium

S0 = feedback(1,ctr_PDP*G0)
L = ctr_PDP*G0;

figure(6), clf
rlocus(L), hold on
plot(real(circ), imag(circ), 'k--')
plot(pole(S0), 'd');
hold off
xlim([-30 10])
ylim([-20 20])
set(gca, 'PlotBoxAspectRatio', [1 diff(ylim)/diff(xlim) 1]);
sgrid

pause

% Place pole 2 times adjust zero + integrator

Gcl = feedback(Gpi,ctr_PDP)

ctr_I = 1.1965*tf(1,[1 0])
ctr_IAlt = 2.8*tf(1,[1 0])

Spi = feedback(1,ctr_I*Gcl)
SpiAlt = feedback(1,ctr_IAlt*Gcl)

L = ctr_I*Gcl;

figure(7), clf
rlocus(L), hold on
plot(real(circ), imag(circ), 'k--')
set(gca, 'PlotBoxAspectRatio', [1 diff(ylim)/diff(xlim) 1]);

pause

plot(pole(Spi), 'd');
plot(pole(SpiAlt), 's');
hold off
xlim([-40 10])
ylim([-15 15])
set(gca, 'PlotBoxAspectRatio', [1 diff(ylim)/diff(xlim) 1]);

pause

% Final controller 

ctr = ctr_I + ctr_PDP
zpk(ctr)

pause

% Direct root-locus design

ctr_RL = ctr;
Spi = feedback(1,ctr_RL*Gpi)

ctr_RLAlt = 1.07*ctr_RL;
SpiAlt = feedback(1,ctr_RLAlt*Gpi)

L = ctr_RL*Gpi;
zpk(L)

figure(8), clf
rlocus(L), hold on
plot(pole(Spi), 'd');
plot(pole(SpiAlt), 's');
plot(real(circ), imag(circ), 'k--')
ylim([-15 15])
set(gca, 'PlotBoxAspectRatio', [1 diff(ylim)/diff(xlim) 1]);
hold off

pause

% Simulate nonlinear pendulum with feedback around unstable equilibrium point

T1 = 4
thetaBar1 = pi/2 - pi/4
theta0 = pi/2 + pi/4;

num = ctr.num{1};
den = ctr.den{1};

bs = [0 .1 .5];

N = length(bs);
y1 = cell(1,N);
t1 = cell(1,N);
i = 1;
for b = bs

  thetaBar = thetaBar1;

  [ti,x,yi] = sim('SimplePendulumWithFeedback', T1, simset('OutputVariables', 'ty', 'RelTol', 1e-5));
  t1{i} = ti;
  y1{i} = yi;

  i = i + 1;

end

T2 = T1;
thetaBar2 = pi/2 + pi/4

N = length(bs);
y2 = cell(1,N);
t2 = cell(1,N);
i = 1;
for b = bs

  thetaBar = thetaBar2;
  theta0 = y1{i}(end);

  [ti,x,yi] = sim('SimplePendulumWithFeedback', T2, simset('OutputVariables', 'ty', 'RelTol', 1e-5));
  t2{i} = ti;
  y2{i} = yi;

  i = i + 1;

end

Y1 = [t1; cellfun(@(x) (180/pi)*x, y1, 'UniformOutput', false)];

Y2 = [cellfun(@(x) x+T1, t2, 'UniformOutput', false); cellfun(@(x) (180/pi)*x, y2, 'UniformOutput', false)];

Y = cellfun(@(x,y) [x;y], Y1, Y2, 'UniformOutput', false);

leg = [ones(N, 1) * 'b = ' num2str(bs')];

figure(9),clf
plot(Y{:}), hold on
plot([0 T1+T2], (180/pi)*thetaBar1*[1 1], 'k--')
plot([0 T1+T2], (180/pi)*thetaBar2*[1 1], 'k--')
plot([0 T1+T2], (180/pi)*0*[1 1], 'k-')
legend(leg, 'Location', 'SouthEast')
xlabel('t (s)')
ylabel('$\theta$ (deg)','interpreter','latex')
ylim([-45 180])
grid
hold off
set(gca, 'YTick', [-45 0 45 90 135 180]);
