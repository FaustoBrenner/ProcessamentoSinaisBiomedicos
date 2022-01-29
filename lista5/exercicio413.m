N = 256; % number of samples
fs = 1000; % Sample frequency in Hz
L = 129; % Filter lengths
fc = 100/fs; % Filter cutoff frequency: 100 Hz

k = -floor(L/2):-1; % Construct k for negative b[k];
b = sin(2*pi*fc*k)./(pi*k); % Construct negative b[k]
b = [b 2*fc, fliplr(b)]; % Rest of b

% Blackman Window ------------------------------------
n = -floor(L/2):floor(L/2); % Window vector
w_B = 0.35875 + 0.48829*cos(2*pi*n/L) +...
0.14128*cos(4*pi*n/L) + 0.01168*cos(6*pi*n/L);
b_bh = b.*w_B; % Apply Blackman window

% Hamming Window -------------------------------------
b_hm = b.*hamming(L)'; % Apply Hamming window

% Impulse response
x = [1 zeros(1,255)];
y = filter(b,1,x);
y_B = filter(b_bh,1,x);
y_H = filter(b_hm,1,x);

t = [0:(N-1)]/fs; % time vector for plotting

plot(t,y,'b-'); grid on; hold on;
plot(t,y_B,'r-');plot(t,y_H,'k-');
legend('rectangular','Blackman', 'Hamming');
ylabel('Amplitude');xlabel('t [s]');