format compact
format short e
delete badlmi.out
echo on
diary badlmi.out
% MAE 280 B - Linear Control Design
% Mauricio de Oliveira
%
% A simple example gone bad
%

% A simple stabilizable example
A = [0 1; 0 0];
Bu = [0; 1];

n = size(A,1);
m = size(Bu,2);

X = sdpvar(n,n,'symmetric');
L = sdpvar(m,n);

LMI1 = A*X+X*A'+Bu*L+L'*Bu'
LMI2 = X

LMI = set(LMI1 < 0) + set(LMI2 > 0);
options = sdpsettings('solver','sedumi');
solution =solvesdp(LMI,[],options)

eig(double(LMI1))
eig(double(LMI2))

K = double(L) / double(X)
Acl = A + Bu*K;
eig(Acl)


% A simple non-stabilizable example
A = [0 1; 0 0];
Bu = [0; 0];

n = size(A,1);
m = size(Bu,2);

X = sdpvar(n,n,'symmetric');
L = sdpvar(m,n);

LMI1 = A*X+X*A'+Bu*L+L'*Bu'
LMI2 = X

LMI = set(LMI1 < 0) + set(LMI2 > 0);
options = sdpsettings('solver','sedumi');
solution =solvesdp(LMI,[],options)

eig(double(LMI1))
eig(double(LMI2))

K = double(L) / double(X)
Acl = A + Bu*K;
eig(Acl)


% A simple non-stabilizable example (better)
A = [0 1; 0 0];
Bu = [0; 0];

n = size(A,1);
m = size(Bu,2);

X = sdpvar(n,n,'symmetric');
L = sdpvar(m,n);

LMI1 = A*X+X*A'+Bu*L+L'*Bu'+eye(n)
LMI2 = X

LMI = set(LMI1 < 0) + set(LMI2 > 0);
options = sdpsettings('solver','sedumi');
solution =solvesdp(LMI,[],options)

eig(double(LMI1))
eig(double(LMI2))


% A simple non-stabilizable example (better/alternative)
A = [0 1; 0 0];
Bu = [0; 0];

n = size(A,1);
m = size(Bu,2);

X = sdpvar(n,n,'symmetric');
L = sdpvar(m,n);

LMI1 = A*X+X*A'+Bu*L+L'*Bu'
LMI2 = X-eye(n)

LMI = set(LMI1 < 0) + set(LMI2 > 0);
options = sdpsettings('solver','sedumi');
solution =solvesdp(LMI,[],options)

eig(double(LMI1))
eig(double(LMI2))

diary off
echo off
