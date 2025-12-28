%% right shift  or time delay
clc;                 % Clear Command Window
clear all;           % Clear Workspace
close all;           % Close All Windows (figures)


% time delay / right shifting
%  y(n) = x(n-k) ; k>=0

% Define the original signal
xn = [ 0  0  0 2 1 2 1 0 0 0];           % Example signal
n = [-3 -2 -1 0 1 2 3 4 5 6];           % Time indices for the original signal
k = 2;
 
%y(-3) = -3-2 = -5 = -
%y(-2) = -2-2 = -4 = -
%y(-1) = -1-2 = -3 = 2
%y(0)  =  0-2 = -2 = 3
%y(1)  =  1-2 = -1 = 4
%.
%.
% start howar ktha chilo -3 te but started at -1 = -3 + k;
% end howar kotha chilo 1 e but ended at 1+k = 3;
% right shifted / time delay
% consider my concern -1 to 3 think of its view point.

s = min(n) + k;
e = max(n) + k;
yn = zeros(size(n));

for i = 1:length(n)
    new_n = n(i) - k; % when i = 1, n(1) = -3, new_n = -5
    %check if new_n exist
    pos = find(n == new_n) %Find the index where new n exist
    disp(pos)
    if isempty(pos) %pos not found in n array
       % assign y(i) = - i.e , 0 already

   else
       yn(i) = xn(pos);
    end
end

% Plotting
subplot(2,1,1);
stem(n, xn, "filled", "b");
title('Original Signal');
xlabel('Time index n');
ylabel('Amplitude');
grid minor;

subplot(2,1,2);
stem(n, yn, "filled", "b");
title(['Time-Delayed Signal by k = ' num2str(k)]);
xlabel('Time index n');
ylabel('Amplitude');
grid minor;

%%
clc;                 % Clear Command Window
clear all;           % Clear Workspace
close all;           % Close All Windows (figures)
% reverse signal
%  y(n) = x(-n) ; 

%n =     [-3,-2,-1,0,1];
%xn =    [ 2, 3, 4,5,6];

%yn start = -1
%     end =  3

% Reverse signal
% y(n) = x(-n) ;
xn = [ 0  0  0  0  0  0 2 1 2 1 0 0 0];         
n = [-6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6]; 
yn = zeros(size(n));

for i = 1:length(n)
    new_n = -n(i);
    % i = 1, n(1) = -3, new_n = 3
    % i = 2, n(2) = -2, new_n = 2
    %i = 7, n(7) = 1, new_n = -1
    pos = find(n == new_n); % Added missing semicolon here
    
    if isempty(pos)
        % yn(i) remains zero
    else
        yn(i) = xn(pos);
    end
end

% Plotting
figure;
subplot(2,1,1);
stem(n, xn, "filled", "b");
title('Original Signal');
xlabel('Time index n');
ylabel('Amplitude');
grid minor;

subplot(2,1,2);
stem(n, yn, "filled", "b");
title('Reversed Signal'); % Fixed the syntax error in title
xlabel('Time index n');
ylabel('Amplitude');
grid minor;

%% scaled signal
%%

clc;                 % Clear Command Window
clear all;           % Clear Workspace
close all;           % Close All Windows (figures)
% %down scaled signal
%  y(n) = x(2n) ; 

xn = [ 0  0  0  0  1  2  3  4 5 4 3 2 1 0 0 0 0];       
n = [-8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8];  

%yn start = -1*2 = -2
%     end =  1*2;

yn = zeros(size(n));

for i = 1:length(n)
    new_n = 2*n(i);
    pos = find(n == new_n); % Added missing semicolon here
    
    if isempty(pos)
        % yn(i) remains zero
    else
        yn(i) = xn(pos);
    end
end

% Plotting
figure;
subplot(3,1,1);
stem(n, xn, "filled", "b");
title('Original Signal');
xlabel('Time index n');
ylabel('Amplitude');
grid minor;

subplot(3,1,2);
stem(n, yn, "filled", "b");
title('down scaled Signal'); % Fixed the syntax error in title
xlabel('Time index n');
ylabel('Amplitude');
grid minor;

yn = zeros(size(n));

for i = 1:length(n)
    new_n = 0.5*n(i);
    pos = find(n == new_n); % Added missing semicolon here
    
    if isempty(pos)
        % yn(i) remains zero
    else
        yn(i) = xn(pos);
    end
end

