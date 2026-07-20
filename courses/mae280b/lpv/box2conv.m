function xi = box2conv(p, v)
%
% xi = box2conv(p, v)
%
% xi is the convex combination of the 4 columns of v
%
% Author: Mauricio de Oliveira
% Date: March 2011
%

% make p have row size 2
if ( size(p, 1) > 2 )
  p = p';
end

if ( size(p, 1) ~= 2 )
  error('I can only handle 2 parameters')
end

if ( size(v, 2) ~= 4 )
  error('I can only handle 4 vertices')
end

m = size(v, 1);
q = size(p, 2);
if ( size(p, 1) ~= m )
  error('v and p have to have the same row size')
end

% find extremes
vmax = max(v');
vmin = min(v');

imax = {};
imin = {};
for i = 1 : m
  imax{i} = find(v(i,:) == vmax(i));
  imin{i} = find(v(i,:) == vmin(i));
end

iimax = imax{1};
iimin = imin{1};
for i = 2 : m
  iimax = intersect(iimax, imax{i});
  iimin = intersect(iimin, imin{i});
end

iothers = setdiff(1 : 4, [iimax, iimin]);

Amax = v(:, iothers) - v(:, iimax)*ones(1, 2);
Amin = v(:, iothers) - v(:, iimin)*ones(1, 2);

% run max
xi = zeros(4, q);
xi(iothers, :) = Amax \ (p - v(:, iimax)*ones(1, q));
xi(iimax, :) = 1 - sum(xi);

% see if there are any negative indices
ineg = find(prod(sign(xi) + 1) == 0);

if ( ~isempty(iothers) )

  % run min
  q = length(ineg);
  xi(:, ineg) = zeros(4, q);
  xi(iothers, ineg) = Amin \ (p(:, ineg) - v(:, iimin)*ones(1, q));
  xi(iimin, ineg) = 1 - sum(xi(:, ineg));

end
