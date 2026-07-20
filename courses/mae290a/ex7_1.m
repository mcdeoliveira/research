% QR Decomposition Algorithm
%
% Mauricio de Oliveira
% September 2013

disp('> Gram Schmidt QR Decomposition')

disp('> Problem data')
A = [1 1 1; -1 3 -2; 2 -2 1]

m = size(A,2)

Q = zeros(m,n);
R = zeros(n,n);

disp('> Step 1')
k = 1;
Q(:,k) = A(:,k);
R(k,k) = norm(Q(:,k))
Q(:,k) = Q(:,k) / R(k,k)

disp('> Step 2')
k = k + 1;

R(1:k-1,k) = A(:,k)'*Q(:,1:k-1)
zk = A(:,k) - Q(:,1:k-1)*R(1:k-1,k)

Q(:,k) = zk;
R(k,k) = norm(Q(:,k))
Q(:,k) = Q(:,k) / R(k,k)

disp('> Step 3')
k = k + 1;

R(1:k-1,k) = A(:,k)'*Q(:,1:k-1)
zk = A(:,k) - Q(:,1:k-1)*R(1:k-1,k)

Q(:,k) = zk;
R(k,k) = norm(Q(:,k))
Q(:,k) = Q(:,k) / R(k,k)

disp('> Final QR')
Q
R

disp('> Errors:')

disp(['> ||Q R - A||/||A|| = ' num2str(norm(Q*R-A)/norm(A))])
disp(['> ||Q'' Q - I|| = ' num2str(norm(Q'*Q-eye(m)))])

disp('> Matlab''s QR');
[Q, R] = qr(A)
