function crossedC = cross(pop, selectedNums, crossProb)
% input the population, selected members, cross probability
L = size(pop, 2); 
crossProb = crossMuteOrNot(crossProb);% whether cross mute or not
crossedC(1,:) = pop(selectedNums(1), :);
crossedC(2,:) = pop(selectedNums(2), :);
if crossProb == 1 
   c1 = round(rand * (L - 2)) + 1;  % random select the point
   c2 = round(rand * (L - 2)) + 1; 
   chb1 = min(c1, c2);
   chb2 = max(c1,c2);
   middle = crossedC(1,chb1+1:chb2); % middle section ,for exchange
   crossedC(1,chb1 + 1 : chb2)= crossedC(2, chb1 + 1 : chb2);
   crossedC(2,chb1 + 1 : chb2)= middle;
   for i = 1 : chb1 % check if unique, and change back
       while find(crossedC(1,chb1 + 1: chb2) == crossedC(1, i))
           location = find(crossedC(1,chb1 + 1: chb2) == crossedC(1, i));
           y = crossedC(2,chb1 + location);
           crossedC(1, i) = y; 
       end
       while find(crossedC(2,chb1 + 1 : chb2) == crossedC(2, i))
           location = find(crossedC(2, chb1 + 1 : chb2) == crossedC(2, i));
           y = crossedC(1, chb1 + location);
           crossedC(2, i) = y;
       end
   end
   for i = chb2 + 1 : L
       while find(crossedC(1, 1 : chb2) == crossedC(1, i))
           location = logical(crossedC(1, 1 : chb2) == crossedC(1, i));
           y = crossedC(2, location);
           crossedC(1, i) = y;
       end
       while find(crossedC(2, 1 : chb2) == crossedC(2, i))
           location = logical(crossedC(2, 1 : chb2) == crossedC(2, i));
           y = crossedC(1, location);
           crossedC(2, i) = y;
       end
   end
end
end