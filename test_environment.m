%% a basic filter

clear all
clc
close all
%% windowed sinc/spectral inversion/convolution
% largest frequency in waveform is 200Hz, 
% so need >=200Hz sampling frequency for aliasing


fs = 1000;           % sampling frequency
Ts = 1/fs;          % Sampling Period
n = 0:fs-1;          % Samples
t = n*Ts;           % sampling instances
x = sin(2*pi*t)+0.5*sin(2*pi*200*t)  % signal

x1 = quantize(1000,1000,sin(2*pi*t)+0.5*sin(2*pi*200*t));
plot(x1,'.');


figure('Color',[1 1 1]);
b = plot(n,x,'.');
grid on;
xlabel('sample #');
ylabel('f[n]');
title('Full Scale');
set(b,'Color', [1 0.4 0.4]);
set(b,'MarkerSize',8);
hold on;
b = plot(n,x);
box off;
set(b,'Linewidth',.5);
set(b,'Color', [0.4 0.4 1]);

figure('Color',[1 1 1]);
b = plot(n(1:200),x(1:200),'.');
grid on;
xlabel('sample #');
ylabel('f[n]');
title('Zoomed (n = 1 - 200)');
set(b,'Color', [1 0.4 0.4]);
set(b,'MarkerSize',8);
hold on;
b = plot(n(1:200),x(1:200));
box off;
set(b,'Linewidth',.5);
set(b,'Color', [0.4 0.4 1]);


h1 = win_sinc(0.05,0.1,2);
h2 = spectral_inv(h1);
y = convolution(x,h2);

n = 1:length(h2);

% plots
figure('Color',[1 1 1]); 
subplot(2,2,2); % plot of kernel
a = plot(n,h2,'.');
grid on;
xlabel('sample #');
ylabel('h[n]');
title('Filter kernel');
set(a,'Color', [0.2 1 1]);
set(a,'MarkerSize',10);

subplot(2,2,3); % plot of filtered signal
b = plot(y,'.');
grid on;
xlabel('sample #');
ylabel('y[n]');
title('Filtered signal');
set(b,'Color', [0.3 1 0.3]);
set(b,'MarkerSize',7);

subplot(2,2,4); % plot of filtered signal
b = plot(y);
grid on;
xlabel('sample #');
ylabel('y[n]');
title('Filtered signal');
set(b,'Color', [0.3 1 0.3]);
set(b,'MarkerSize',7);

subplot(2,2,1); % plot of original signal
c = plot(x);
box off;
grid on;
xlabel('sample #');
ylabel('f[n]');
title('Raw Signal (200Hz test noise)');
set(c,'Linewidth',.5);
set(c,'Color', [0.3 0.3 1]);

%% 

fs = 1000;           % sampling frequency
Ts = 1/fs;          % Sampling Period
n = 0:fs-1;          % Samples
t = n*Ts;           % sampling instances
x = sin(2*pi*t);  % signal

x1 = quantize(1000,20,sin(2*pi*t));

%% recursive moving average filter

% set up piecewise step function for testing

r = rand(1,200);

x1 = 1:200;
for i = 1 : length(x1)
    y1(i) = piecewise2(x1(i));
end
plot(x1, y1) ;


fs = 200;           % sampling frequency
Ts = 1/fs;          % Sampling Period
n = 0:fs-1;          % Samples
t = n*Ts;           % sampling instances
x = y1 + r;

figure;
plot(x);  % plot of function.
figure;
plot(x,'.');

y2 = moving_avg(5,x);
y3 = moving_avg(11,x);
y4 = moving_avg(19,x);

figure;
plot(y2);
figure;
plot(y3);
figure;
plot(y4);


function  y = piecewise2(x)
switch x
    % A scalar switch_expr matches a case_expr if
    % switch_expr == case_expr
    % The first case must cover the x = 0 case
    case x * (x <= 0)
        y = 0;
    case x * (x <= 10)
        y = 0;
    case x * (x > 10 & x <= 20)
        y = 0.3826;
    case x * (x > 20 & x <= 30)
        y = 0.7071;
    case x * (x > 30 & x <= 40)
        y = 0.9238;
    case x * (x > 40 & x <= 50)
        y = 1;
    case x * (x > 50 & x <= 60)
        y = 0.9238;
    case x * (x > 60 & x <= 70)
        y = 0.7071;
    case x * (x > 70 & x <= 80)
        y = 0.3826;
    case x * (x > 80 & x <= 90)
        y = 0;
    case x * (x > 90 & x <= 100)
        y = -0.3826;
    case x * (x > 100 & x <= 110)
        y = -0.7071;
    case x * (x > 110 & x <= 120)
        y = -0.9238;
    case x * (x > 120 & x <= 130)
        y = -1;
    case x * (x > 130 & x <= 140)
        y = -0.9238;
    case x * (x > 140 & x <= 150)
        y = -0.7071;
    case x * (x > 150 & x <= 160)
        y = -0.3826;
    case x * (x > 160 & x <= 170)
        y = 0;
    otherwise
        y = 0;
end
end