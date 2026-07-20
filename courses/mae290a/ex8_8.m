% QR Eigenvalue Algorithm
%
% Mauricio de Oliveira
% September 2013

disp('> Shifted QR Algorithm')

disp('> Problem data')
A = [1 1 1; -1 3 -2; 2 -2 1]
m = size(A,1);

disp('> Iterate: [Q,R] = qr(Ak); Ak = R*Q')

[U,Ak] = hess(A)

k = 1
while (norm(tril(Ak,-1)) > 1e-5)

  mu = Ak(m,m);

  [Q,R] = qr(Ak - mu*eye(m));
  Ak = R*Q + mu*eye(m)
  U = U * Q;

  k = k + 1

  pause

end

T = Ak;

disp('> ||A - U T U''||')
norm(A - U*T*U')

disp('> ||U'' U - I||')
norm(U'*U - eye(m))
