% Clear environment
clc; 
clear all; 
close all;

% Input signal definition: bell-shaped sequence
xn = [0 4 6 4 0];       % x[n] values
nx = -2:1:2;            % x[n] indices (-2 to 2)

% Impulse response: rectangular window
hn = [1 1 1];           % h[n] values (moving average filter)
nh = -1:1:1;            % h[n] indices (-1 to 1)

% Calculate dimensions
Lx = length(xn);        % Length of x[n]
Lh = length(hn);        % Length of h[n]
Ly = Lx + Lh - 1;       % Length of y[n]

% Calculate output time indices
ny = min(nh) + min(nx):1:max(nh) + max(nx);  % Output range: -3 to 3
disp(ny);               % Display output indices

% Initialize output array
yn = zeros(1, Ly);
disp(yn);               % Display initialized output

% Manual convolution implementation
for i = 1:Ly
    n = ny(i);          % Current output index
    for j = 1:Lx
        k = nx(j);      % Current input index
        hpos = find(nh == (n-k));  % Find matching h[n-k] position
        
        if ~isempty(hpos)
            yn(i) = yn(i) + xn(j) * hn(hpos);  % Apply convolution formula
        end
    end
end

% Display results
disp('Convolution result y[n]:');
disp(yn);

% Verify with MATLAB's built-in function
yn_mat = conv(xn, hn);
disp('Convolution result using matlab y[n]:');
disp(yn_mat);

%% Discrete-time visualization
figure('Position', [100, 100, 800, 600]);
% Plot input signal
subplot(3, 1, 1);
stem(nx, xn, 'b', "filled", LineWidth=2);
grid on; xlabel('n'); ylabel('x[n]');
title('Input signal x[n] (bell-shaped sequence)');
xlim([min(ny)-1, max(ny)+1]);

% Plot impulse response
subplot(3, 1, 2);
stem(nh, hn, 'r', "filled", LineWidth=2);
grid on; xlabel('n'); ylabel('h[n]');
title('Impulse response h[n] (moving average filter)');
xlim([min(ny)-1, max(ny)+1]);

% Plot convolution result
subplot(3, 1, 3);
stem(ny, yn, 'g', "filled", LineWidth=2);
grid on; xlabel('n'); ylabel('y[n]');
title('Convolution result y[n] = x[n] * h[n]');
xlim([min(ny)-1, max(ny)+1]);

%% Continuous-time visualization
figure('Position', [100, 100, 800, 600]);
% Plot continuous representation of input
subplot(3, 1, 1);
plot(nx, xn, 'b', LineWidth=2);
grid on; xlabel('n'); ylabel('x[n]');
title('Input signal x[n] (continuous representation)');
xlim([min(ny)-1, max(ny)+1]);

% Plot continuous representation of impulse response
subplot(3, 1, 2);
plot(nh, hn, 'r', LineWidth=2);
grid on; xlabel('n'); ylabel('h[n]');
title('Impulse response h[n] (continuous representation)');
xlim([min(ny)-1, max(ny)+1]);

% Plot continuous representation of output
subplot(3, 1, 3);
plot(ny, yn, 'g', LineWidth=2);
grid on; xlabel('n'); ylabel('y[n]');
title('Convolution result (continuous representation)');
xlim([min(ny)-1, max(ny)+1]);