function new = mutation3(x,pm)
% slide
length = size(x, 2); 
new = x;
muteProb = crossMuteOrNot(pm);  % whether run mutation or not
if muteProb == 1
    c1 = round(rand*(length - 2)) + 1; 
    c2 = round(rand*(length - 2)) + 1;  
    chb1 = min(c1, c2);
    chb2 = max(c1, c2);
    new(chb1 : chb2-1) = x(chb1 + 1 : chb2); 
    new(chb2) = x(chb1);
    
end
end