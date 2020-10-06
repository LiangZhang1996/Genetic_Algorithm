function D = myDistance(xy)
% calculate the distance matrix of cities.
n = size(xy,1); % city number
D = zeros(n, n);% return the distance matrix
for i=1:n
    for j=1:n
        D(i, j) = ((xy(i,1)-xy(j,1))^2 + (xy(i,2)-xy(j,2))^2)^0.5;
    end
end
end