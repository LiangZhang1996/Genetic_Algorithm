%% test3
% generation ranges from 1000 to 10000
% find the best generation numbers
%% initial data 
% load xy
% numCity = 100; % city number
% pc=0.9; % cross probability
% pm=0.2; % mute probability
% dislist = myDistance(xy); % dislist, the distance matrix for all city
popNum=50;% initial population size
genMax=1000:1000:10000;
for i=6:10
    GaTSP(popNum,genMax(i))
end