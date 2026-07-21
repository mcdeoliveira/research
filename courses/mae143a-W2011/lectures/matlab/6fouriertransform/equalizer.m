% We will use filters of the form  

%
%          1 - w^2 + j w / beta
% H(jw) = -------------------
%          1 - w^2 + j w beta
%

%
% The peak gain is at w = 1   =>   H(j) = 1/beta^2
%
% in dB: 20 log10 H(j) = - 40 log 10 beta
%
% So gain = - 40 log 10 beta => beta = 10^(- gain / 40)
%

% Define filters with various gains
gain = -6 : 1 : 6
beta = 10.^(-gain / 40)
m = length(beta);
clear filters;
for i = 1 : m
  num = [1 1/beta(i) 1];
  den = [1 beta(i) 1];
  filters(i) = tf(num, den);
end

% plot bode diagrams on same plot
w = logspace(-1, 1, 400);
n = length(w);
[mag, phase] = bode(filters, w);
mag = 20*log10(reshape(mag, m, n));
phase = reshape(phase, m, n);

figure(1), clf

subplot(2,1,1)
semilogx(w, mag), grid
axis([.1 10 -7 7])
xlabel('Freq (rad/s)')
ylabel('Gain (dB)')
title('Filter characteristics')

subplot(2,1,2)
semilogx(w, phase), grid
axis([.1 10 -45 45])
xlabel('Freq (rad/s)')
ylabel('Phase (deg)')

pause

% Define 15 filters with gain = 6 spaced by 2/3 octave

M = 15;
gain = 6
beta = 10^(-gain / 40)
f0 = 20*2^(1/3)
fi = (2^(2/3)).^((1 : M) - 1)*f0
wi = 2 * pi * fi;
clear filters;
for i = 1 : M
  filters(i) = tf([1/wi(i)^2 1/(wi(i)*beta) 1], [1/wi(i)^2 beta/wi(i) 1]);
end

% plot bode diagrams on same plot
w = 2 * pi * logspace(0, 5, 400);
f = w / (2 * pi);
n = length(w);
[mag, phase] = bode(filters, w);
mag = 20*log10(reshape(mag, M, n));
phase = reshape(phase, M, n);

figure(1), clf
subplot(2,1,1)
semilogx(f, mag), grid
axis([10 30000 0 7])
xlabel('Freq (Hz)')
ylabel('Gain (dB)')
title('15 filters spaced by 2/3 octave with 6 dB gain')

subplot(2,1,2)
semilogx(f, phase), grid
axis([10 30000 -45 45])
xlabel('Freq (rad/s)')
ylabel('Phase (deg)')

pause

% Design a "graphic equalizer"

gains = zeros(1, M);
beta = 10.^(-gains / 40)
m = length(beta);
clear filters;
for i = 1 : M
  num = [1/wi(i)^2 1/(wi(i)*beta(i)) 1];
  den = [1/wi(i)^2 beta(i)/wi(i) 1];
  filters(i) = tf(num, den);
end

eqlzr = filters(1);
for i = 2 : M
  eqlzr = eqlzr * filters(i);
end

[mag, phase] = bode(eqlzr, w);
mag = 20*log10(reshape(mag, 1, n));
phase = reshape(phase, 1, n);

fis = [fi; fi];
nobs = [12*ones(1, M); -12*ones(1, M)];

figure(1)
subplot(2,1,1)

semilogx(f, mag), grid
hold on
semilogx(fis, nobs, '-', 'LineWidth', 1, 'Color',[0 0 0])
semilogx(fi, gains, 's', 'LineWidth', 2, 'Color',[0 0 0])
hold off
axis([10 30000 -2 2])
xlabel('Freq (Hz)')
ylabel('Gain (dB)')
title('All filters with 0 dB gain')

subplot(2,1,2)
semilogx(f, phase), grid
axis([10 30000 -60 60])
xlabel('Freq (Hz)')
ylabel('Phase (deg)')

% play audio sample

[x, fs, bits] = wavread(['ThisTornadoLovesYou.wav']);
player = audioplayer(x, fs, bits);
if (input('Play sample?', 's') == 'y') 
  disp('> Playing sample...');
  play(player)
  T = ceil(length(x)/fs);
  t = timer('StartDelay', T, 'TimerFcn','disp(''done.'')');
  start(t);
  wait(t);
end

% All gains at 2

gains = 2*ones(1, M);
beta = 10.^(-gains / 40)
m = length(beta);
clear filters;
for i = 1 : M
  num = [1/wi(i)^2 1/(wi(i)*beta(i)) 1];
  den = [1/wi(i)^2 beta(i)/wi(i) 1];
  filters(i) = tf(num, den);
