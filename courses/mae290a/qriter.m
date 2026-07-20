function [Uk,Ak] = simter(A, Uk)
% Simultaneous Iteration
%
% Mauricio de Oliveira
% September 2013

epsilon = 1e-6;
maxIters = 100;
dispIters = 10;

m = size(A,1);

Ak = A;
Tk=0;

rk = 1;

k = 0;
disp('   k  progress');
disp('----------------------');
while (abs(rk) > epsilon && k < maxIters)

  Akk = Ak;

  [Qk,Rk] = qr(Ak);
  Ak = Rk*Qk;
  Uk = Uk*Qk;

  rk = norm(tril(Ak-Akk));

  k = k + 1;
  if k == 1 || ~mod(k, dispIters)
    fprintf(1, '%4d  %14.12f\n', k, rk);
  end

end

if mod(k, dispIters)
  fprintf(1, '%4d  %14.12f\n', k, rk);
end

disp('----------------------');
