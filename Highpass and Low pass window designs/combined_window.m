clc;
close all;
clear all;

N = input('Enter the value of N : ');
Wc = input('Enter the value of cutoff frequency: ');
alpha = (N - 1) / 2;
n = 0:1:N - 1;

% Lowpass
Hd = (Wc / pi) * sinc(Wc * (alpha - n) / pi);

% Highpass
Hb = ((-1).^n) .* (Wc / pi) .* sinc(Wc * (alpha - n) / pi);

% Hamming window for low-pass
B1 = hamming(N)';

% Hanning window for high-pass
B2 = hann(N)';

% Organize function and plot for Hamming low-pass
H1 = Hd .* B1;

w = 0:0.01:pi;

% Hamming graph for low-pass
subplot(2, 2, 1);
h1 = freqz(H1, 1, w);
plot(w/pi, 20*log10(abs(h1)))  % Use 20*log10 for dB scale
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude (dB)');
title('Hamming Lowpass');

% Organize function and plot for Hanning high-pass
H2 = Hb .* B2;

% Hanning graph for high-pass
subplot(2, 2, 2);
h2 = freqz(H2, 1, w);
plot(w/pi, 20*log10(abs(h2)))  % Use 20*log10 for dB scale
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude (dB)');
title('Hanning Highpass');
