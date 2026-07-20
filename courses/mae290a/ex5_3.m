% LU Decomposition with partial pivoting (worst case growth)
%
% Mauricio de Oliveira
% September 2013

disp('> LU Decomposition with Complete Pivoting ')

disp('> Problem data')
A = [1 0 0 0 1; -1 1 0 0 1; -1 -1 1 0 1; -1 -1 -1 1 1; -1 -1 -1 -1 1]

n = size(A,2)

LU = A;

disp('> Pivot 1')
k = 1;
P1 = eye(n)
Q1 = [0 0 0 0 1; 0 1 0 0 0; 0 0 1 0 0; 0 0 0 1 0; 1 0 0 0 0]
LU = P1 * LU * Q1

max(max(abs(LU(k:n,k:n)))), LU(k,k)

disp('> Step 1')
rows = (k+1) : n;
LU(rows,k) = LU(rows,k) / LU(k,k);
LU(rows,rows) = LU(rows,rows) - LU(rows,k)*LU(k,rows)

disp('> Pivot 2')
k = k + 1;
P2 = eye(n)
Q2 = [1 0 0 0 0; 0 0 0 0 1; 0 0 1 0 0; 0 0 0 1 0; 0 1 0 0 0]
LU = P2 * LU * Q2

max(max(abs(LU(k:n,k:n)))), LU(k,k)

disp('> Step 2')
rows = (k+1) : n;
LU(rows,k) = LU(rows,k) / LU(k,k);
LU(rows,rows) = LU(rows,rows) - LU(rows,k)*LU(k,rows)

disp('> Pivot 3')
k = k + 1;
P3 = eye(n)
Q3 = [1 0 0 0 0; 0 1 0 0 0; 0 0 0 0 1; 0 0 0 1 0; 0 0 1 0 0]
LU = P3 * LU * Q3

max(max(abs(LU(k:n,k:n)))), LU(k,k)

disp('> Step 3')
rows = (k+1) : n;
LU(rows,k) = LU(rows,k) / LU(k,k);
LU(rows,rows) = LU(rows,rows) - LU(rows,k)*LU(k,rows)

disp('> Pivot 4')
k = k + 1;
P4 = eye(n)
Q4 = [1 0 0 0 0; 0 1 0 0 0; 0 0 1 0 0; 0 0 0 0 1; 0 0 0 1 0]
LU = P4 * LU * Q4

max(max(abs(LU(k:n,k:n)))), LU(k,k)

disp('> Step 4')
rows = (k+1) : n;
LU(rows,k) = LU(rows,k) / LU(k,k);
LU(rows,rows) = LU(rows,rows) - LU(rows,k)*LU(k,rows)

disp('> LU')
LU

disp('> Extract L and U')
U = triu(LU)
L = eye(n) + tril(LU,-1)

disp('> Compute P = P4 * P3 * P2 * P1')
P = P4 * P3 * P2 * P1

disp('> Compute Q = Q1 * Q2 * Q3 * Q4')
Q = Q1 * Q2 * Q3 * Q4

disp('> L U - P A Q')
L * U - P * A * Q
