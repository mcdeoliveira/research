% Inverse Iteration
%
% Mauricio de Oliveira
% September 2013

disp('> Inverse Iteration')

disp('> Problem data')
A = [1 1 1; -1 3 -2; 2 -2 1]

disp('> Eig(A)')
sort(eig(A))

pause

disp('> Iterate: A xk = xk')

[lk, xk] = powmethod(A, randn(size(A,1),1));

disp('> ||A xk - lk * xk||')
norm(A*xk - lk*xk)

pause

mu = 3.9
[lk, xk] = inviter(A, randn(size(A,1),1), mu);

disp('> ||A xk - lk * xk||')
norm(A*xk - lk*xk)

pause

mu = 3.999
[lk, xk] = inviter(A, randn(size(A,1),1), mu);

disp('> ||A xk - lk * xk||')
norm(A*xk - lk*xk)

pause

mu = 4
[lk, xk] = inviter(A, randn(size(A,1),1), mu);

disp('> ||A xk - lk * xk||')
norm(A*xk - lk*xk)

pause

disp('> Iterate: (A - mu I) xk = xk')

mu = 2.1
[lk, xk] = inviter(A, randn(size(A,1),1), mu);

disp('> ||A xk - lk * xk||')
norm(A*xk - lk*xk)

pause

disp('> Problem data')
A = [0 1 0; 0 0 1; -8 -2 5]

disp('> Eig(A)')
sort(eig(A))

pause

disp('> Iterate: (A - mu I) xk = xk')

mu = 3.999
[lk, xk] = inviter(A, randn(size(A,1),1), mu);

disp('> ||A xk - lk * xk||')
norm(A*xk - lk*xk)

pause

disp('> Problem data')
A = [0 1 0; 0 0 1; -4 0 3]

disp('> Eig(A)')
eig(A)

pause

disp('> Iterate: (A - mu I) xk = xk')

mu = 2.0001
[lk, xk] = inviter(A, randn(size(A,1),1), mu);

disp('> ||A xk - lk * xk||')
norm(A*xk - lk*xk)

pause

disp('> Problem data')
A = [0 1 0; 0 0 1; -5 -1 3]

disp('> Eig(A)')
eig(A)

pause

disp('> Iterate: (A - mu I) xk = xk')

mu = 2.0001 + j
[lk, xk] = inviter(A, randn(size(A,1),1), mu);

disp('> ||A xk - lk * xk||')
norm(A*xk - lk*xk)
