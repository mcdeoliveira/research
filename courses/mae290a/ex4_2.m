% LU Decomposition with partial pivoting
%
% Modified Example 3.3.2 from Golub and Van Loan
%
% Mauricio de Oliveira
% September 2013

disp('> LU Decomposition with Partial Pivoting ')

format long e

disp('> Problem data')

e = 1e-20

A = [e 1; 1 2]
b = [1; 3]

disp('> Analytic x')
x = [1; 1-3*e]/(1-2*e)

P = [0 1; 1 0]

disp('> P A')
P * A

L = [1 0; e 1]
U = [1 2; 0 1-2*e]

disp('> L U - P A')
L*U - P*A

disp('> Numeric x')
U \ (L \ P * b)

disp('> A \ b')
A \ b

format short
