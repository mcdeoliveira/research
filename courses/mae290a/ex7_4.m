% QR Decomposition
%
% Adapted from Trefethen and Bau, Lecture 9
%
% Mauricio de Oliveira
% September 2013

disp('> QR Decomposition')

disp('> Random Problem Data')
m = 80
rng(11);
[U,trash] = qr(randn(m));
[V,trash] = qr(randn(m));
S = diag(2.^-(0:m-1));

disp('> A = U*S*V''')
A = U*S*V';

disp('> [Q1,R1] = qr(A)')
[Q1,R1] = qr(A);

disp('> Backward errors')
disp(['  ||Q1*R1-A|| = ' num2str(norm(Q1*R1-A)/norm(A))])
disp('> Orthogonality errors')
disp(['  ||Q1''*Q1-I|| = ' num2str(norm(Q1'*Q1-eye(m)))])

disp('> [Q2,R2] = gs(A)')
[Q2,R2] = gs(A);

disp('> Backward errors')
disp(['  ||Q2*R2-A|| = ' num2str(norm(Q2*R2-A)/norm(A))])
disp('> Orthogonality errors')
disp(['  ||Q2''*Q2-I|| = ' num2str(norm(Q2'*Q2-eye(m)))])

disp('> [Q3,R3] = mgs(A)')
[Q3,R3] = mgs(A);

disp('> Backward errors')
disp(['  ||Q3*R3-A|| = ' num2str(norm(Q3*R3-A)/norm(A))])
disp('> Orthogonality errors')
disp(['  ||Q3''*Q3-I|| = ' num2str(norm(Q3'*Q3-eye(m)))])

semilogy(1:m, abs(diag(R1)),'x', 1:m, abs(diag(R2)),'o', 1:m, abs(diag(R3)),'s', 1:m, diag(S), '-', [1 m], [1 1]*eps, '-', [1 m], [1 1]*sqrt(eps), '-')
xlim([1 m])
text(m+2, eps, '\epsilon', 'FontSize', 16)
text(m+2, sqrt(eps), '\epsilon^{1/2}', 'FontSize', 16)

legend('QR', 'GS', 'MGS', 'Location', 'SouthWest')
