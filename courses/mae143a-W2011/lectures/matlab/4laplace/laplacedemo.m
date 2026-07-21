echo on
% MAE 143 A
% Demo on Laplace Transforms and Matlab
%
% Mauricio de Oliveira

% Let us start with a linear ODE
%
% y'' + 2 y' + 4 y = x' - x
%
% Using Laplace Transforms we have
%
% Y(s) = H(s) X(s), H(s) = (s - 1) / (s^2 + 2 s + 4)
%
% In matlab we define H(s) as a transfer function (tf)
%

H = tf([1 -1], [1 2 4])

% The vector [1 -1] contains the coefficients of the polynomial (s - 1);
% Likewise [1 2 4] are the coefficients of the polynomial (s^2 + 2 s + 4)

% We can compute the poles of H(s)
pole(H)

% and the zeros
zero(H)

% In this case this is enough to conclude that H is stable.

% We can easily convert to state space
Hss = ss(H)

% with which we can check that the eigenvalues of A are the same as
% the poles of H
eig(Hss.a)

% Now let's plot the impulse response
figure(1), clf
impulse(H), grid, pause

% We can also compute the impulse response symbolically using Matlab's
% limited symbolic processing capability through Maple 
syms s 
Htf = ([s^2 s 1] * H.num{1}') / ([s^2 s 1] * H.den{1}') 
h = ilaplace(Htf)

% We can also use residue to construct our response
[r, p, k] = residue(H.num{1}, H.den{1})

% In this case the impulse response is of the form
%
% h(t) = r(1) exp(p(1)*t) + r(2) exp(p(2)*t)
%
% Because p's and r's are complex we have
%
% p(1) = pr1 + j pi1, p(2) = pr1 - j pi1
% r(1) = rr1 + j ri1, r(2) = rr1 - j ri1
%
% h(t) = (rr1 + j ri1 ) exp(pr1*t) { cos(pi1*t) + j sin(pi1*t) }
%      + (rr1 - j ri1 ) exp(pr1*t) { cos(pi1*t) - j sin(pi1*t) }
%      = 2 exp(pr1*t) { rr1 cos(pi1*t) - ri1 sin(pi1*t) }
pr1 = real(p(1));  pi1 = imag(p(1));
rr1 = real(r(1));  ri1 = imag(r(1));
t = 0 : 0.01: 9;
h = 2 * exp(pr1*t) .* (rr1 * cos(pi1*t) - ri1 * sin(pi1*t));

plot(t, h), grid
title('Calculated impulse response')
ylabel('h(t)')
xlabel('t'), pause

% We can plot the step response
step(H), grid, pause

% as well as the response to an arbitrary signal
t1 = 0 : 0.01 : 1;
t2 = 1.01 : 0.01 : 4;
t3 = 4.01 : 0.01 : 8;
t = [t1 t2 t3];
x = [ ones(size(t1)) ... % step
      exp(-2*(t2 - 1)) ... % exponential
      2*sin(pi*(t3 - 4)) ];

subplot(2, 1, 1)
plot(t, x), grid
title('Input signal')
ylabel('x(t)')
xlabel('t')

% for which we compute the response
y = lsim(H, x, t);

% and plot
subplot(2, 1, 2)
plot(t, y), grid
title('Output signal')
ylabel('y(t)')
xlabel('t')

echo off

