% Cholesky Decomposition
%
% Mauricio de Oliveira
% September 2013

disp('> Cholesky Decomposition')

disp('> Problem data')
A = [2 -1 1; -1 3 -2; 1 -2 3]

m = size(A,2)

RRt = A;

disp('> Step 1')
for k = 1 : m - 1

  rows = (k+1) : m;
  RRt(k,k) = sqrt(RRt(k,k));
  RRt(rows,k) = RRt(rows,k) / RRt(k,k);
  RRt(rows,rows) = RRt(rows,rows) - RRt(rows,k)*RRt(rows,k)'

end

RRt(m,m) = sqrt(RRt(m,m));

disp('> RRt')
RRt

disp('> Extract R')
R = tril(RRt)

disp('> R R'' - A')
R * R' - A
