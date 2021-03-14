N = 500;        % Number of points
T = 0.2;        % Period of the wave
f = 1/T;        % Frequenmcy of the wave
M = 4;          % Number os cycles to generate

% We want to plot M cycles of the wave, so our sampling interval is
Ts = M*T/N;

% Defining our time vector in a whole period of the wave
t = [0:Ts:T-Ts];
square_period = rect((t-T/4)/(T/2)) - rect((t-3*T/4)/(T/2));

time =[];
sq = [];

for i=-M/2:M/2-1,
    time = [time i*T+t];
    sq = [sq square_period];
end

figure(1); fy=plot(time,sq);
set(fy,'Linewidth', 2); xlabel('Time (s)'); ylabel('{\it v(t)}');
xlim([-0.5 0.5]); ylim([-1.5 1.5]);

echo on
