%%
clc;                 % Clear Command Window
clear all;           % Clear Workspace
close all;           % Close All Windows (figures)

T = 0.2;
t = 0:T:2;
x_t = 2*exp(-2*t);

n = 0:length(t)-1; % Sample index
t = n*T;
x_n = 2*exp(-2*n*T);


subplot(2,1,1);
plot(t,x_t);
xlabel('t');
ylabel('x(t)'); 
title('a.Continious Signal')



subplot(2,1,2);
stem(n,x_n, "filled", LineWidth=2);
xlabel('n');
ylabel('x(n)');
title('b.Discrete Signal')

%%
clc;                 % Clear Command Window
clear all;           % Clear Workspace
close all;           % Close All Windows (figures)

T = 0.2;
t = 0:T:2;
x_t = sin(7*t) +sin(10*t);
n = 0:length(t)-1;
x_n = sin(7*n*T) +sin(10*n*T);

subplot(2,1,1);
plot(t,x_t);
xlabel('t');
ylabel('x(t)');
title('a.Continious Signal')

subplot(2,1,2);
stem(n,x_n, "filled");
xlabel('n');
ylabel('x(n)');
title('b.Discrete Signal')

%%
clc;
clear all;
close all;

t = -1:0.1:1;
n = 0:length(t)-1;
x_t = exp(-(t.^2)/2);
subplot(2,1,1);
plot(t,x_t);
grid on;
xlabel('Time(t)');
ylabel('Amplitude');
title("Continious Time Signal")

subplot(2,1,2);
stem(n,x_t, "filled", LineWidth=2);
grid on;
xlabel('n');
ylabel('Amplitude');
title("Discrete Time Signal")