end

eqlzr = filters(1);
for i = 2 : M
  eqlzr = eqlzr * filters(i);
end

[mag, phase] = bode(eqlzr, w);
mag = 20*log10(reshape(mag, 1, n));
phase = reshape(phase, 1, n);

figure(1)
subplot(2,1,1)

semilogx(f, mag), grid
hold on
semilogx(fis, nobs, '-', 'LineWidth', 1, 'Color',[0 0 0])
semilogx(fi, gains,'s','LineWidth',2,'Color',[0 0 0])
hold off
axis([10 30000 0 6])
xlabel('Freq (Hz)')
ylabel('Gain (dB)')
title('All filters with 2 dB gain')

subplot(2,1,2)
semilogx(f, phase), grid
axis([10 30000 -60 60])
xlabel('Freq (Hz)')
ylabel('Phase (deg)')

% Equalize sample
t = (0 : length(x) - 1) / fs;
% filter left chanel
yleft = lsim(eqlzr, x(:,1), t);
% filter right chanel
yright = lsim(eqlzr, x(:,2), t);

y = [yleft yright];

% play sample
player = audioplayer(y, fs, bits);
if (input('Play sample?', 's') == 'y') 
  disp('> Playing equalized sample...');
  play(player)
  T = ceil(length(x)/fs);
  t = timer('StartDelay', T, 'TimerFcn','disp(''done.'')');
  start(t);
  wait(t);
end

% Midrange boost

gains = 2*[-2 -2 -2 -2 -2 -2 -2 3 3 3 3 -2 -2 -2 -2];
beta = 10.^(-gains / 40)
m = length(beta);
clear filters;
for i = 1 : M
  num = [1/wi(i)^2 1/(wi(i)*beta(i)) 1];
  den = [1/wi(i)^2 beta(i)/wi(i) 1];
  filters(i) = tf(num, den);
end

eqlzr = filters(1);
for i = 2 : M
  eqlzr = eqlzr * filters(i);
end

[mag, phase] = bode(eqlzr, w);
mag = 20*log10(reshape(mag, 1, n));
phase = reshape(phase, 1, n);

figure(1)
subplot(2,1,1)

semilogx(f, mag), grid
hold on
semilogx(fis, nobs, '-', 'LineWidth', 1, 'Color',[0 0 0])
semilogx(fi, gains,'s','LineWidth',2,'Color',[0 0 0])
hold off
axis([10 30000 -12 12])
xlabel('Freq (Hz)')
ylabel('Gain (dB)')
title('Midrange boost')

subplot(2,1,2)
semilogx(f, phase), grid
axis([10 30000 -90 90])
xlabel('Freq (Hz)')
ylabel('Phase (deg)')

% Equalize sample
t = (0 : length(x) - 1) / fs;
% filter left chanel
yleft = lsim(eqlzr, x(:,1), t);
% filter right chanel
yright = lsim(eqlzr, x(:,2), t);

% Compose and 
y = [yleft yright];
% normalize y
y = y / max(max(abs(y)));

% play sample
player = audioplayer(y, fs, bits);
if (input('Play sample?', 's') == 'y') 
  disp('> Playing equalized sample...');
  play(player)
  T = ceil(length(x)/fs);
  t = timer('StartDelay', T, 'TimerFcn','disp(''done.'')');
  start(t);
  wait(t);
end

% Flatter midrange boost

gains = 2*[-3 -1.9 -1.9 -1.9 -2 -2 -4.7 4.7 2.1 2.1 4.7 -4.7 -2 -2 -3];
beta = 10.^(-gains / 40)
m = length(beta);
clear filters;
for i = 1 : M
  num = [1/wi(i)^2 1/(wi(i)*beta(i)) 1];
  den = [1/wi(i)^2 beta(i)/wi(i) 1];
  filters(i) = tf(num, den);
end

eqlzr = filters(1);
for i = 2 : M
  eqlzr = eqlzr * filters(i);
end

[mag, phase] = bode(eqlzr, w);
mag = 20*log10(reshape(mag, 1, n));
phase = reshape(phase, 1, n);

figure(1)
subplot(2,1,1)

semilogx(f, mag), grid
hold on
semilogx(fis, nobs, '-', 'LineWidth', 1, 'Color',[0 0 0])
semilogx(fi, gains,'s','LineWidth',2,'Color',[0 0 0])
hold off
axis([10 30000 -12 12])
xlabel('Freq (Hz)')
ylabel('Gain (dB)')
title('Flatter midrange boost')

