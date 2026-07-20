% QR Iteration
%
% Mauricio de Oliveira
% September 2013

disp('> QR Iteration')

disp('> Problem data')
A = [1 1 1; -1 3 -2; 2 -2 1]

disp('> Eig(A)')
sort(eig(A))

pause

disp('> Iterate: A Uk = Uk')

V0 = eye(size(A,1))
[Uk,Tk] = simiter(A, V0)

V0 = eye(size(A,1))
[Uk,Tk] = qriter(A, V0)

disp('> ||A Uk - Uk * Tk||')
norm(A*Uk - Uk*Tk)

pause

disp('> Problem data')
A = [0 1 0; 0 0 1; -8 -2 5]

disp('> Eig(A)')
sort(eig(A))

pause

V0 = eye(size(A,1))
[Uk,Tk] = qriter(A, V0)

disp('> ||A Uk - Uk * Tk||')
norm(A*Uk - Uk*Tk)

pause

disp('> Problem data')
A = [0 1 0; 0 0 1; -4 0 3]

disp('> Eig(A)')
eig(A)

pause

V0 = eye(size(A,1))
[Uk,Tk] = qriter(A, V0)

disp('> ||A Uk - Uk * Tk||')
norm(A*Uk - Uk*Tk)

pause

disp('> Problem data')
A = [0 1 0; 0 0 1; -5 -1 3]

disp('> Eig(A)')
eig(A)

pause

V0 = eye(size(A,1))
[Uk,Tk] = qriter(A, V0)

disp('> ||A Uk - Uk * Tk||')
norm(A*Uk - Uk*Tk)

disp('> eig(Tk(1:2,1:2))');
eig(Tk(1:2,1:2))
