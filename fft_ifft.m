clc;
clear all;
close all;

%%
N = 16;
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
y = y1 + y2 + y3;
fprintf('y = ');
disp(y)

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

%%
k = 0:1:N-1;  % k vector
f = k*(fs/N); %frequency vector
Y = fft(y);

magnitude = abs(Y);
power = magnitude.^2;
real_part = real(Y);
imag_part = imag(Y);
phase = angle(Y);                % Phase spectrum

%% -------- Second Figure: Frequency-Domain Plots --------
figure;
subplot(5,1,1); stem(f, magnitude, 'filled');
title('Magnitude Spectrum'); xlabel('Frequency (Hz)'); ylabel('|Y(f)|');

subplot(5,1,2); stem(f, power, 'filled');
title('Power Spectrum'); xlabel('Frequency (Hz)'); ylabel('|Y(f)|^2');

subplot(5,1,3); stem(f, real_part, 'filled');
title('Real Part of FFT'); xlabel('Frequency (Hz)'); ylabel('Re{Y(f)}');

subplot(5,1,4); stem(f, imag_part, 'filled');
title('Imaginary Part of FFT'); xlabel('Frequency (Hz)'); ylabel('Im{Y(f)}');

subplot(5,1,5); stem(f, phase, 'filled');
title('Phase Spectrum'); xlabel('Frequency (Hz)'); ylabel('Phase (rad)');

%% -------- Display FFT Table --------
disp('------------------------------------------');
disp(' k    f(k)(Hz)   |Y|     Power   Phase     Y(k)');
disp('------------------------------------------');
for k = 1:N
    fprintf('%3d   %6.2f    %6.2f   %6.2f  %6.2f   %+6.2f %+6.2fi\n', ...
        k-1, f(k), magnitude(k), power(k), phase(k), real(Y(k)), imag(Y(k)));
end
