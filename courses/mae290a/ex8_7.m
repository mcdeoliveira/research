% QR Eigenvalue Algorithm
%
% Mauricio de Oliveira
% September 2013

disp('> QR Algorithm')

disp('> Problem data')
A = [1 1 1; -1 3 -2; 2 -2 1]
m = size(A,1);

disp('> Iterate: [Q,R] = qr(Ak); Ak = R*Q')

[U,Ak] = hess(A)

k = 1
while (norm(tril(Ak,-1)) > 1e-5)

  [Q,R] = qr(Ak);
  Ak = R*Q
  U = U * Q;

  k = k + 1

  pause

end

T = Ak;

disp('> ||A - U T U''||')
norm(A - U*T*U')

disp('> ||U'' U - I||')
norm(U'*U - eye(m))
