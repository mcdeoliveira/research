% MAE 280 B - Winter 2012
%
% Store the N vertices of your plant model into a cell-array, e.g.
%
% A{1} = A1;
% Cy{1} = Cy1;
%
% stores the first vertex. Define a single matrix Bu.
% 
% Store N LQG controllers on the cell-array KLQG and the N vertices of
% your gain scheduled controller into the cell-array KGS and run this
% script to simulate your controller. 
%
% For example, store the matrices (ALQG1, BLQG1, CLQG1) of the LQR
% controller calculated at vertex 1 into 
%
% KLQG{1}.A = ALQG1; 
% KLQG{1}.B = BLQG1; 
% KLQG{1}.C = CLQG1; 
%
% and the the matrices (AGS1, BGS1, CGS1) of the vertex 1 of your
% gain-scheduled controller in 
%
% KGS{1}.A = AGS1; 
% KGS{1}.B = BGS1; 
% KGS{1}.C = CGS1;
%
% and run gssimulation to simulate your controller.
%
% ATTENTION: Make sure that the controller vertices match the values
% in the vector:

N = 4;
v = [0.35 4.35 0.35 4.35; ...
     -365 -365 380 380];

% If not, either reorder v or your controllers before you attempt to
% simulate the system!

% Generate trajectory of uncertainty beta and gamma

t1 = 0 : 0.1 : 10;
t2 = 10.1 : 0.1 : 20;
t3 = 20.1 : 0.1 : 30;
t4 = 30.1 : 0.1 : 40;
t = [t1 t2 t3 t4];

% 0.35 < beta < 4.35
beta = [...
  interp1([0 10], [2 0.5], t1'); ...
  interp1([10.1 20], [0.5 0.5], t2'); ...
  interp1([20.1 30], [0.5 4], t3'); ...
  interp1([30.1 40], [4 4], t4'); ...
];

% -365 < gamma < 380
gamma = [...
  interp1([0 10], [350 350], t1'); ...
  interp1([10.1 20], [350 -350], t2'); ...
  interp1([20.1 30], [-350 -350], t3'); ...
  interp1([30.1 40], [-350 350], t4'); ...
];

figure(1)
plot(beta, gamma), grid
xlabel('\beta')
ylabel('\gamma')
axis([0.35 4.35 -365 380]);
title('Trajectory of the uncertain parameters \beta x \gamma')

% compute xis
xi = box2conv([beta gamma]', v)';

% Compute input noise
M = length(t);
w = 0.1*randn(M, 3);

% simulate gain-scheduled controller
Ac = {};
Bc = {};
Cc = {};
for i = 1 : N

  Ac{i} = KGS{i}.A;
  Bc{i} = KGS{i}.B;
  Cc{i} = KGS{i}.C;

end

disp('simulate gain-scheduled controller')
[tgs, xgs] = lpv(t, w, xi, A, Bu, Cy, Ac, Bc, Cc);

% simulate LQG controller
Ac = {};
Bc = {};
Cc = {};
for i = 1 : N

  Ac{i} = KLQG{i}.A;
  Bc{i} = KLQG{i}.B;
  Cc{i} = KLQG{i}.C;

end

disp('simulate scheduled lqg controller')
[tlqg, xlqg] = lpv(t, w, xi, A, Bu, Cy, Ac, Bc, Cc);

figure(2)
subplot(3,1,1)
plotyy(t, beta, t, gamma), grid
title('\beta and \gamma')
subplot(3,1,2)
plot(tgs, xgs(:,1)), grid
title('angle of atack -- gain-scheduled controller')
subplot(3,1,3)
plot(tlqg, xlqg(:,1)), grid
title('angle of atack -- scheduled LQG controller')

figure(3)
subplot(3,1,1)
plotyy(t, beta, t, gamma), grid
title('\beta and \gamma')
subplot(3,1,2)
plot(tgs, xgs(:,2)), grid
title('pitch rate -- gain-scheduled controller')
subplot(3,1,3)
plot(tlqg, xlqg(:,2)), grid
title('pitch rate -- scheduled LQG controller')

figure(4)
subplot(3,1,1)
plotyy(t, beta, t, gamma), grid
title('\beta and \gamma')
subplot(3,1,2)
plot(tgs, xgs(:,1), tlqg, xlqg(:,1)), grid
ylim([-0.02, 0.02]);
legend('GS','LQG');
title('angle of atack')
subplot(3,1,3)
plot(tgs, xgs(:,2), tlqg, xlqg(:,2)), grid
ylim([-0.2, 0.2]);
legend('GS','LQG');
title('pitch rate')
