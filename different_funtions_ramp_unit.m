clc;
clear all;
close all;

t = -10:0.1:10; 

%unit step func
ut = zeros(size(t));
for i = 1:length(t)
    if t(i)>=0
        ut(i) = 1;
    else
        ut(i) = 0;
    end
end 

plot(t, ut, LineWidth=2);
title("unit step funtion");
xlabel('time');
ylabel('u(t)');

%% ramp function
rt = zeros(size(t));
for i = 1:length(t)
    if t(i)>=0
        rt(i) = t(i);
    else
        rt(i) = 0;
    end
end 

plot(t, rt, LineWidth=2);
title("Ramp funtion");
xlabel('time');
ylabel('rt(t)');


%% impulse function
it = zeros(size(t));
for i = 1:length(t)
    if t(i) == 0
        it(i) = 1;
    else
        it(i) = 0;
    end
end 

plot(t, it, LineWidth = 2);
title("Impulse funtion");
xlabel('time');
ylabel('it(t)');

%% exponential function

% Define time vector
t = -10:0.01:10;  % adjust as needed

% Parameters
k = -4;
A = 5;

% Preallocate output vector
expt = zeros(size(t));

% Calculate exponential function
for i = 1:length(t)
    expt(i) = A * exp(k * t(i));
end

% Plotting
plot(t, expt, 'LineWidth', 2);
title("Exponential Function");
xlabel('Time (t)');
ylabel('f(t) = A * e^{kt}');
grid on;


