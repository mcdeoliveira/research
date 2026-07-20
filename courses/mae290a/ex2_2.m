% LU Decomposition Algorithm
%
% Mauricio de Oliveira
% September 2013

disp('> LU Decomposition - in place')

disp('> Problem data')
A = [1 1 1; -1 3 -2; 2 -2 1]

m = size(A,2)

LU = A;

disp('> Step 1')
k = 1;
rows = (k+1) : m;
LU(rows,k) = LU(rows,k) / LU(k,k);
LU(rows,rows) = LU(rows,rows) - LU(rows,k)*LU(k,rows)

disp('> Step 2')
k = k + 1;
rows = (k+1) : m;
LU(rows,k) = LU(rows,k) / LU(k,k);
LU(rows,rows) = LU(rows,rows) - LU(rows,k)*LU(k,rows)

disp('> LU')
LU

disp('> Extract L and U')
U = triu(LU)
L = eye(m) + tril(LU,-1)

disp('> L U - A')
L * U - A

disp('> Matlab''s LU');
[L, U] = lu(A)
