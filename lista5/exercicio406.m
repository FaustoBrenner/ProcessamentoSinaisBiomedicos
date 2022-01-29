% Example 4.2 Plot the Frequency characteristics and impulse
% response digital system given the digital transfer function

fs = 2000; % Sampling frequency (given)
N = 512; % Number of points (given)
% Define a and b coefficients based on H(z)
a = [0.42 1.25 1.25 -0.42]*10^(-3); % Denominator of transfer function
b = [1 -2.686 2.42 -.73]; % Numerator of transfer function

H = fft(b,N)./fft(a,N);     % Compute H(m). Eq. 4.13
Hm = 20*log10(abs(H));      % Get magnitude in dB
Theta = (angle(H))*360/(2*pi); % and phase in deg.
f = (1:N)*fs/N; % Frequency vector for plotting

figure(1);
subplot(2,1,1);
plot(f,Hm,'b-'); grid on;
legend('magnitude');ylabel('dB');xlabel('f [Hz]');
subplot(2,1,2);
plot(f,Theta,'r--'); grid on;
legend('phase');ylabel('degrees');xlabel('f [Hz]');

% Compute the Impulse Response
x = [0, ones(1,0.1*fs-1)]; % Generate an step input
y = filter(b,a,x);          % Step response

