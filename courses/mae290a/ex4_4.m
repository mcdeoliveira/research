% LU Decomposition with partial pivoting (worst case growth)
%
% Mauricio de Oliveira
% September 2013

disp('> LU Decomposition with Partial Pivoting ')

disp('> Problem data')
A = [1 0 0 0 1; -1 1 0 0 1; -1 -1 1 0 1; -1 -1 -1 1 1; -1 -1 -1 -1 1]

disp('> Matlab''s LU');
disp('[L, U] = lu(A)');
[L, U, P] = lu(A)

pause

disp('> Problem data')
m = 12
A = eye(m) - tril(ones(m,m),-1);
A(1:m-1,m) = ones(m-1,1)

disp('> Matlab''s LU');
disp('[L, U] = lu(A)');
[L, U, P] = lu(A)
