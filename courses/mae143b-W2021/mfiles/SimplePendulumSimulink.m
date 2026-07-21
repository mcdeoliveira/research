% Simulation of the Simple Pendulum using Simulink
%
% Author: Mauricio de Oliveira
% Date: 05/10/2014

format compact

if ~exist('setp') || (setp == 1)

  disp('Reseting pendulum parameters')

  % set simple pendulum model parameters
  g = 9.8
  m = 0.5
  l = 0.3
  r = l/2
  J = m*l^2/12
  Jr = (J+m*r^2)

  b = 0.01

  % linearize around
  thetaBar = 0

  % initial angle
  theta0 = pi/2

  % set simulation time
  T = 10

  % set constant torque
  tau = 0

  % set setp to 1 to reset parameters
  setp = 0

end

% state space parameters
a1 = b/Jr
a2 = m*g*r/Jr
b2 = 1/Jr

% linearization
st = sin(thetaBar)
ct = cos(thetaBar)

% set initial conditions
x10 = 0
x20 = theta0

SimplePendulum
