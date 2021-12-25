%Che Justus Kwanga
%DFT Implementation Project
clearvars

%Read data from file into floating point array
fileID = fopen('signal.txt','r');
x=fscanf(fileID,'%f\n');
fclose(fileID);
t = linspace(0,1000,1028);
%Code to calculate the 1028-point DFT in X1(k)
N=1028;
for k=0:1027
    for n=0:1027
        y(n+1)=x(n+1)*exp((-1i*2*pi*(k-1)*(n-1))/N);
    end
    X1(k+1)=sum(y);
end
figure(1),plot(t,abs(X1));
title('X1(k)');
xlabel('Index') ;
ylabel('Magnitude');
figure(2),plot(t,angle(X1));
title('X1(k)');
xlabel('Index') ;
ylabel('Phase');

%Fft function to caluclate X2(k)
X2=fft(x);
figure(3),plot(t,abs(X2));
title('X2(k)');
xlabel('Index') ;
ylabel('Magnitude');
figure(4),plot(t,angle(X2));
title('X2(k)');
xlabel('Index') ;
ylabel('Phase');

X3_abs=abs(X2)-abs(X1);
X3_angle=angle(X2)-angle(X1);
figure(5),plot(t,abs(X3_abs));
title('X3(k)');
xlabel('Index') ;
ylabel('Magnitude');
figure(6),plot(t,angle(X3_angle));
title('X3(k)');
xlabel('Index') ;
ylabel('Phase');