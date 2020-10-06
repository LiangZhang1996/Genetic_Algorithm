function Value = CalDist(dislist, x)
% calculate the distance of a route
%input the  distance matrix and a route
DisV = 0; 
n = size(x, 2); % 
for i = 1 : (n - 1)
    DisV = DisV + dislist(x(i), x(i + 1));
end
DisV = DisV + dislist(x(n), x(1));
Value = DisV;
end