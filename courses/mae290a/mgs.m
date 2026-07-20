function [Q,R] = mgs(A)
% QR Factorization by Modified Gram-Schmidt
%
% Adapted from Golub and Van Loan, p. 232
%
% Mauricio de Oliveira
% September 2013

[m,n] = size(A);

Q = zeros(m,m);
R = zeros(n,n);

for k = 1 : n
  R(k,k) = norm(A(:,k));
  Q(:,k) = A(:,k) / R(k,k);
  R(k,k+1 : n) = Q(:,k)'*A(:,k+1 : n);
  A(:,k+1 : n) = A(:,k+1 : n) - Q(:,k)*R(k,k+1 : n);
end
