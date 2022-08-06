% Use 100,000 random normal numbers with a standard deviation of 5 
% and a mean of three

samples = 1e5;
mu = 3;
sigma = 5;
bins = 100;
% Rnd = normrnd(mu, sigma,[1, samples]);
% figure(1);
% hist(Rnd, bins)
grid on
% Plot red vertical lines for signma = -3:3
% And lab the z scores as shown
% -----
% Another way

xSig = sigma;
xBar = mu;
Rnd_z = randn(samples, 1)*xSig + xBar;
[Cnt_z, Bin_z] = hist(Rnd_z, bins);
Pdf_z = Cnt_z/sum(Cnt_z);
BinWid_z = mean(diff(Bin_z));
figure(2);
bar(Bin_z, Pdf_z/BinWid_z);
grid on

a = axis;
yMin = a(3);
yMax = a(4);
aBitDown = 0.007;
shift_array = zeros(7, 1) + (yMax - aBitDown);
hold on
plot([xBar xBar]-xSig, a(3:4), 'r');
plot([xBar xBar]+xSig, a(3:4), 'r');
plot([xBar xBar]-xSig*2, a(3:4), 'r');
plot([xBar xBar]+xSig*2, a(3:4), 'r');
plot([xBar xBar]-xSig*3, a(3:4), 'r');
plot([xBar xBar]+xSig*3, a(3:4), 'r');

text(    [xBar-xSig*3, xBar-xSig*2, xBar-xSig,...
         xBar, xBar + xSig, xBar+xSig*2,... 
         xBar + xSig*3],...
        shift_array,...
        {'z=-3', 'z=-2', 'z=-1', 'z=0',...
            'z=1', 'z=2', 'z=3'}...
)


title(['Sigma = 3, Mean = ', num2str(xBar)]);

hold off


