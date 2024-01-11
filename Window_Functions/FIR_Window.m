clc;
N = input('Enter the value of N: ');
f = linspace(0, pi, 0.01 * N);

W1 = zeros(1, N);
W2 = zeros(1, N);

a = (N - 1) / 2;
wc = pi / 2;

% Hanning window
for i = 1:N
    W1(i) = 0.5 - 0.5 * cos(2 * pi * (i - 1) / N);
end

% Hamming window
for i = 1:N
    W2(i) = 0.54 - 0.46 * cos(2 * pi * (i - 1) / N);
end

% Low pass for Hanning
hd = zeros(1, N);  % Initialize the impulse response
for i = 1:N
    hd(i) = (wc / pi) * sinc((wc * (i - 1 - a)) / pi);
end

% High pass for Hamming
ha = zeros(1, N);  % Initialize the impulse response
for i = 1:N
    ha(i) = ((-1)^i) * (wc / pi) * sinc((wc * (i - 1 - a)) / pi);
end

% Low pass response
hl = hd .* W1';

% High pass response
hh = ha .* W2';

% Calculate magnitude and phase
magnitude_hl = abs(hl);
phase_hl = angle(hl);

magnitude_hh = abs(hh);
phase_hh = angle(hh);

% Low pass spectrum - Magnitude
subplot(2, 2, 1);
stem(magnitude_hl);
title('Magnitude of Low Pass for Hanning Window');
xlabel('Sample Index');
ylabel('Magnitude');
legend('YourLegendHere'); % Replace 'YourLegendHere' with the desired legend

% Low pass spectrum - Phase
subplot(2, 2, 2);
stem(phase_hl);
title('Phase of Low Pass for Hanning Window');
xlabel('Sample Index');
ylabel('Phase (radians)');
legend('YourLegendHere'); % Replace 'YourLegendHere' with the desired legend

% High pass spectrum - Magnitude
subplot(2, 2, 3);
stem(magnitude_hh);
title('Magnitude of High Pass for Hamming Window');
xlabel('Sample Index');
ylabel('Magnitude');
legend('21UEC095'); % Replace 'YourLegendHere' with the desired legend

% High pass spectrum - Phase
subplot(2, 2, 4);
stem(phase_hh);
title('Phase of High Pass for Hamming Window');
xlabel('Sample Index');
ylabel('Phase (radians)');
legend('21UEC095'); % Replace 'YourLegendHere' with the desired legend
