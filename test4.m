%% test4
% different selection method
%% initial data
load xy
numCity = 100; % city number
pc=0.9; % cross probability
pm=0.2; % mute probability
dislist = myDistance(xy); % dislist, the distance matrix for all city
popNum=200;
genMax=10000;

%% roulette-wheel, select()
GaTSP(popNum, genMax)

%% ranking selection, select2()
GaTSP1(popNum, genMax)

%% tournament selection, select1()
GaTSP2(popNum, genMax)