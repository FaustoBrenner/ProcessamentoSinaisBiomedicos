N = 256; % number of samples
fs = 1000; % Sample frequency in Hz
L = 33; % Filter lengths
fc = 200/fs; % Filter cutoff frequency: 200 Hz

k = -floor(L/2):-1; % Construct k for negative b[k];
b = sin(2*pi*fc*k)./(pi*k); % Construct negative b[k]
b = [b 2*fc, fliplr(b)]; % Rest of b
% Rectangular Window ---------------------------------
H = (abs(fft(b,N)));% Compute H(m). in dB
H = H(1:N/2+1); H(2:end-1) = 2*H(2:end-1); %Get unilateral spectrum

% Blackman Window ------------------------------------
n = -floor(L/2):floor(L/2); % Window vector
w_B = 0.35875 + 0.48829*cos(2*pi*n/L) +...
0.14128*cos(4*pi*n/L) + 0.01168*cos(6*pi*n/L);
b_bh = b.*w_B; % Apply Blackman window
H_bh = (abs(fft(b_bh,N)));% Compute H(m). in dB
%Get unilateral spectrum
H_bh = H_bh(1:N/2+1); H_bh(2:end-1) = 2*H_bh(2:end-1); 

% Hamming Window -------------------------------------
b_hm = b.*hamming(L)'; % Apply Hamming window
H_hm = (abs(fft(b_hm,N)));% Compute H(m). in dB
%Get unilateral spectrum
H_hm = H_hm(1:N/2+1); H_hm(2:end-1) = 2*H_hm(2:end-1);

f = fs*(0:(N/2))/N;  % Frequency vector for plotting

plot(f,H,'b-'); grid on; hold on;
plot(f,H_bh,'r-');plot(f,H_hm,'k-');
legend('rectangular','Blackman', 'Hamming');
ylabel('dB');xlabel('f [Hz]');