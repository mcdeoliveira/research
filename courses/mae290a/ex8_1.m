% Power Method
%
% Mauricio de Oliveira
% September 2013

disp('> Power Method')

disp('> Problem data')
A = [1 1 1; -1 3 -2; 2 -2 1]

disp('> Eig(A)')
sort(eig(A))

pause

disp('> Iterate: xk = A xk')

[lk, xk] = powmethod(A, randn(size(A,1),1));

disp('> ||A xk - lk * xk||')
norm(A*xk - lk*xk)

pause

disp('> Problem data')
A = [0 1 0; 0 0 1; -8 -2 5]

disp('> Eig(A)')
sort(eig(A))

pause

disp('> Iterate: xk = A xk')

[lk, xk] = powmethod(A, randn(size(A,1),1));

disp('> ||A xk - lk * xk||')
norm(A*xk - lk*xk)

pause

disp('> Problem data')
A = [0 1 0; 0 0 1; -4 0 3]

disp('> Eig(A)')
eig(A)

pause

disp('> Iterate: xk = A xk')

[lk, xk] = powmethod(A, randn(size(A,1),1));

disp('> ||A xk - lk * xk||')
norm(A*xk - lk*xk)

pause

disp('> Problem data')
A = [0 1 0; 0 0 1; -5 -1 3]

disp('> Eig(A)')
eig(A)

pause

disp('> Iterate: xk = A xk')

[lk, xk] = powmethod(A, randn(size(A,1),1));

disp('> ||A xk - lk * xk||')
norm(A*xk - lk*xk)
