% Copyright (c) 2015 by OU AEC and Curtis Cohenour (cohenour@ohio.edu). All Rights Reserved.
% 20150216 Jcc (Curtis Cohenour) original
clc, clear, close all, %close all hidden
%% dist 1 Uniform distribution
Rnd1=rand(10000,1);
figure(100)
hist(Rnd1,100)
a=axis;
axis(a+[-.2 .21 -10 0]);
grid on
Men1=mean(Rnd1)
Std1=std(Rnd1)
Max1=max(Rnd1)
Min1=min(Rnd1)
Max1-1
% note that the numbers are evenly distributed between 0 and 1
% while the max displays as one you can see that it is less than 1
% Note that the mean is aprox 0.5 and the std is 0.289
%% dist 2 normal distribution
Rnd2=randn(10000,1);
figure(200)
hist(Rnd2,100)
grid on
Men2=mean(Rnd2)
Std2=std(Rnd2)
Max2=max(Rnd2)
Min2=min(Rnd2)
Max2-1
% mean is aprox 0, std is 1 min is -3.36, max is 4.28
% what kind of distrigution is this?
%% dist 3 binomial dist
Rnd3=binornd(100,0.2,100000,1);
figure(300)
hist(Rnd3,100)
grid on
Men3=mean(Rnd3)
Std3=std(Rnd3)
Max3=max(Rnd3)
Min3=min(Rnd3)
% mean is 20 = .2*100, std is 4
% what is the big difference?  Look at the values in Rnd3
% what kind of distrigution is this?
%% Pdf normal
Rnd4=randn(100000,1);
[Cnt,Bin]=hist(Rnd4,1000);
Pdf=Cnt/sum(Cnt);
BinWid=mean(diff(Bin));
figure(400)
bar(Bin,Pdf/BinWid)
grid on
%% Cdf and Erf
Cdf1=cumsum(Pdf);
Erf=1/2+1/2*erf(Bin/sqrt(2));
Erfc=1/2*erfc(-Bin/sqrt(2));
NrmCdf=normcdf(Bin); % qfunc not available in 2014
figure(410)
plot(Bin, Cdf1,'b')
hold on
plot(Bin,Erf,'r')
plot(Bin,NrmCdf,'m')
plot(Bin,Cdf1-Erf+0.5,'g')
plot(Bin,(Cdf1-Erf).*Cdf1*100+0.5,'c')
hold off
grid on
%% Z, z=(x-xBar)/xSig
xSig=3;
xBar=10;
Rnd5=randn(100000,1)*xSig+xBar;
[Cnt5,Bin5]=hist(Rnd5,1000);
Pdf5=Cnt5/sum(Cnt5);
BinWid5=mean(diff(Bin5));
figure(500)
bar(Bin5,Pdf5/BinWid5);
grid on
a=axis; %a=[xmin xmax ymin ymax];
% add mean and +/- 1 sig
hold on
plot([xBar xBar], a(3:4), 'r')
plot([xBar xBar]-xSig, a(3:4), 'g')
plot([xBar xBar]+xSig, a(3:4), 'g')
plot([xBar xBar]-xSig*2, a(3:4), 'g')
plot([xBar xBar]+xSig*2, a(3:4), 'g')
plot([xBar xBar]-xSig*3, a(3:4), 'g')
plot([xBar xBar]+xSig*3, a(3:4), 'g')
hold off
title('Sigma=3, Xbar=10');
%% find the probability that x<7
% first use pdf
fndx=Bin5<7;           
p7a=sum(Pdf5(fndx));
%  now use erf
%  z=(x-xBar)/xSig
x7=7;
z7=(x7-xBar)/xSig;
p7b=1/2+1/2*erf(z7/sqrt(2));
disp([p7a,p7b, p7a-p7b])
%% replot with shaded area
figure(510)
bar(Bin5(~fndx),Pdf5(~fndx)/BinWid5,'c');
grid on
hold on
bar(Bin5(fndx),Pdf5(fndx)/BinWid5,'g');
plot([xBar xBar], a(3:4), 'r')
plot([xBar xBar]-xSig, a(3:4), 'g')
plot([xBar xBar]+xSig, a(3:4), 'g')
plot([xBar xBar]-xSig*2, a(3:4), 'g')
plot([xBar xBar]+xSig*2, a(3:4), 'g')
plot([xBar xBar]-xSig*3, a(3:4), 'g')
plot([xBar xBar]+xSig*3, a(3:4), 'g')
hold off
%% compute probability vs sigma
for kSig=1:6
    Prb(kSig,1)=normcdf(kSig)-normcdf(-kSig);
    %Prb(kSig,1)=normcdf(-kSig);
end
%Ap(Prb)
