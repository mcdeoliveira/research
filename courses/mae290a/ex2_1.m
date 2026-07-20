% LU Decomposition
%
% Mauricio de Oliveira
% September 2013

disp('> LU Decomposition')

disp('> Problem data')
A = [1 1 1; -1 3 -2; 2 -2 1]

m = size(A,2)

U = A;

disp('> Step 1')
M1 = [1, zeros(1,m-1); -U(2:m,1)/U(1,1), eye(m-1)]
U = M1 * U

disp('> Step 2')
M2 = [1, zeros(1,m-2); -U(3:m,2)/U(2,2), eye(m-2)]
M2 = [1, zeros(1,m-1); zeros(m-1,1) M2]
U = M2 * U

disp('> Compute L = inv(M2*M1)')
M = M2 * M1
L = inv(M)

disp('> L U - A')
L * U - A