% Plotting
subplot(3,1,3);
stem(n, yn, "filled", "b");
title('up scaled Signal'); % Fixed the syntax error in title
xlabel('Time index n');
ylabel('Amplitude');
grid minor;

%% upscaled
%%

clc;                 % Clear Command Window
clear all;           % Clear Workspace
close all;           % Close All Windows (figures)
% %down scaled signal
%  y(n) = x(2n) ; 

n =     [0,1,2,3,4, 5, 6, 7, 8];
xn =    [ 1,2, 3, 4,5,0, 0, 0, 0];

%yn start = -1*0.5 
%     end =  1*0.5;

yn = zeros(size(n));

for i = 1:length(n)
    new_n = 0.5*n(i);
    pos = find(n == new_n); % Added missing semicolon here
    
    if isempty(pos)
        % yn(i) remains zero
    else
        yn(i) = xn(pos);
    end
end

% Plotting
figure;
subplot(2,1,1);
stem(n, xn, "filled", "b");
title('Original Signal');
xlabel('Time index n');
ylabel('Amplitude');
grid minor;

subplot(2,1,2);
stem(n, yn, "filled", "b");
title('down scaled Signal'); % Fixed the syntax error in title
xlabel('Time index n');
ylabel('Amplitude');
grid minor;
%%
%%

clc;                 % Clear Command Window
clear all;           % Clear Workspace
close all;           % Close All Windows (figures)
% %down scaled signal
%  y(n) = x(2n) ; 

% Define the original signal
xn = [ 0  0  0  0  1  2  3  4 5 4 3 2 1 0 0 0 0];           % Example signal
n = [-8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8]; 

%yn start = -1*0.5 
%     end =  1*0.5;

yn = zeros(size(n));

for i = 1:length(n)
    new_n = 0.5*n(i);
    pos = find(n == new_n); % Added missing semicolon here
    
    if isempty(pos)
        % yn(i) remains zero
    else
        yn(i) = xn(pos);
    end
end

% Plotting
figure;
subplot(2,1,1);
stem(n, xn, "filled", "b");
title('Original Signal');
xlabel('Time index n');
ylabel('Amplitude');
grid minor;

subplot(2,1,2);
stem(n, yn, "filled", "b");
title('down scaled Signal'); % Fixed the syntax error in title
xlabel('Time index n');
ylabel('Amplitude');
grid minor;

%%
%%

clc;                 % Clear Command Window
clear all;           % Clear Workspace
close all;           % Close All Windows (figures)
% %down scaled signal
%  y(n) = x(2n) ; 

n =     [-3,-2,-1,0,1];
xn =    [ 2, 3, 4,5,6];

%yn start = -1*2 = -2
%     end =  1*2;

yn = zeros(size(n));

for i = 1:length(n)
    new_n = 2*n(i);
    pos = find(n == new_n); % Added missing semicolon here
    
    if isempty(pos)
        % yn(i) remains zero
    else
        yn(i) = xn(pos);
    end
end

% Plotting
figure;
subplot(2,1,1);
stem(n, xn, "filled", "b");
title('Original Signal');
xlabel('Time index n');
ylabel('Amplitude');
grid minor;

subplot(2,1,2);
stem(n, yn, "filled", "b");
title('down scaled Signal'); % Fixed the syntax error in title
xlabel('Time index n');
ylabel('Amplitude');
grid minor;

%% upscaled
%%
%%

clc;                 % Clear Command Window
clear all;           % Clear Workspace
close all;           % Close All Windows (figures)
% %down scaled signal
%  y(n) = x(2n) ; 

xn = [ 0  0  0  0  1  2  3  4 5 4 3 2 1 0 0 0 0];           % Example signal
n = [-8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8];

%yn start = -1*2 = -2
%     end =  1*2;

yn = zeros(size(n));

for i = 1:length(n)
    new_n = 2*n(i);
    pos = find(n == new_n); % Added missing semicolon here
    
    if isempty(pos)
        % yn(i) remains zero
    else
        yn(i) = xn(pos);
    end
end

% Plotting
figure;
subplot(2,1,1);
stem(n, xn, "filled", "b");
title('Original Signal');
xlabel('Time index n');
ylabel('Amplitude');
grid minor;

subplot(2,1,2);
stem(n, yn, "filled", "b");
title('down scaled Signal'); % Fixed the syntax error in title
xlabel('Time index n');
ylabel('Amplitude');
grid minor;
