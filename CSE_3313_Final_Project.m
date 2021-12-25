% Che Justus Kwanga
% Filter Design Project

clearvars
% Read audio from file using audioread method
[x,Fs]=audioread("noisyaudio.wav"); % get audio sample
N =length(x);                       % get DFT of audio sample
dft=fft(x);     
f=(-N/2:N/2-1)*Fs/(N);
figure(1), plot(f,abs(dft));
title('Unfiltered Audio');
xlabel('Frequency') ;
ylabel('Magnitude of the DFT');
%labels
dft=dft/max(dft);
figure(2),plot(f,20*log(abs(dft)));
title('Normalized Log plot of DFT vs Frequency');
xlabel('Frequency') ;
ylabel('Normalized Log of DFT');

% determine filter parameters
wP=0.15*pi;
wS=0.35*pi;
kP=(1/((10^(-1/20))^2))-1;
kS=(1/((10^(-30/20))^2))-1;
N=ceil(0.5*((log(kS/kP))/(log(wS/wP))));
fprintf('N :%f\n',N);
deltaC=wP/(kP^(1/(2*N)));
deltaC=deltaC*(Fs/2);
HaS=20*log(sqrt(1./(1+(((f)/deltaC).^2*N))));
HaS=HaS';
figure(3),plot(f,HaS);
title('Logarithmic gain of the Frequency Response');
xlabel('Frequency') ;
ylabel('Logarithmic Gain');

% filter implementation
Wc=deltaC/(Fs/2);
Wn=Wc/pi;
fprintf('Wn:%f\n',Wn);
[B,A]= butter(N,Wn);
filteredSound=filter(B,A,x);
soundDFT=fft(filteredSound);
L2=length(soundDFT);
Y=soundDFT/L2;
figure(4),plot(f,abs(Y));
title('Filtered Audio');
xlabel('Frequency') ;
ylabel('Magnitude of the DFT');
sound(filteredSound,Fs);
audiowrite('filteredaudio.wav',filteredSound,Fs);

