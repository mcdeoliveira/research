% QR Decomposition Algorithm
%
% Mauricio de Oliveira
% September 2013

disp('> Householder QR Decomposition - in place')

disp('> Problem data')
A = [1 1 1; -1 3 -2; 2 -2 1]

m = size(A,2)

QR = A;

disp('> Step 1')
k = 1;
rows = k : m;
x = QR(rows,k)
disp(['> ||x|| = ' num2str(norm(x))])
e1 = zeros(m-k+1,1);
e1(1) = 1
v = x + sign(x(1))*norm(x)*e1
disp('> Normalize v')
v = v / v(1)
Hk = eye(m-k+1) - (2/norm(v)^2) * v * v'
disp(['> ||Hk''*Hk-I|| = ' num2str(norm(Hk'*Hk-eye(m-k+1)))])
disp('> Triangularize')
QR(rows,rows) = Hk * QR(rows,rows)
disp('> Store v')
QR(k+1:m,k) = v(2:end)

disp('> Step 2')
k = k + 1;
rows = k : m;
x = QR(rows,k)
disp(['> ||x|| = ' num2str(norm(x))])
e1 = zeros(m-k+1,1);
e1(1) = 1
v = x + sign(x(1))*norm(x)*e1
disp('> Normalize v')
v = v / v(1)
Hk = eye(m-k+1) - (2/norm(v)^2) * v * v'
disp(['> ||Hk''*Hk-I|| = ' num2str(norm(Hk'*Hk-eye(m-k+1)))])
disp('> Triangularize')
QR(rows,rows) = Hk * QR(rows,rows)
disp('> Store v')
QR(k+1:m,k) = v(2:end)

disp('> Final QR')
QR

disp('> Extract V and R')
R = triu(QR)
V = eye(m) + tril(QR,-1)

disp('> Construct Q')
Q = eye(m);
for k = 1 : m-1
  rows = k:m;
  v = [1; V(k+1:m,k)];
  Qk = eye(m);
  Qk(rows,rows) = Qk(rows,rows) - (2/norm(v)^2) * v * v';
  Q = Q * Qk;
end
Q

disp('> Errors:')

disp(['> ||Q R - A||/||A|| = ' num2str(norm(Q*R-A)/norm(A))])
disp(['> ||Q'' Q - I|| = ' num2str(norm(Q'*Q-eye(m)))])

disp('> LAPACK''s QR');
QR = qr(A)

disp('> Matlab''s QR');
[Q, R] = qr(A)
