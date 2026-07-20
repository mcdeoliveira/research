% LDL Decomposition
%
% Mauricio de Oliveira
% September 2013

disp('> LDL Decomposition')

disp('> Problem data')
A = [2 -1 1; -1 3 -2; 1 -2 1]

m = size(A,2)

LDL = A;

disp('> Step 1')
for k = 1 : m - 1

  rows = (k+1) : m;
  LDL(rows,k) = LDL(rows,k) / LDL(k,k);
  LDL(rows,rows) = LDL(rows,rows) - LDL(rows,k)*LDL(k,rows)

end

disp('> LDL')
LDL

disp('> Extract L and D')
D = diag(diag(LDL))
L = eye(m) + tril(LDL,-1)

disp('> L D L'' - A')
L * D * L' - A
