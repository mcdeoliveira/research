% QR Decomposition
%
% Adapted from Trefethen and Bau, Lecture 9
%
% Mauricio de Oliveira
% September 2013

disp('> Loss of Orthogonality in QR Decomposition')

format long e

m = 3;

for e = [1e-4 1e-8 1e-12 1e-16]

  clc
  disp(['> e = ' num2str(e)])

  disp('> Matrix with e away from being LD ')
  A = [1 1 1; 1 -1 1; 1 -2 -1] * [1 0 0; 1 e 1; 0 0 1]'

  disp('> [Q1,R1] = qr(A)')
  [Q1,R1] = qr(A)

  disp('> Backward errors')
  disp(['  ||Q1*R1-A|| = ' num2str(norm(Q1*R1-A)/norm(A))])
  disp('> Orthogonality errors')
  disp(['  ||Q1''*Q1-I|| = ' num2str(norm(Q1'*Q1-eye(m)))])

  disp('> [Q2,R2] = gs(A)')
  [Q2,R2] = gs(A)

  disp('> Backward errors')
  disp(['  ||Q2*R2-A|| = ' num2str(norm(Q2*R2-A)/norm(A))])
  disp('> Orthogonality errors')
  disp(['  ||Q2''*Q2-I|| = ' num2str(norm(Q2'*Q2-eye(m)))])

  pause

end

format short


