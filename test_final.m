%% initial data
load xy
numCity = 100; % city number
num=200;% initial population size
pc=0.9; % cross probability
pm=0.2; % mute probability
dislist = myDistance(xy); % dislist, the distance matrix for all city
gnMax = 500;  % the max generation
Pop = zeros(num, numCity); % initial population 
for i = 1 : num 
    Pop(i,:) = randperm(numCity);
end
%% envolution
[~, cumulativeProb] = fitness(Pop, dislist);  
generationNum = 1; % record population
generationMeanValue = zeros(generationNum, 1);  
generationMaxValue = zeros(generationNum, 1);  
bestRoute = zeros(num, numCity); % the best route(generation)
newPop = zeros(num, numCity); % new population
while generationNum < gnMax + 1
   for j = 1 : 2 : num
      selectedC = select(cumulativeProb);  % select two menbers
      crossedC = cross(Pop, selectedC, pc);  % cross
      newPop(j, :) = mutation(crossedC(1, :),pm);  % mutation
      newPop(j + 1, :) = mutation(crossedC(2, :), pm); % mutation
   end
   Pop = newPop;  %new population
   [fitnessValue, cumulativeProb] = fitness(Pop, dislist);  % fitness of new population
   % record the best individual of this generation,
   [fmax, nmax] = max(fitnessValue); % 
   generationMeanValue(generationNum) = 1 / mean(fitnessValue); 
   generationMaxValue(generationNum) = 1 / fmax;   
   bestC = Pop(nmax, :);  % the best individual
   bestRoute(generationNum, :) = bestC; % 
   drawTSP(xy, bestC, generationMaxValue(generationNum), generationNum, 0);
   generationNum = generationNum + 1;
end
[bestValue,index] = min(generationMaxValue);
drawTSP(xy, bestRoute(index, :), bestValue, index,1);

% figure 
figure(2);
plot(generationMaxValue, 'r');  
hold on;
plot(generationMeanValue, 'b'); 
grid;
title('搜索过程');
legend('最优解', '平均解');
fprintf('遗传算法得到的最短距离: %.2f\n', bestValue);
fprintf('遗传算法得到的最短路线');
disp(bestRoute(index, :));


%% calculate the fitness
% function [chromoValues, cumulativeProbs] = fitness(s, dislist)
% inn = size(s, 1);  % pop size 
% chromoValues = zeros(inn, 1);
% for i = 1 : inn
%     chromoValues(i) = CalDist(dislist, s(i, :));  % 计算每条染色体的适应度
% end
% chromoValues = 1./chromoValues'; % 因为让距离越小，选取的概率越高，所以取距离倒数
% fsum = 0;
% for i = 1 : inn
%     fsum = fsum + chromoValues(i)^15;   
% end
% 
% probs = zeros(inn, 1);
% 
% for i = 1: inn
% 
%     probs(i) = chromoValues(i)^15 / fsum;
% 
% end
% cumulativeProbs = zeros(inn,1);
% cumulativeProbs(1) = probs(1);
% for i = 2 : inn
%     cumulativeProbs(i) = cumulativeProbs(i - 1) + probs(i);
% end
% cumulativeProbs = cumulativeProbs';
% end
% %% select
% function selectedNums = select(cumulatedPro)
% % select two individuals
% selectedNums = zeros(2, 1);
% for i = 1 : 2
%    r = rand;  
%    prand = cumulatedPro - r;
%    j = 1;
%    while prand(j) < 0
%        j = j + 1;
%    end
%    selectedNums(i) = j; 
%    % if same, chose another time
%    if i == 2 && j == selectedNums(i - 1)    
%        r = rand; 
%        prand = cumulatedPro - r;
%        j = 1;
%        while prand(j) < 0
%            j = j + 1;
%        end
%    end
% end
% end

