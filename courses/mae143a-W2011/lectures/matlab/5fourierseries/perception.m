echo on
% MAE 143 A
% Demo on Fourier Series - Perception
%
% Mauricio de Oliveira

% First part is on the importance of the fundamental harmonic

% Let us generate a complex tone by adding harmonics

% The fundamental frequency is a piano middle A (440 Hz)
f0 = 440
T0 = 1/f0

% we will sample the wave at 22 Khz
fs = 22000

% and generate 500 periods of the complex tone
Ts = 1 / fs;
T = 500*T0;
t = [0 : Ts : T - Ts];

% we will create three different tones with harmonic coefficients
k1 = [1 2/3 1/4 1/8 1/16 1/32];
k2 = [0 2/3 0   1/8 0    1/32];
k3 = [0 2/3 1/4 1/8 1/16 1/32];

x1 = zeros(size(t));
x2 = zeros(size(t));
x3 = zeros(size(t));

N = 6;
for i = 1 : N

  x1 = x1 + k1(i) * cos(2*pi*f0*i*t);
  x2 = x2 + k2(i) * cos(2*pi*f0*i*t);
  x3 = x3 + k3(i) * cos(2*pi*f0*i*t);

end

% We can now play the three tones

player = audioplayer(x1, fs);
play(player)

pause

player = audioplayer(x2, fs);
play(player)

pause

% Can you hear the fundamental?

player = audioplayer(x3, fs);
play(player)

pause

% We will now play with the phase
p1 = [0 0 0 0 0 0];
p2 = [0 40 300 120 270 30]*pi/180;
p3 = [0 60 0 -60 0 -90]*pi/180;

x1 = zeros(size(t));
x2 = zeros(size(t));
x3 = zeros(size(t));

N = 6
for i = 1 : N

  x1 = x1 + k1(i) * cos(2*pi*f0*i*t + p1(i));
  x2 = x2 + k1(i) * cos(2*pi*f0*i*t + p2(i));
  x3 = x3 + k1(i) * cos(2*pi*f0*i*t + p3(i));

end

% We can now play the three tones

player = audioplayer(x1, fs);
play(player)

pause

player = audioplayer(x2, fs);
play(player)

pause

player = audioplayer(x3, fs);
play(player)

pause

% In the second part we will hear a beat

f1 = 12000/pi;
f2 = 12000/pi + 4000/pi;
x1 = cos(2*pi*f1*t);
x2 = cos(2*pi*f2*t);
x3 = x1 + x2;

% We can now play the three tones

player = audioplayer(x1, fs);
play(player)

pause

player = audioplayer(x2, fs);
play(player)

pause

% Can you hear the lower tone beat?

player = audioplayer(x3, fs);
play(player)

echo off
