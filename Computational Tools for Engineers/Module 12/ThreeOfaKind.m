% ThreeOfaKind.m 
% Generate a random shuffle 
% deal 5 cards
% check to see if there 3 of a kind but no full house
% Copyright (c) 2010 2011 2012 2013 2014 2015 by OU AEC and Curtis Cohenour. All Rights Reserved.
% 20101228 Jcc (Curtis Cohenour) original from ThreeAces
% 20150403 Jcc Modify debug print out
clc, clear, close all, close all hidden
Len=1000; %1e6; % 00; %000; %0000; %000;        % do this many hands 
Den=(1:13)';         % card denomination A 2 3 ... K
Sut=ones(13,1);      % suit 1 2 3 4 for diamond heart club spade
Dek0=[Den Sut*1      % Make a deck of cards 52x2.  Col 1 is den, col 2 is suit
      Den Sut*2
      Den Sut*3
      Den Sut*4];
Dek1=Dek0(:,1)*10+ Dek0(:,2);  % make up a new column DD.S  Denomination.Suit
Dek=[rand(52,1) Dek1 Dek0];    % add a column of random numbers 
%% do a large number of hands and determine if the hand is 3 of a kind
TreKnd=0;                                              % initialize three of a kind counter
h=waitbar(0, 'Look for three of a kind');              % start a waitbar
for i=1:Len                                            % for each hand   
    %% shuffle the cards
    kDekRnd=[rand(52,1) Dek1 Dek0];                         % Fresh Deck columns are [rand nns nn s]
    kDek=sortrows(kDekRnd,1);                               % Shuffle the cards
    kHnd=kDek(1:5,:);                                       % draw a hand
    %% calculate the number of cards for each denomination
    kDen=kHnd(:,3);                                         % extact the denomiantion
    nDen=zeros(13,1);                                       % zero out the denomiantion counter
    for iDen=1:13;                                          % for each denominaton
        fDen=kDen==iDen;                                         % generate a flag if this denomination is in the hand
        nDen(iDen)=sum(fDen);                                    % calculate the number of times this denomination is in the hand
    end
    %% decide if this is three of a kind
    nDenSrt=sortrows(nDen, -1);                             % sort the denomination count from highest to lowest
    if nDenSrt(1)==3 && nDenSrt(2)==1                       % for three of a kind the sorted denomation must be 3 1 1 0 0 0 0 0 0
        TreKnd=TreKnd+1;                                         % increment 3 of a kind counter
        fprintf('%2d %1d     ', kHnd(:,3:4)'); fprintf('\n');    % print the hand (debug)
        waitbar(i/Len);                % start a waitbar         % update waitbar inside of if to save time
    end
end
close(h);
%%
NumPrbTreKnd=TreKnd/Len;                          %  
AnaPrbTreknd=52/52* 3/51* 2/50* 48/49* 44/48 * factorial(5)/factorial(3)/factorial(2); %(52*51*50*49*48)*5*4/2;      %  0.021128451380552
WikPrbTreknd=54912/2598960;                            %  0.021128451380552 from  http://en.wikipedia.org/wiki/Poker_probability
fprintf('Num Prb: %10.8f, True Prb: %10.8f \n', NumPrbTreKnd, AnaPrbTreknd);
tmp=0;