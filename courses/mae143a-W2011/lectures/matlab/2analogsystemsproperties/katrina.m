% define filaname for convinience
filename = 'katrina/katrina_goes';

% read images in a three dimensional array
disp('> Reading frames...')
N = 386;
x = imread([filename '_001.jpg']);
% prealocate memory
x(:,:,:,floor(N/10)) = x;
j = 1;
for i = 11 : 10 : N
  x(:,:,:,j) = imread([filename '_' num2str(i,'%03d') '.jpg']);
  j = j + 1;
end
M = j;

% plot 16 samples
disp('> Plotting samples...')
figure(1)
j = 1;
for i = 1 : floor(M / 16) : M
  subplot(4, 4, j);
  image(x(:,:,:,i));
  axis('image')
  title(['Frame ' num2str(i)]);
  j = j + 1;
  if ( j > 16 )
    break;
  end
end

% compute average image
disp('> Computing average image...')
xmean = uint8(mean(x, 4));
figure(2);
image(xmean)
axis('image')
title('Mean image');

% compute mean image
disp('> Computing mean image...')
xmedian = uint8(median(x, 4));
figure(3);
image(xmedian)
axis('image')
title('Median image');
