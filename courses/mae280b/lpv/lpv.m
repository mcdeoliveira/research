function [t, x] = lpv(t, w, xi, A, Bu, Cy, Ac, Bc, Cc)
%
% Linear parameter-varing simulation
%
% Author: Mauricio de Oliveira
% Date: March 2011
%

n = size(A{1},2);
nc = size(Ac{1},2);
m = size(Bu,2);
p = size(Cy{1},1);

N = length(A);

if (size(t,1) ~= 1 && size(t,2) ~= 1)
   error('t must be a vector');
end

if ( size(t,1) > 1 )
  t = t';
end

M = length(t);

if ( size(w,1) ~= M )
   error('w must have the same number of rows as t');
end

if ( size(xi,1) ~= M )
   error('xi must have the same number of rows as t');
end

if (M == 1)
  t = [0 t];
  w = [w; w];
  xi = [xi; xi];
end

if ( size(w, 2) ~= m + p )
   error('w must have the same number or columns as matrix [Bu Cy'']');
end

if ( size(xi, 2) ~= N )
   error('xi must have the same number or columns as number of models');
end

Bw = [Bu zeros(n,p)];
Dyw = [zeros(p,m) eye(p)];

x0 = zeros(n + nc, 1);
[t, x] = ode45(@dxdt, [0 max(t)], x0);

  function xdot = dxdt(tt, xx)

    % Interpolate input and xi
    xixi = interp1(t, xi, tt); 
    ww = interp1(t, w, tt); 

    % Construct current model
    i = 1;
    AXi = xixi(i) * A{i};
    CyXi = xixi(i) * Cy{i};
    AcXi = xixi(i) * Ac{i};
    BcXi = xixi(i) * Bc{i};
    CcXi = xixi(i) * Cc{i};
    for i = 2 : N
      AXi = AXi + xixi(i) * A{i};
      CyXi = CyXi + xixi(i) * Cy{i};
      AcXi = AcXi + xixi(i) * Ac{i};
      BcXi = BcXi + xixi(i) * Bc{i};
      CcXi = CcXi + xixi(i) * Cc{i};
    end
    Acl = [AXi, Bu * CcXi; BcXi * CyXi, AcXi];
    Bcl = [Bw; BcXi * Dyw];

    % Compute time-derivative
    xdot = Acl * xx + Bcl * ww';

  end

end
