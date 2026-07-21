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

% Frequency-domain analysis with the fft

N = length(x);
X = fft(x);
Xmag = 20*log10(abs(X));
Xphase = 180 * phase(X) / pi;
f = (0 : N-1) / N * fs;

subplot(2,1,1)
plot(f, Xmag), grid
ylabel('Magnitude (dB)');
xlabel('f (Hz)');
title('FFT of x(t)');

subplot(2,1,2)
plot(f, Xphase), grid
ylabel('Phase (deg)');
xlabel('f (Hz)');

pause

% shift the origin

N = length(x);
Xmag = fftshift(Xmag);
Xphase = fftshift(Xphase);
ff = fftshift(f);
ff(ff >= fs / 2) = ff(ff >= fs / 2) - fs;

subplot(2,1,1)
plot(ff, Xmag), grid
ylabel('Magnitude (dB)');
xlabel('f (Hz)');
title('FFT of x(t)');

subplot(2,1,2)
plot(ff, Xphase), grid
ylabel('Phase (deg)');
xlabel('f (Hz)');

pause

% Zoom in

subplot(2,1,1)
plot(ff, Xmag), grid
axis([-2 2 -20 60])
ylabel('Magnitude (dB)');
xlabel('f (Hz)');
title('FFT of x(t)');

subplot(2,1,2)
plot(ff, Xphase), grid
axis([-2 2 -200 200])
ylabel('Phase (deg)');
xlabel('f (Hz)');

pause

% Let us create a low pass ideal filter with cutoff frequency at f1

ind = f > 1.4 * f1 & f < fs - 1.4 * f1;
X(ind) = 1e-12;

% Plot spectrum

Xmag = fftshift(20*log10(abs(X)));
Xphase = fftshift(180 * angle(X) / pi);

subplot(2,1,1)
plot(ff, Xmag), grid
axis([-2 2 -20 60])
ylabel('Magnitude (dB)');
xlabel('f (Hz)');
title('FFT of x(t)');

subplot(2,1,2)
plot(ff, Xphase), grid
axis([-2 2 -200 200])
ylabel('Phase (deg)');
xlabel('f (Hz)');

pause

% Recover filtered signal
ysss = ifft(X);

% plot the output signal
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
plot(t, y, t, yss, t, ysss)
axis([0 T -2 2])
grid
title('filtered signal (with transient, steady-state and non-causal response)')

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

% Let us now see it in the frequency domain

N = length(xn);
Xn = fft(xn);
Xnmag = fftshift(abs(Xn));
Xnphase = fftshift(180 * angle(Xn) / pi);
f = (0 : N-1) / N * fs;
ff = fftshift(f);
ff(ff >= fs / 2) = ff(ff >= fs / 2) - fs;

subplot(2,1,1)
plot(ff, Xnmag), grid
ylabel('Magnitude (dB)');
xlabel('f (Hz)');
title('FFT of xn(t)');

subplot(2,1,2)
plot(ff, Xnphase), grid
ylabel('Phase (deg)');
xlabel('f (Hz)');

pause

ind = f > 1.4 * f2 & f < fs - 1.4 * f2;
Xn(ind) = 1e-12;

% Plot spectrum

Xnmag = fftshift(20*log10(abs(Xn)));
Xnphase = fftshift(180 * angle(Xn) / pi);

subplot(2,1,1)
plot(ff, Xnmag), grid
axis([-2 2 -20 60])
ylabel('Magnitude (dB)');
xlabel('f (Hz)');
title('FFT of x(t)');

subplot(2,1,2)
plot(ff, Xnphase), grid
axis([-2 2 -200 200])
ylabel('Phase (deg)');
xlabel('f (Hz)');

pause

% Recover filtered signal
yss = ifft(Xn);

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
plot(t, y, t, yss)
axis([0 T -2 2])
grid
title('filtered signal (causal x ideal)')

echo off
