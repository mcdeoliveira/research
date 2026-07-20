% QR Decomposition Algorithm
%
% Mauricio de Oliveira
% September 2013

disp('> Modified Gram Schmidt QR Decomposition')

disp('> Problem data')
A = [1 1 1; -1 3 -2; 2 -2 1]

[m,n] = size(A)

R = zeros(n,n);
Q = A;

disp('> Step 1')
k = 1;
R(k,k) = norm(Q(:,k))
Q(:,k) = Q(:,k) / R(k,k)

R(k,k+1:n) = Q(:,k)'*Q(:,k+1:n)
Q(:,k+1:n) = Q(:,k+1:n) - Q(:,k)*R(k,k+1:n)

disp('> Step 2')
k = k + 1;

R(k,k) = norm(Q(:,k))
Q(:,k) = Q(:,k) / R(k,k)

R(k,k+1:end) = Q(:,k)'*Q(:,k+1:end)
Q(:,k+1:n) = Q(:,k+1:n) - Q(:,k)*R(k,k+1:n)

disp('> Step 3')
k = k + 1;

R(k,k) = norm(Q(:,k))
Q(:,k) = Q(:,k) / R(k,k)

R(k,k+1:end) = Q(:,k)'*Q(:,k+1:end)
Q(:,k+1:n) = Q(:,k+1:n) - Q(:,k)*R(k,k+1:n)

disp('> Final QR')
Q
R

disp('> Errors:')

disp(['> ||Q R - A||/||A|| = ' num2str(norm(Q*R-A)/norm(A))])
disp(['> ||Q'' Q - I|| = ' num2str(norm(Q'*Q-eye(m)))])

disp('> Matlab''s QR');
[Q, R] = qr(A)
