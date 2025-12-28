clc;
clear all;
close all;

%%
N = 32;
fs = 16;
n = 0:1:N-1;
Ts = 1/fs; %sampling period
t = n*Ts; % time vector

A1 = 2;
A2 = 3;
A3 = 5;

f1 = 2;
f2 = 4;
f3 = 3;

y1 = A1*sin(2*pi*f1*t);
y2 = A2*sin(2*pi*f2*t);
y3 = A3*sin(2*pi*f3*t);

y = y1+y2+y3;

subplot(4,1,1)
stem(t,y1, "filled");
xlabel('t');
ylabel('y1');
title("y1(t)");

subplot(4,1,2)
stem(t,y2,"filled");
xlabel('t');
ylabel('y2');
title("y2(t)");

subplot(4,1,3)
stem(t,y3, 'filled');
xlabel('t');
ylabel('y3');
title("y1(t)");

subplot(4,1,4)
stem(t,y, "filled");
xlabel('t');
ylabel('y');
title("y(t)");

%% DFT
Y = fft(y);
disp(Y);
k = 0:1:N-1;
f = k*(fs/N);

magnitude = abs(Y);
power = abs(y).^2;
phase = angle(Y);
real_part = real(Y);
imag_part = imag(Y);

subplot(5,1,1)
stem(f,magnitude);

subplot(5,1,2);
stem(f,power);

subplot(5,1,3);
stem(f, phase);

subplot(5,1,4)
stem(f,real_part);

subplot(5,1,5)
stem(f, imag_part);

%%
y_recons = real(ifft(Y));
subplot(2,1,1)
plot(n,y);

subplot(2,1,2)
plot(n,y_recons);

%% lets say , remove 3hz
y_filtered = Y;

target_f = 3;
index_pos = find(abs(f - target_f) < 0.5); % positive frequency
index_neg = N - index_pos + 2; % corresponding negative frequency

% Zero out the 3 Hz components
y_filtered(index_pos) = 0;
y_filtered(index_neg) = 0;

yrc = ifft(y_filtered);

subplot(2,1,1)
plot(t, y);

subplot(2,1,2)
plot(t, yrc);

%%
yf = Y;
target = 3;

indx_pos = find(f == target);
indx_neg = N-indx_pos+2;
yrc = ifft(y_filtered);

subplot(2,1,1)
plot(t, y);

subplot(2,1,2)
plot(t, yrc);




