function [Uk,Tk] = simter(A, Uk)
% Simultaneous Iteration
%
% Mauricio de Oliveira
% September 2013

epsilon = 1e-6;
maxIters = 100;
dispIters = 10;

m = size(A,1);

rk = 1;
Tk = A;


k = 0;
disp('   k  progress');
disp('----------------------');
while (abs(rk) > epsilon && k < maxIters)

  Tkk = Tk;
  [Uk,Rk] = qr(A * Uk, 0);

  Tk = Uk' * A * Uk;
  rk = norm(tril(Tk-Tkk));

  k = k + 1;
  if k == 1 || ~mod(k, dispIters)
    fprintf(1, '%4d  %14.12f\n', k, rk);
  end

end

if mod(k, dispIters)
  fprintf(1, '%4d  %14.12f\n', k, rk);
end

disp('----------------------');
