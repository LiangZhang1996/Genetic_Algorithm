%% test1
% with 50 to 200 population members, 1000 generations
% find the best population members values
%% initial data 
% load xy
% numCity = 100; % city number
% pc=0.9; % cross probability
% pm=0.2; % mute probability
% dislist = myDistance(xy); % dislist, the distance matrix for all city
popNum=50:50:200;% initial population size
genMax=1000;
for i=1:4
    GaTSP(popNum(i),genMax)
end
