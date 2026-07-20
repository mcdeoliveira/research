% Cholesky x LU Decomposition
%
% Mauricio de Oliveira
% September 2013

disp('> Cholesky x LU Decomposition in Matlab slash')

disp('> Problem data')
m = 500;
R = randn(m);

% symmetric and positive definite
A = R * R';

% symmetric and not positive definite
B = R * diag(sign(randn(m,1))) * R';

% unsymmetric
C = A;
C(m,1) = C(1,m) - 1;

b = randn(m,1);

% Solve symmetrix positive definite system
disp('> Symmetric positive definite');
tstart = tic;
x = A \ b;
telapsed = toc(tstart)

% Solve symmetrix not positive definite system
disp('> Symmetric not positive definite');
tstart = tic;
x = B \ b;
telapsed = toc(tstart)

% Solve unsymmetrix system
disp('> Unsymetric');
tstart = tic;
x = C \ b;
telapsed = toc(tstart)
