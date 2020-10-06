function selectedNums = select(cumulatedPro)
% random  select two individuals
% roulette-wheel selection
selectedNums = zeros(2, 1);
for i = 1 : 2
   r = rand;  
   prand = cumulatedPro - r;
   j = 1;
   while prand(j) < 0
       j = j + 1;
   end
   selectedNums(i) = j; 
   % if same, chose another time
   if i == 2 && j == selectedNums(i - 1)    
       r = rand; 
       prand = cumulatedPro - r;
       j = 1;
       while prand(j) < 0
           j = j + 1;
       end
   end
end
end