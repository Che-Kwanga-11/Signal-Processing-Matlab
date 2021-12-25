Fs=100;  % sample @ 100 Hz
T=10;    % collect data long enough for at least a couple cycles
N=T*Fs;  % compute number samples needed for above
t=linspace(0,10,N);  % and generate time vector
y = 0.7*sin(2*pi*4*t)+randn(size(t));  % and a sample signal around 4Hz
Y = fft(y)/N;              % FFT
PSD=2*abs(Y(1:L/2+1));     % and the PSD one-sided
f=linspace(0,Fs/2,N/2+1);  % compute freq vector for Fs
plot(f,PSD)                % plot the result
hold all                   % we're going to put another on top...
