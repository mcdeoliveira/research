% LU Decomposition with partial pivoting
%
% Mauricio de Oliveira
% September 2013

disp('> LU Decomposition with Partial Pivoting ')

disp('> Problem data')
U = [2 1 3 -1; 0 0 1 3; 0 0 1 1; 0 0 2 -1];
L = [1 0 0 0; -1/3 1 0 0; 2/3 1/3 1 0; -1/5 2/5 0 1];
A = L*U

m = size(A,2)

LU = A;

disp('> Pivot 1')
P1 = eye(m);
LU = P1 * LU

disp('> Step 1')
k = 1;
rows = (k+1) : m;
M1 = eye(m);
M1(rows,k) = -LU(rows,k) / LU(k,k)
LU(rows,k) = LU(rows,k) / LU(k,k);
LU(rows,rows) = LU(rows,rows) - LU(rows,k)*LU(k,rows)

disp('> Pivot 2 is zero, skip Gauss transform')
P2 = eye(m)
LU = P2 * LU
M2 = eye(m);
k = k + 1;

disp('> Pivot 3')
P3 = [1 0 0 0; 0 1 0 0; 0 0 0 1; 0 0 1 0]
LU = P3 * LU

disp('> Step 3')
k = k + 1;
rows = (k+1) : m;
M3 = eye(m);
M3(rows,k) = -LU(rows,k) / LU(k,k)
LU(rows,k) = LU(rows,k) / LU(k,k);
LU(rows,rows) = LU(rows,rows) - LU(rows,k)*LU(k,rows)

disp('> LU')
LU

disp('> Calculate L = inv(M2*P2*M1*P1)')
L = inv(M3*P3*M2*P2*M1*P1)

disp('> Extract U')
U = triu(LU)

disp('> L U - A')
L * U - A

disp('> Matlab''s LU');
disp('[L, U] = lu(A)');
[L, U] = lu(A)

pause

disp('> Extract L and U')
U = triu(LU)
L = eye(m) + tril(LU,-1)

disp('> Compute P = P3 * P2 * P1')
P = P3 * P2 * P1

disp('> L U - P A')
L * U - P * A

disp('> Matlab''s PLU');
[L, U, P] = lu(A)

