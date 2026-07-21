% Given a noisy version of the periodic signal
%
% x = cos(2*pi*f1*t) + sin(2*pi*f2*t)
%
% Use averaging to filter noise.

% Frequencies
f1 = 1
f2 = 1/2
T1 = 1
T2 = 1/f2

% Period is the LCM(T1, T2)
T = lcm(T1, T2)

% Time frame for a single period
t = 0 : T / 100 : T;

% periodic signal
x = cos(2*pi*f1*t)+ sin(2*pi*f2*t);


% We use awgn to add noise
y = awgn(x, 1);
yavg = y;

% Plot signals
figure(1)

subplot(2,1,1)
plot(t, y)
axis([0 T -3 2]);
title(['Noisy signal (period ' num2str(1) ')'])
grid

subplot(2,1,2)
plot(t, yavg, t, x)
axis([0 T -3 2]);
title('Averaged signal versus original signal')
grid

pause

% Loop for many periods
i = 1;
while (1) 

  i = i + 1;

  % add noise
  y = awgn(x, 1);

  % average of noisy versions
  yavg = ((i-1)*yavg + y) / i;

  % Plot signals
  figure(1)

  subplot(2,1,1)
  plot(t, y)
  axis([0 T -3 2]);
  title(['Noisy signal (period ' num2str(i) ')'])
  grid

  subplot(2,1,2)
  plot(t, x, t, yavg)
  axis([0 T -3 2]);
  title('Averaged signal versus original signal')
  grid

  pause

end
