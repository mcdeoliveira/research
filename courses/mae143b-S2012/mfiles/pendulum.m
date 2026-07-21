format compact

T = 4
g = 9.8
mp = 0.5
l = 0.3
J = mp*l^2/12

b = [0 0.2 0.5 1]

theta0 = pi/8

sim('SimplePendulum'), pause

theta0 = pi - 0.0001

sim('SimplePendulum'), pause

b = 1

sys = tf(1, [J+mp*l^2, b, -mp*l*g])

ctr = tf(conv([1 5],[1 6]),[1 10 0])

K = 50

rlocus(ctr*sys)
%rlocfind(ctr*sys)

num = K * ctr.num{1}
den = ctr.den{1}

T = 100
thetaBar = pi

theta0 = pi - pi/8

SimplePendulumWithFeedback
sim('SimplePendulumWithFeedback'), pause

return

thetaBar = 0
b = 0
K = 10

theta0 = pi/8

sim('SimplePendulumWithFeedback'), pause


T = 10
thetaBar = pi
b = 1
K = .1

theta0 = pi - pi/8

sim('SimplePendulumWithFeedback'), pause


tf(1, [J-mp*l^2, b, - mp*l*g])