%%%% MAE 143B MATLAB Demo
%%%% Cover chapter 2 sections up to 2.3 (step response) before starting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; 
close all;

%% Step Response / Dynamic Response
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m      = 1000;          % kg, fix
b      = 300;           % kg/s
p      = 1e4;           % N/in, pedal gain, fix
mph    = 2.23694;       % conversion m/s to mph

y_ss   = p/b;           % m/(s*N), steady-state gain
lambda = -b/m;          % 1/s, eigenvalue
              
% Step response by hand                  
t_f     = 10;           % s, end of time period     
t       = linspace(0,t_f,1e4);
y_stp   = y_ss*(1 - exp(lambda.*t));

% Step response using toolbox
car         = tf(p , [m b]);    % Transfer function
[y_stp2,~]   = step(car,t);     % Step response

% Compare
figure;
subplot(2,1,1)
plot(t,mph*y_stp,'LineWidth',1.5);
grid on;
xlabel 't, in [s]'
ylabel 'y, in [mph]'
subplot(2,1,2)
plot(t,mph*y_stp2,'LineWidth',1.5);
grid on;
xlabel 't, in [s]'
ylabel 'y, in [mph]'

% Now look at different b and nonzero y_0
b      = [300 1e3 5e3 -10];             % kg/s
y_0    = 10;                            % m/s
index  = randperm(4);                   % Shuffle
b      = b(index);                      
figure;
grid on;
xlabel 't, in [s]'
ylabel 'y, in [mph]'
hold all;
for kk = 1:length(b)
    lambda = -b(kk)/m;                  % 1/s, eigenvalue
                        
    car            = tf(p , [m b(kk)]); % Transfer function
    [y_stp,~]      = step(car,t);       % Step response
    
    y_init         = y_0*exp(lambda.*t);% Initial condition response
    
    y_out          = y_stp' + y_init;   % Output
    
    plot(t,mph*y_out,'LineWidth',1.5);
end; 

%% Identification
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b      = 300;               % kg/s
y_0    = 0;                 % m/s

y_ss   = p/b;               % m/(s*N), steady-state gain
lambda = -b/m;              % 1/s, eigenvalue

t_f    = 30;                % s, end of time period     
t      = linspace(0,t_f,1e4);

t_s    = t_f*rand(1,100);   % sample time vector                        
t_s    = sort(t_s);         % sort

sys_s  = y_ss*(1 - exp(lambda.*t_s)) + y_0*exp(lambda.*t_s);
data   = sys_s + randn(size(sys_s));
                            % generate noisy data

sys    = y_ss*(1 - exp(lambda.*t)) + y_0*exp(lambda.*t);
                            % compute dynamic response

figure;
plot(t_s,mph*data,'x','LineWidth',1.5);
hold all;
plot(t,mph*sys,'LineWidth',1.5);
grid on;
xlabel 't, in [s]'
ylabel 'y, in [mph]'
legend('Data','System','Location','SE');

% Estimate steady-state value:
t_end  = find(t_s > 20);            % Find relevant points
n      = length(t_end);             % Count number of points
y_ss_a = sum(data(t_end))/n;        % Average

% Compute singal r:
t_strt = find(t_s < 5);             % Find relevant points
r      = 1 - data(t_strt)./y_ss_a;  % Compute r

% Show linear behavior
figure;
plot(t_s(t_strt),log(r),'x','LineWidth',1.5);
grid on;
xlabel 't, in [s]'
ylabel 'log(r(t))'
xlim ([0 5])

% Estimate lambda:
lambda_vec  = log(r)./t_s(t_strt);  % Generate point-estimates
n           = length(t_strt);       % Count number of estimates
lambda_a    = sum(lambda_vec)/n;    % Average

% Compare model with data:
y_a   = y_ss_a*(1 - exp(lambda_a.*t)) + y_0*exp(lambda_a.*t);

figure;
plot(t_s,mph*data,'x','LineWidth',1.5);
hold all;
plot(t,mph*sys,'LineWidth',1.5);
plot(t,mph*y_a,'LineWidth',1.5);
grid on;
xlabel 't, in [s]'
ylabel 'y, in [mph]'
legend('Data','System','Model','Location','SE');
