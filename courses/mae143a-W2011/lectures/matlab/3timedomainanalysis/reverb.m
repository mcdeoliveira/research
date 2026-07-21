%
% Ask for impulse response and audio source and convolve them
%

% read all files
files = dir('wav/*.wav');

% read impulse response
ir = dir('wav/impulse_*.wav');
n = length(ir);

% find all files which are not impulse responses
[c, ind] = setdiff(char(files.name),char(ir.name),'rows');

% samples
samples = files(ind);
m = length(samples);

% choose sample
i = -1;
while ( i < 0 || i > m )
  disp('> Available samples:');
  disp([num2str((1:m)') char(ones(m,1)*32) char(samples.name)])
  i = input('> Choose sample (0 to exit): ');
  if (i == 0 )
    return
  end
  if ( i < 0 || i > m )
    disp('Invalid choice. Try again');
  end
end

% play sample
disp('> Playing sample...');
[x, xfs, xbits] = wavread(['wav/' samples(i).name]);
player = audioplayer(x, xfs, xbits);
play(player)
t = timer('StartDelay', floor(length(x)/xfs), 'TimerFcn','disp(''done.'')');
start(t);
wait(t);

% choose impulse response
while ( 1 ) 

  j = -1;
  while ( j < 0 || j > n )
    disp('> Available impulse responses:');
    disp([num2str((1:n)') char(ones(n,1)*32) char(ir.name)])
    j = input('> Choose impulse response (0 to exit): ');
    if (j == 0 )
      return
    end
    if ( j < 0 || j > n )
      disp('Invalid choice. Try again');
    end
  end

  % play impulse response
  disp('> Playing impulse response...');
  [h, hfs, hbits] = wavread(['wav/' ir(j).name]);
  player = audioplayer(h, hfs, hbits);
  play(player)
  t = timer('StartDelay', floor(length(h)/hfs), 'TimerFcn','disp(''done.'')');
  start(t);
  wait(t);

  % convolve input
  y = fconv(h, x);

  % plot
  figure(1)
  subplot(3,1,1)
  plot(x), grid
  title('Input')
  subplot(3,1,2)
  plot(h), grid
  title('Impulse Response')
  subplot(3,1,3)
  plot(y),grid
  title('Output')

  % play response
  disp('> Playing convolved response...');
  player = audioplayer(y, hfs, hbits);
  play(player)
  t = timer('StartDelay', floor(length(y)/hfs), 'TimerFcn','disp(''done.'')');
  start(t);
  wait(t);

end
