% LU Decomposition with complete pivoting
%
% Mauricio de Oliveira
% September 2013

disp('> LU Decomposition with Complete Pivoting ')

disp('> Problem data')
U = [2 1 3 -1; 0 0 4 2; 0 0 1 1; 0 0 2 -1];
L = [1 0 0 0; -1/3 1 0 0; 1/2 1/3 1 0; -1/5 1/2 0 1];
A = L*U

n = size(A,2)

LU = A;

disp('> Pivot 1')
k = 1;
P1 = [0 0 1 0; 0 1 0 0; 1 0 0 0; 0 0 0 1]
Q1 = P1
LU = P1 * LU * Q1

max(max(abs(LU(k:n,k:n)))), LU(k,k)

disp('> Step 1')
rows = (k+1) : n;
M1 = eye(n);
M1(rows,k) = -LU(rows,k) / LU(k,k)
LU(rows,k) = LU(rows,k) / LU(k,k);
LU(rows,rows) = LU(rows,rows) - LU(rows,k)*LU(k,rows)

disp('> Pivot 2')
k = k + 1;
P2 = [1 0 0 0; 0 0 1 0; 0 1 0 0; 0 0 0 1]
Q2 = [1 0 0 0; 0 0 0 1; 0 0 1 0; 0 1 0 0]
LU = P2 * LU * Q2

max(max(abs(LU(k:n,k:n)))), LU(k,k)

disp('> Step 2')
rows = (k+1) : n;
M2 = eye(n);
M2(rows,k) = -LU(rows,k) / LU(k,k)
LU(rows,k) = LU(rows,k) / LU(k,k);
LU(rows,rows) = LU(rows,rows) - LU(rows,k)*LU(k,rows)

disp('> Pivot 3')
k = k + 1;
P3 = [1 0 0 0; 0 1 0 0; 0 0 0 1; 0 0 1 0]
Q3 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]
LU = P3 * LU * Q3

max(max(abs(LU(k:n,k:n)))), LU(k,k)

disp('> Step 3')
rows = (k+1) : n;
M3 = eye(n);
M3(rows,k) = -LU(rows,k) / LU(k,k)
LU(rows,k) = LU(rows,k) / LU(k,k);
LU(rows,rows) = LU(rows,rows) - LU(rows,k)*LU(k,rows)

disp('> LU')
LU

disp('> Extract L and U')
U = triu(LU)
L = eye(n) + tril(LU,-1)

disp('> Compute P = P3 * P2 * P1')
P = P3 * P2 * P1

disp('> Compute Q = Q1 * Q2 * Q3')
Q = Q1 * Q2 * Q3

disp('> L U - P A Q')
L * U - P * A * Q
