%% test1
% test the three mutation operators,
% swap, flip and slide

%% initial data 
load xy
numCity = 100; % city number
pc=0.9; % cross probability
pm=0.2; % mute probability
dislist = myDistance(xy); % dislist, the distance matrix for all city
genMax = 1000;  % the max generation
popNum=200;% initial population size

Pop = zeros(popNum, numCity); % initial population 
for i = 1 : popNum 
    Pop(i,:) = randperm(numCity);
end

% use swap operator, with function mutation2

Pop1 = Pop;
bestFit1 = [];
[~, cumulativeProb] = fitness(Pop1, dislist);  
generationNum = 1; % record population 
bestRoute1 = zeros(popNum, numCity); % the best route(generation)
newPop1 = zeros(popNum, numCity); % new population
while generationNum < genMax + 1
   for j = 1 : 2 : popNum
      selectedC = select(cumulativeProb);  % select two menbers
      crossedC = cross(Pop1, selectedC, pc);  % cross
      newPop1(j, :) = mutation2(crossedC(1, :),pm);  % mutation
      newPop1(j + 1, :) = mutation2(crossedC(2, :), pm); % mutation
   end
   Pop1 = newPop1;  %new population
   [fitnessValue, cumulativeProb] = fitness(Pop1, dislist);  % fitness of new population
   % record the best individual of this generation,
   [fmax, nmax] = max(fitnessValue); % 
   bestFit1 = [bestFit1;fmax];
   bestC1 = Pop1(nmax, :);  % the best individual
   bestRoute1(generationNum, :) = bestC1; % 
   generationNum = generationNum + 1;
end
drawTSP(xy,bestC1,1/fmax, bestFit1)

%%  use flip operator, with function mutation1
Pop2 = Pop;
bestFit2 = [];
[~, cumulativeProb] = fitness(Pop2, dislist);  
generationNum = 1; % record population 
bestRoute2 = zeros(popNum, numCity); % the best route(generation)
newPop2 = zeros(popNum, numCity); % new population
while generationNum < genMax + 1
   for j = 1 : 2 : popNum
      selectedC = select(cumulativeProb);  % select two menbers
      crossedC = cross(Pop2, selectedC, pc);  % cross
      newPop2(j, :) = mutation1(crossedC(1, :),pm);  % mutation
      newPop2(j + 1, :) = mutation1(crossedC(2, :), pm); % mutation
   end
   Pop2 = newPop2;  %new population
   [fitnessValue, cumulativeProb] = fitness(Pop2, dislist);  % fitness of new population
   % record the best individual of this generation,
   [fmax, nmax] = max(fitnessValue); % 
   bestFit2 = [bestFit2;fmax];
   bestC2 = Pop2(nmax, :);  % the best individual
   bestRoute2(generationNum, :) = bestC2; % 
   generationNum = generationNum + 1;
end
drawTSP(xy,bestC2,1/fmax, bestFit2)

%% use slide operator, with function mutation3

Pop3 = Pop;
bestFit3 = [];
[~, cumulativeProb] = fitness(Pop3, dislist);  
generationNum = 1; % record population 
bestRoute3 = zeros(popNum, numCity); % the best route(generation)
newPop3 = zeros(popNum, numCity); % new population
while generationNum < genMax + 1
   for j = 1 : 2 : popNum
      selectedC = select(cumulativeProb);  % select two menbers
      crossedC = cross(Pop3, selectedC, pc);  % cross
      newPop3(j, :) = mutation3(crossedC(1, :),pm);  % mutation
      newPop3(j + 1, :) = mutation3(crossedC(2, :), pm); % mutation
   end
   Pop3 = newPop3;  %new population
   [fitnessValue, cumulativeProb] = fitness(Pop3, dislist);  % fitness of new population
   % record the best individual of this generation,
   [fmax, nmax] = max(fitnessValue); % 
   bestFit3 = [bestFit3;fmax];
   bestC3 = Pop3(nmax, :);  % the best individual
   bestRoute3(generationNum, :) = bestC3; % 
   generationNum = generationNum + 1;
end
drawTSP(xy,bestC3,1/fmax, bestFit3)
