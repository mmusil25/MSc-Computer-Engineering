% Copyright (c) 2015 by OU AEC and Curtis Cohenour (cohenour@ohio.edu). All Rights Reserved.
% 20150331 Jcc (Curtis Cohenour) original
clc, clear, close all, %close all hidden
%% Set up number of samples etc for the fft
SmpFrq=20e3;          % sample frequency
SmpPrd=1/SmpFrq;      % sample period
NumSmp=2^14;          % the fft works on powers of 2
SmpLen=SmpPrd*NumSmp; % sample length
DelFrq=SmpFrq/NumSmp;
%% compute the frequencies for the fft
Idx=(1:NumSmp)'-1;
Frq0=Idx*DelFrq;
fndx=Frq0>SmpFrq/2;
Frq0(fndx)=Frq0(fndx)-SmpFrq;
Frq1=fftshift(Frq0);
%% compute the time vector
t=((1:NumSmp)'-1)*SmpPrd;   % a column of time values
%% generate signal
if true
    %% generate random data
    RndSmp=randn(NumSmp,1);     % a column of random values
else
    %% generate random data
    RndSmp=cos(2*pi*100*t);     % a 100 hz sine wave
end
%% take the fft
RndSpc0=fft(RndSmp);
RndSpc1=fftshift(RndSpc0);
RndSpcMag=abs(RndSpc1);
%% plot
figure(100)
plot(Frq1, RndSpcMag)
grid on
xlabel('Frequency (Hz)')
ylabel('Spectrum Magnitude')
tmp=0;
%% filter the siginal with a 100 hz first order filter
f0=100; % Hz
Omg=2*pi*f0; % radian freq
Tau=1/Omg;
k=1-exp(SmpPrd/Tau);
[lRndSmp,wRndSmp]=size(RndSmp);
FltOut=zeros(lRndSmp,1);
for i=2:lRndSmp
    FltOut(i)=FltOut(i-1)*(1-k)+RndSmp(i)*k;
end
%% take the fft of filter output
FltSpc0=fft(FltOut);
FltSpc1=fftshift(FltSpc0);
FltSpcMag=abs(FltSpc1);
%% plot
figure(200)
plot(Frq1, FltSpcMag)
grid on
xlabel('Frequency (Hz)')
ylabel('Spectrum Magnitude')
tmp=0;
%% plot bode plot
fndx=Frq1>=0;
fndx(1)=false;
Frq2=Frq1(fndx);
FltSpcMag2=FltSpcMag(fndx);
FltSpcMag3=20*log10(FltSpcMag2/max(FltSpcMag2));
figure(300)
semilogx(Frq2, FltSpcMag3)
grid on
xlabel('Frequency (Hz)')
ylabel('Spectrum Magnitude')
tmp=0;
%% plot the bode plot another way
s=1i*2*pi*Frq2; % s=jw, matlab 1i is sqrt(-1), same as electrical j
Y=1./(Tau*s+1);
Ymag4=abs(Y);
Mag4=20*log10(Ymag4);
hold on
semilogx(Frq2, Mag4, 'r--')
hold off
%% Now do the bode plot from scratch
f0=1;                  % Start Freq
f1=10e4;               % End Freq
Lg0=log10(f0);         % log of Start Freq
Lg1=log10(f1);         % log End Freq
Lgf=(Lg0:0.1:Lg1)';    % Equally spaced freqs in log
Frq5=10.^Lgf;          % frequencies not these are equally spaced in log
%% set up the complex radian freq
s5=2*pi*1i*Frq5;
%% compute the gain
Gan5=1./(Tau*s5+1);
% compute abs value and angle
GanMag5=abs(Gan5);
Ang5=angle(Gan5)*360/(2*pi);
% convert gain to dB
Mag5=20*log10(GanMag5);
%% plot using subplots
figure(400)
subplot(2,1,1);
semilogx(Frq5, Mag5)
grid on
ylabel('Spectrum Magnitude')
subplot(2,1,2);
semilogx(Frq5, Ang5)
grid on
xlabel('Frequency (Hz)')
ylabel('Spectrum Angle')
tmp=0;




