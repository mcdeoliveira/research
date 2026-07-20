% Loss of precision in LU Decomposition
%
% Modified Example 3.3.1 from Golub and Van Loan
%
% Mauricio de Oliveira
% September 2013

format long e

for e = [1e-4 1e-8 1e-12 1e-16 1e-20]

  clc
  disp(['> e = ' num2str(e)])

  A = [e 1; 1 2]
  b = [1; 3]

  disp('> Analytic x')
  x = [1; 1-3*e]/(1-2*e)

  L = [1 0; 1/e 1]
  U = [e 1; 0 2-1/e]

  disp('> L U - A')
  L*U - A

  disp('> Numeric x')
  U \ (L \ b)

  pause

end

format short
