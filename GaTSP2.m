function GaTSP2(popNum, genMax)
% input generation number and the population number
% default use flip mutation operator
% use tournament selection
load xy
numCity = 100; % city number
pc=0.9; % cross probability
pm=0.2; % mute probability
dislist = myDistance(xy); % dislist, the distance matrix for all city

Pop = zeros(popNum, numCity); % initial population 
for i = 1 : popNum 
    Pop(i,:) = randperm(numCity);
end

bestFit = [];
[fitnessValue, ~] = fitness(Pop, dislist);  
generationNum = 1; % record population 
bestRoute1 = zeros(popNum, numCity); % the best route(generation)
newPop = zeros(popNum, numCity); % new population
while generationNum < genMax + 1
   for j = 1 : 2 : popNum
      selectedC = select1(fitnessValue);  % select two menbers
      crossedC = cross(Pop, selectedC, pc);  % cross
      newPop(j, :) = mutation1(crossedC(1, :),pm);  % mutation
      newPop(j + 1, :) = mutation1(crossedC(2, :), pm); % mutation
   end
   Pop = newPop;  %new population
   [fitnessValue, ~] = fitness(Pop, dislist);  % fitness of new population
   % record the best individual of this generation,
   [fmax, nmax] = max(fitnessValue); % 
   bestFit = [bestFit;fmax];
   bestC = Pop(nmax, :);  % the best individual
   bestRoute1(generationNum, :) = bestC; % 
   generationNum = generationNum + 1;
end
drawTSP2(xy,bestC,1/fmax, bestFit)
end

