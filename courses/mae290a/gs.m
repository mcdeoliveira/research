function [Q,R] = gs(A)
% QR Factorization by classic Gram-Schmidt
%
% Adapted from Golub and Van Loan, p. 231
%
% Mauricio de Oliveira
% September 2013

[m,n] = size(A);

Q = zeros(m,m);
R = zeros(n,n);

k = 1;
R(k,k) = norm(A(:,k));
Q(:,k) = A(:,k) / R(k,k);

for k = 2 : n
  R(1:k-1,k) = Q(:,1:k-1)'*A(:,k);
  Q(:,k) = A(:,k) - Q(:,1:k-1)*R(1:k-1,k);
  R(k,k) = norm(Q(:,k));
  Q(:,k) = Q(:,k) / R(k,k);
end
