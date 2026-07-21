format compact
echo on
%
% Demo for frequency response
%

s = tf('s')
R = 1000
L = 0.01

Z = R / (L * s + R)

bode(Z); grid
pause

w = logspace(2, 8, 30);
h = freqresp(Z, w);
h = h(:);

semilogx(w, abs(h)); grid
pause

w = linspace(0, 1e6, 1e4);
h = freqresp(Z, w);
h = h(:);

plot(w, abs(h)); grid
pause

[num1,den1] = butter(1, 1000, 's')
lowPass1 = tf(num1, den1)

bode(Z, lowPass1); grid
pause

[num2,den2] = butter(2, 1000, 's')
lowPass2 = tf(num2, den2)

bode(lowPass1, lowPass2, {1e2, 1e4}); grid
pause

[num6,den6] = butter(6, 1000, 's')
lowPass6 = tf(num6, den6)

bode(lowPass1, lowPass2, lowPass6, {1e2, 1e4}); grid
pause

[num6,den6] = butter(6, 2000, 'high', 's')
highPass6 = tf(num6, den6)

bode(lowPass6, highPass6, {1e2, 1e4}); grid
pause

[num6,den6] = butter(6, [1000 2000], 's')
bandPass6 = tf(num6, den6)

bode(lowPass6, bandPass6, highPass6, {1e2, 1e4}); grid
pause

[num6,den6] = butter(6, [1000 2000], 'stop', 's')
stopPass6 = tf(num6, den6)

bode(stopPass6, logspace(2, 4, 50)); grid

