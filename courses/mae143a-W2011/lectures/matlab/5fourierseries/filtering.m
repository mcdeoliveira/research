echo on
% MAE 143 A
% Demo on Fourier Series - Filtering
%
% Mauricio de Oliveira

% Our signal has two cosine components
f1 = 1 / (4*pi)
f2 = 1 / 2

T1 = 1 / f1
T2 = 1 / f2

% We draw the signal for 5 periods of the slowest component
fs = 20*f2;
Ts = 1 / fs;
T = 5*T1;
t = [0 : Ts : T - Ts];
x1 = cos(2*pi*f1*t);
x2 = cos(2*pi*f2*t);
x = x1 + x2;

% and plot the signal
subplot(3,1,1)
plot(t, x1)
axis([0 T -2 2])
grid
title('cos(2 \pi f_1 t)')

subplot(3,1,2)
plot(t, x2)
axis([0 T -2 2])
grid
title('cos(2 \pi f_2 t)')

subplot(3,1,3)
plot(t, x)
axis([0 T -2 2])
grid
title('cos(2 \pi f_1 t) + cos(2 \pi f_2 t)')

pause

% Let us create a low pass filter with cutoff frequency at f1
wc = 2*pi*f1;
filter = tf(wc, [1 wc])

% and run the signal through the filter
y = lsim(filter, x, t);

% also compute the steady state using the frequency response
h1 = wc / (wc + j*2*pi*f1)
h2 = wc / (wc + j*2*pi*f2)
yss = abs(h1) * cos(2*pi*f1*t + phase(h1)) + ...
      abs(h2) * cos(2*pi*f2*t + phase(h2) );

% and plot the output signal
subplot(3,1,1)
plot(t, x)
axis([0 T -2 2])
grid
title('cos(2 \pi f_1 t) + cos(2 \pi f_2 t)')

subplot(3,1,2)
plot(t, x1)
axis([0 T -2 2])
grid
title('cos(2 \pi f_1 t)')

subplot(3,1,3)
plot(t, y, t, yss)
axis([0 T -2 2])
grid
title('filtered signal (with transient and steady-state)')

pause

% Let us now corrupt the signal with "noise"
xn = awgn(x, 6); 

% and plot the signal
subplot(3,1,1)
plot(t, x)
axis([0 T -2 2])
grid
title('signal: cos(2 \pi f_1 t) + cos(2 \pi f_2 t)')

subplot(3,1,2)
plot(t, xn - x)
axis([0 T -2 2])
grid
title('noise')

subplot(3,1,3)
plot(t, xn)
axis([0 T -2 2])
grid
title('signal + noise')

pause

% Let us create a low pass filter with cutoff frequency at 2*f2
wc = 2*pi*f2;
filter = tf(wc, [1 wc])

% and run the signal through the filter
y = lsim(filter, xn, t);

% and plot the output signal
subplot(3,1,1)
plot(t, xn)
axis([0 T -2 2])
grid
title('signal + noise')

subplot(3,1,2)
plot(t, x)
axis([0 T -2 2])
grid
title('signal')

subplot(3,1,3)
plot(t, y)
axis([0 T -2 2])
grid
title('filtered signal')

echo off
