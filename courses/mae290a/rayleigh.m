function [lk, xk] = inviter(A, xk, mu)
% Inverse Iteration
%
% Mauricio de Oliveira
% September 2013

epsilon = 1e-9;
maxIters = 100;
dispIters = 1;

m = size(A,1);

xk = xk / norm(xk);
lk = xk' * A * xk;

if (nargin == 3)
  muk = mu;
else
  muk = lk;
end
Ak = A - muk * eye(m);
rk = 1;

k = 0;
disp('   k   lambda    progress');
disp('--------------------------------');
while (abs(rk) > epsilon && k < maxIters)

  xk = Ak \ xk;
  xk = xk / norm(xk);

  lkk = lk;
  lk = xk' * A * xk;
  muk = lk;
  Ak = A - muk * eye(m);
  rk = abs(lk - lkk);

  k = k + 1;
  if k == 1 || ~mod(k, dispIters)
    fprintf(1, '%4d  %+f  %14.12f\n', k, lk, rk);
  end

end

if mod(k, dispIters)
  fprintf(1, '%4d  %+f  %14.12f\n', k, lk, rk);
end

disp('--------------------------------');
