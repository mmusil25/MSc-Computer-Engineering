% %% Now do the bode plot from scratch
% f0=1;                  % Start Freq
% f1=10e4;               % End Freq
% Lg0=log10(f0);         % log of Start Freq
% Lg1=log10(f1);         % log End Freq
% Lgf=(Lg0:0.1:Lg1)';    % Equally spaced freqs in log
% Frq5=10.^Lgf;          % frequencies not these are equally spaced in log
% %% set up the complex radian freq
% s5=2*pi*1i*Frq5;
% %% compute the gain
% Gan5=1./(Tau*s5+1);
% % compute abs value and angle
% GanMag5=abs(Gan5);
% Ang5=angle(Gan5)*360/(2*pi);
% % convert gain to dB
% Mag5=20*log10(GanMag5);
% %% plot using subplots
% figure(400)
% subplot(2,1,1);
% semilogx(Frq5, Mag5)
% grid on
% ylabel('Spectrum Magnitude')
% subplot(2,1,2);
% semilogx(Frq5, Ang5)
% grid on
% xlabel('Frequency (Hz)')
% ylabel('Spectrum Angle')
% tmp=0;


H = tf([4000, 4000*5],[1, 210,12e3, 1e5]);
bode(H)

