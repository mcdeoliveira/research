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
fs = 20*f2
Ts = 1 / fs
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

% Let us create a discrete-time low pass filter with cutoff frequency at f1
% Continuous time filter is
%
% H(s) = wc / (s + wc),  wc = 2*pi*f1;
wc = 2*pi*f1;
filter = tf(wc, [1 wc])

% Discretized filter is
%
% H(z) = wc Ts z / (z - e^(-wc Ts))
dfilter = tf([wc*Ts 0], [1 -exp(-wc*Ts)], Ts)

% continuous frequency response
N = length(x);
f = (0 : N - 1) / N * fs;
h = wc ./ (wc + j * 2 * pi * f);

% discrete-time frequency response
z = exp(j * 2 * pi * f * Ts);
dh = Ts * wc * z ./ (z - exp(-wc*Ts));

% plot frequency response
subplot(2,1,1)
plot(f, 20*log10(abs(h)), f, 20*log10(abs(dh)), ...
     [fs/2 fs/2], [-40 0], '--'), grid
axis([0 fs -40 0])
xlabel('f (Hz)')
ylabel('Mag (dB)')

subplot(2,1,2)
plot(f, 180*phase(h)/pi, f, 180*phase(dh)/pi, ...
     [fs/2 fs/2], [-100 100], '--'), grid
axis([0 fs -100 100])
xlabel('f (Hz)')
ylabel('Phase (degree)')

pause

% run the signal through the continuous-time filter
y = lsim(filter, x, t);

% run the signal through the discrete-time filter
yd = lsim(dfilter, x, t);

% and plot the output signal
subplot(3,1,1)
plot(t, x)
axis([0 T -2 2])
grid
title('cos(2 \pi f_1 t) + cos(2 \pi f_2 t)')

subplot(3,1,2)
plot(t, y)
axis([0 T -2 2])
grid
title('filtered signal (continuous)')

subplot(3,1,3)
plot(t, yd)
axis([0 T -2 2])
grid
title('filtered signal (discrete)')