subplot(2,1,2)
semilogx(f, phase), grid
axis([10 30000 -90 90])
xlabel('Freq (Hz)')
ylabel('Phase (deg)')

% Equalize sample
t = (0 : length(x) - 1) / fs;
% filter left chanel
yleft = lsim(eqlzr, x(:,1), t);
% filter right chanel
yright = lsim(eqlzr, x(:,2), t);

% Compose and 
y = [yleft yright];
% normalize y
y = y / max(max(abs(y)));

% play sample
player = audioplayer(y, fs, bits);
if (input('Play sample?', 's') == 'y') 
  disp('> Playing equalized sample...');
  play(player)
  T = ceil(length(x)/fs);
  t = timer('StartDelay', T, 'TimerFcn','disp(''done.'')');
  start(t);
  wait(t);
end

% Highs and lows

gains = 2*[2 1 0 0 -.5 -.3 -.5 -.4 -.3 -.5 0 0 0 3.5 4.5];
beta = 10.^(-gains / 40)
m = length(beta);
clear filters;
for i = 1 : M
  num = [1/wi(i)^2 1/(wi(i)*beta(i)) 1];
  den = [1/wi(i)^2 beta(i)/wi(i) 1];
  filters(i) = tf(num, den);
end

eqlzr = filters(1);
for i = 2 : M
  eqlzr = eqlzr * filters(i);
end

[mag, phase] = bode(eqlzr, w);
mag = 20*log10(reshape(mag, 1, n));
phase = reshape(phase, 1, n);

figure(1)
subplot(2,1,1)

semilogx(f, mag), grid
hold on
semilogx(fis, nobs, '-', 'LineWidth', 1, 'Color',[0 0 0])
semilogx(fi, gains,'s','LineWidth',2,'Color',[0 0 0])
hold off
axis([10 30000 -12 12])
xlabel('Freq (Hz)')
ylabel('Gain (dB)')
title('Highs and lows')

subplot(2,1,2)
semilogx(f, phase), grid
axis([10 30000 -90 90])
xlabel('Freq (Hz)')
ylabel('Phase (deg)')

% Equalize sample
t = (0 : length(x) - 1) / fs;
% filter left chanel
yleft = lsim(eqlzr, x(:,1), t);
% filter right chanel
yright = lsim(eqlzr, x(:,2), t);

% Compose and 
y = [yleft yright];
% normalize y
y = y / max(max(abs(y)));

% play sample
player = audioplayer(y, fs, bits);
if (input('Play sample?', 's') == 'y') 
  disp('> Playing equalized sample...');
  play(player)
  T = ceil(length(x)/fs);
  t = timer('StartDelay', T, 'TimerFcn','disp(''done.'')');
  start(t);
  wait(t);
end

% Some bad shape

gains = [-12 -6 12 -6 -.5 -.3 12 0 -12 -.5 0 0 12 -12 6];
beta = 10.^(-gains / 40)
m = length(beta);
clear filters;
for i = 1 : M
  num = [1/wi(i)^2 1/(wi(i)*beta(i)) 1];
  den = [1/wi(i)^2 beta(i)/wi(i) 1];
  filters(i) = tf(num, den);
end

eqlzr = filters(1);
for i = 2 : M
  eqlzr = eqlzr * filters(i);
end

[mag, phase] = bode(eqlzr, w);
mag = 20*log10(reshape(mag, 1, n));
phase = reshape(phase, 1, n);

figure(1)
subplot(2,1,1)

semilogx(f, mag), grid
hold on
semilogx(fis, nobs, '-', 'LineWidth', 1, 'Color',[0 0 0])
semilogx(fi, gains,'s','LineWidth',2,'Color',[0 0 0])
hold off
axis([10 30000 -12 12])
xlabel('Freq (Hz)')
ylabel('Gain (dB)')
title('Some bad shape')

subplot(2,1,2)
semilogx(f, phase), grid
axis([10 30000 -90 90])
xlabel('Freq (Hz)')
ylabel('Phase (deg)')

% Equalize sample
t = (0 : length(x) - 1) / fs;
% filter left chanel
yleft = lsim(eqlzr, x(:,1), t);
% filter right chanel
yright = lsim(eqlzr, x(:,2), t);

% Compose and 
y = [yleft yright];
% normalize y
y = y / max(max(abs(y)));

% play sample
player = audioplayer(y, fs, bits);
if (input('Play sample?', 's') == 'y') 
  disp('> Playing equalized sample...');
  play(player)
  T = ceil(length(x)/fs);
  t = timer('StartDelay', T, 'TimerFcn','disp(''done.'')');
  start(t);
  wait(t);
end