%% cross
% function crossedC = cross(pop, selectedNums, crossProb)
% L = size(pop, 2); 
% crossProb = crossMuteOrNot(crossProb);% whether cross mute or not
% crossedC(1,:) = pop(selectedNums(1), :);
% crossedC(2,:) = pop(selectedNums(2), :);
% if crossProb == 1 
%    c1 = round(rand * (L - 2)) + 1;  % random select the point
%    c2 = round(rand * (L - 2)) + 1; 
%    chb1 = min(c1, c2);
%    chb2 = max(c1,c2);
%    middle = crossedC(1,chb1+1:chb2); % middle section ,for exchange
%    crossedC(1,chb1 + 1 : chb2)= crossedC(2, chb1 + 1 : chb2);
%    crossedC(2,chb1 + 1 : chb2)= middle;
%    for i = 1 : chb1 % check if unique, and change back
%        while find(crossedC(1,chb1 + 1: chb2) == crossedC(1, i))
%            location = find(crossedC(1,chb1 + 1: chb2) == crossedC(1, i));
%            y = crossedC(2,chb1 + location);
%            crossedC(1, i) = y; 
%        end
%        while find(crossedC(2,chb1 + 1 : chb2) == crossedC(2, i))
%            location = find(crossedC(2, chb1 + 1 : chb2) == crossedC(2, i));
%            y = crossedC(1, chb1 + location);
%            crossedC(2, i) = y;
%        end
%    end
%    for i = chb2 + 1 : L
%        while find(crossedC(1, 1 : chb2) == crossedC(1, i))
%            location = logical(crossedC(1, 1 : chb2) == crossedC(1, i));
%            y = crossedC(2, location);
%            crossedC(1, i) = y;
%        end
%        while find(crossedC(2, 1 : chb2) == crossedC(2, i))
%            location = logical(crossedC(2, 1 : chb2) == crossedC(2, i));
%            y = crossedC(1, location);
%            crossedC(2, i) = y;
%        end
%    end
% end
% end

%% mutation
% function new = mutation(x,pm)
% length = size(x, 2); 
% new = x;
% muteProbm = crossMuteOrNot(pm);  % whether run mutation or not
% if muteProbm == 1
%     c1 = round(rand*(length - 2)) + 1; 
%     c2 = round(rand*(length - 2)) + 1;  
%     chb1 = min(c1, c2);
%     chb2 = max(c1, c2);
%     x = x(chb1 + 1 : chb2); % middle part
%     new(chb1 + 1 : chb2) = fliplr(x); % reverse the middle
% end
% end

%% check whether mutation or cross
% function crossProb = crossMuteOrNot(crossMuteProb)
% test(1: 100) = 0;
% l = round(100 * crossMuteProb);
% test(1 : l) = 1; % [0 1] array 
% n = round(rand * 99) + 1;
% crossProb = test(n);
% end

% %% calculate distance
% function Value = CalDist(dislist, x)
% % distance matrix and a route
% DisV = 0; 
% n = size(x, 2); % 
% for i = 1 : (n - 1)
%     DisV = DisV + dislist(x(i), x(i + 1));
% end
% DisV = DisV + dislist(x(n), x(1));
% Value = DisV;
% end
% %% show the figure
% function drawTSP(xy, route, generationValue, generationNum,isBestGeneration)
% CityNum = size(xy, 1);
% for i = 1 : CityNum - 1
%     plot([xy(route(i), 1),xy(route(i + 1), 1)], [xy(route(i),2),xy(route(i+1),2)],'ms-','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g');
%     text(xy(route(i), 1),xy(route(i), 2), ['  ', int2str(route(i))]);
%     text(xy(route(i+1), 1),xy(route(i + 1), 2), ['  ', int2str(route(i+1))]);
%     hold on;
% end
% plot([xy(route(CityNum), 1), xy(route(1), 1)], [xy(route(CityNum), 2), xy(route(1), 2)],'ms-','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g');
% title([num2str(CityNum),'城市TSP']);
% if isBestGeneration == 0 && CityNum ~= 10
%     text(5, 5, ['第 ',int2str(generationNum),' 代','  最短距离为 ', num2str(generationValue)]);
% else
%     text(5, 5, ['最终搜索结果：最短距离 ',num2str(generationValue),'， 在第 ',num2str(generationNum),' 代达到']);
% end
% if CityNum == 10  % 因为文字显示位置不一样，所以将城市数目为 10 时单独编写
%     if isBestGeneration == 0
%         text(0, 0, ['第 ',int2str(generationNum),' 代','  最短距离为 ', num2str(generationValue)]);
%     else
%         text(0, 0, ['最终搜索结果：最短距离 ',num2str(generationValue),'， 在第 ', num2str(generationNum),' 代达到']);
%     end
% end
% hold off;
% pause(0.005);
% end

%%
% function D = myDistance(xy)
% n = size(xy,1); % city number
% D = zeros(n, n);% return the distance matrix
% for i=1:n
%     for j=1:n
%         D(i, j) = ((xy(i,1)-xy(j,1))^2 + (xy(i,2)-xy(j,2))^2)^0.5;
%     end
% end
% end
