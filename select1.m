function selectedNums = select1(fitness)
% random  select two individuals
% tournament selection

% each time random select k
k=20;
n = length(fitness);
selectedNums = zeros(2, 1);
for i = 1 :2
    randidx = randperm(n,k);
    randfitness = fitness(randidx);    
    [~,idx]=max(randfitness);
    selectedNums(i)=randidx(idx);
    while i==2 && randidx(idx)==selectedNums(1)
        randidx = randperm(n,k);
        if max(randidx)>n
            disp(randidx)
            break
        end
        randfitness = fitness(randidx);    
        [~,idx]=max(randfitness);
        selectedNums(i)=randidx(idx);
        
    end
end
end
