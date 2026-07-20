% Using QR Decomposition to solve least squares
%
% Mauricio de Oliveira
% September 2013

disp('> Householder QR Decomposition - in place')

disp('> Problem data')
A = [1 1 1; -1 3 -2; 2 -2 1; 0 1 1; 2 1 1]
b = [1; -2; 1; 0; 1]

[m,n] = size(A)

disp('> QR Decomposition')
[Q,R] = qr(A)

disp('> Partition Q and R')
R1 = R(1:n,1:n)
Q1 = Q(:,1:n)
Q2 = Q(:,n+1:end)

disp('> Least Squares Solution')
x = R1 \ (Q1' * b)

disp('> Residual error')
norm(Q2'*b)

disp('> Residual error')
norm(A*x-b)

disp('> Matlab Slash')
x = A \ b