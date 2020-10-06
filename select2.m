function selectedNums = select2(fitness)
% random  select two individuals
% ranking selection
selectedNums = zeros(2,1);
[~, index]=sort(fitness);
n = length(fitness);
P_max=0.8; P_min=0.2;
% num = sum(1:n);
 prob = zeros(1,n);
% index is the location of the original fitness
for i=1:n
    prob(i)= P_min+(P_max-P_min)*(i-1)/(n-1);
end
psum = sum(prob);
wheel = prob/psum;
wheel = cumsum(wheel);
%selectedNums=select(prob);

for i=1:2
    r = rand;
    idx = find(wheel>=r);
    selectedNums(i)=index(idx(1));
    if i==2 && selectedNums(i)==selectedNums(1)
        r = rand;
        idx = find(wheel>=r);
        selectedNums(i)=index(idx(1));
    end
        
end