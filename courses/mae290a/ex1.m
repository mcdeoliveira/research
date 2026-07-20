% Matrix/Vector multiplications
%
% Mauricio de Oliveira
% September 2013

m = 500
n = 1000

A = randn(m,n);
x = randn(n,1);
b = zeros(m,1);

N = 1000

disp('Row version')

telapsed = 0;
for l = 1 : N

  tstart = tic;

  for i = 1 : m
    b(i) = 0;
    for j = 1 : n
      b(i) = b(i) + A(i,j) * x(j); 
    end
  end

  telapsed = telapsed + toc(tstart);

end

taverage = telapsed / N

disp('Column version')

telapsed = 0;
for l = 1 : N

  tstart = tic;

  b = zeros(m,1);
  for j = 1 : n
    for i = 1 : m
      b(i) = b(i) + A(i,j) * x(j); 
    end
  end

  telapsed = telapsed + toc(tstart);

end

taverage = telapsed / N

disp('Row Matlab version')

telapsed = 0;
for l = 1 : N

  tstart = tic;

  for i = 1 : m
    b(i) = A(i,:) * x; 
  end

  telapsed = telapsed + toc(tstart);

end

taverage = telapsed / N

disp('Column Matlab version')

telapsed = 0;
for l = 1 : N

  tstart = tic;

  b = zeros(m,1);
  for j = 1 : n
    b = b + A(:,j) * x(j); 
  end

  telapsed = telapsed + toc(tstart);

end

taverage = telapsed / N

disp('Matlab version')

telapsed = 0;
for l = 1 : N

  tstart = tic;
  b = A * x; 
  telapsed = telapsed + toc(tstart);

end

taverage = telapsed / N

