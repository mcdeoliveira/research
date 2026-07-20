sys = tf(3*[1 1],[1 1 25 12 12])
hold off
clf
rlocus(sys);
hold on 
r = rlocus(sys,4);
plot(r,'*')
h = text(real(r(1)), imag(r(1)) + 0.8, 'K = 4', 'HorizontalAlignment', 'center', 'FontSize', 12);
axis([-3, 1, -7 7])
hold off
print -depsc robex.eps

