%% correlation
clc;
clear all;
close all;

% Define first signal x[n]
xn = [1 2 1 1];
nx = 0:1:3;

% Define second signal y[n]
yn = [1 1 2 1];
ny = 0:1:3;

% Time reverse y[n] for correlation
yn_rev = fliplr(yn);
ny_rev = -fliplr(ny);  % Note: This should be fliplr(ny) with a minus sign - verify this is intended

% Define range for correlation result
nr = min(nx)+min(ny_rev) : 1 : max(nx)+max(ny_rev);
rn = zeros(1,length(nr));

% Store lengths for convenience
Lx = length(nx);
Ly = length(ny_rev);
Lr = length(nr);

% Manual correlation calculation
for i = 1:Lr
 n = nr(i); %current output index
 for j = 1:Ly
   k = nx(j); %current input index
   xpos = j;
   ypos = find(ny_rev ==(n-k));  % Find where time-shifted y matches current lag
   if ~isempty(ypos)
     rn(i) = rn(i) + xn(xpos) * yn_rev(ypos);  % Correlation sum calculation
   end
 end
end

% Display manual correlation result
disp('Correlation result r[n]:');
disp(rn);

% Calculate correlation using MATLAB's built-in function for verification
rn_matlab = xcorr(xn, yn);
disp('MATLAB xcorr result:');
disp(rn_matlab);

%% Discrete time plotting (stem plots)
subplot(3,1,1);
stem(nx,xn,'b',"filled", LineWidth=2);
xlabel('n');
ylabel('x[n]')
title('x[n] signal');

subplot(3,1,2);
stem(ny,yn,'r',"filled",LineWidth=2);
xlabel('n');
ylabel('y[n]')
title('y[n] signal')

subplot(3,1,3);
stem(nr,rn,'g',"filled",LineWidth=2);
xlabel('n');
ylabel('r[n]')  % Fixed label: should be r[n] not y[n]
title('r[n] signal(correlation)')

%% Continuous time plotting (line plots)
figure;
subplot(3,1,1);
plot(nx,xn,'b',LineWidth=2);
xlabel('n');
ylabel('x[n]')
title('x[n] signal');

subplot(3,1,2);
plot(ny,yn,'r',LineWidth=2);
xlabel('n');
ylabel('y[n]')
title('y[n] signal')

subplot(3,1,3);
plot(nr,rn,'g',LineWidth=2);
xlabel('n');
ylabel('r[n]')  % Fixed label: should be r[n] not y[n]
title('r[n] signal(correlation)')
