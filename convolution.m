% Clear environment for a fresh start
clc;
clear all;
close all;

% Define first signal x[n]
xn = [3 2 1 2];       % Amplitude values of x[n]
nx = 0:1:3;           % Time indices: n = 0,1,2,3

% Define second signal h[n]
hn = [1 2 1 2];       % Amplitude values of h[n]
nh = -1:1:2;          % Time indices: n = -1,0,1,2

% Calculate signal dimensions
Lx = length(xn);      % Length of x[n]: 4
Lh = length(hn);      % Length of h[n]: 4
Ly = Lx + Lh - 1;     % Length of convolution result: 7

% Calculate output indices range
ny = min(nh) + min(nx):1:max(nh) + max(nx);  % Output range: -1 to 5
disp(ny);             % Display the time indices for output

% Initialize output array with zeros
yn = zeros(1, Ly);    % Create zero array of length 7
disp(yn);             % Display the initialized array

% Manual convolution implementation
for i = 1:Ly
    n = ny(i);        % Current output time index
    for j = 1:Lx
        k = nx(j);    % Current input time index
        xpos = j;     % Position in x[n] array
        
        hpos = find(nh == (n-k));  % Find position of h[n-k]
        
        if ~isempty(hpos)
            yn(i) = yn(i) + xn(xpos) * hn(hpos);  % y[n] += x[k]*h[n-k]
        end
    end
end

% Display results
disp('Convolution result y[n]:');
disp(yn);

% Verify with MATLAB built-in function
yn_mat = conv(xn, hn);
disp('Convolution result using matlab y[n]:');
disp(yn_mat);

%% Discrete-time signal plotting
subplot(3, 1, 1);
stem(nx, xn, 'b', "filled", LineWidth=2);  % Plot discrete samples of x[n]
xlabel('n');
ylabel('x[n]');
title('x[n] signal');

subplot(3, 1, 2);
stem(nh, hn, 'r', "filled", LineWidth=2);  % Plot discrete samples of h[n]
xlabel('n');
ylabel('h[n]');
title('h[n] signal');

subplot(3, 1, 3);
stem(ny, yn, 'g', "filled", LineWidth=2);  % Plot discrete samples of y[n]
xlabel('n');
ylabel('y[n]');
title('y[n] signal(convolution)');

%% Continuous-time representation plotting
figure;  % Create new figure window
subplot(3, 1, 1);
plot(nx, xn, 'b', LineWidth=2);  % Connect x[n] samples with lines
xlabel('n');
ylabel('x[n]');
title('x[n] signal');

subplot(3, 1, 2);
plot(nh, hn, 'r', LineWidth=2);  % Connect h[n] samples with lines
xlabel('n');
ylabel('h[n]');
title('h[n] signal');

subplot(3, 1, 3);
plot(ny, yn, 'g', LineWidth=2);  % Connect y[n] samples with lines
xlabel('n');
ylabel('y[n]');
title('y[n] signal(convolution)');
