function new = mutation1(x,pm)
% flip
length = size(x, 2); 
new = x;
muteProb = crossMuteOrNot(pm);  % whether run mutation or not
if muteProb == 1
    c1 = round(rand*(length - 2)) + 1; 
    c2 = round(rand*(length - 2)) + 1;  
    chb1 = min(c1, c2);
    chb2 = max(c1, c2);
    x = x(chb1 + 1 : chb2); % middle part
    new(chb1 + 1 : chb2) = fliplr(x); % reverse the middle
end
end