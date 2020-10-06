function crossProb = crossMuteOrNot(crossMuteProb)
% use probability to decide if cross(/mute) or not
% return 0 or 1
test(1: 100) = 0;
l = round(100 * crossMuteProb);
test(1 : l) = 1; % [0 1] array 
n = round(rand * 99) + 1;
crossProb = test(n);
end