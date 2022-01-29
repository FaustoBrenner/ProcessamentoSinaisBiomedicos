fs = 200; % Sampling frequency
N = 20000;
% Construct moving average filters
b = [1 1 1 1 1]/5;
% Zero padding
b = [b zeros(1,N-1)]; % Zero padding
B = fft(b,N); % Find filter system spectrum
B = [B(1) 2*B(2:N/2)]; % Unilateral Spectrum
B_mag = abs(B); % Compute magnitude spectrum
f = (1:N/2)*fs/N; % frequency axis

figure(1) % plotting te magnitude spectrum
subplot(2,1,1)
plot(f,B_mag, 'b-', 'LineWidth',2);
legend('padding');grid on;

b = [1 1 1 1 1]/5; % redefining b
y = conv(b, randn(N,1)); % finding the filter response to noise
f = 0:fs/N:fs/2; % frequency axis
% Welch method with size 128      
nfft = 128;
[psd,f] = pwelch(y,nfft, nfft*0.5,[], fs);
B_mag = sqrt(psd);  % get magnitude

subplot(2,1,2) % plot the response to white noise
plot(f,B_mag, 'r-', 'LineWidth',2);
legend('noise');grid on; xlabel('f [Hz]');