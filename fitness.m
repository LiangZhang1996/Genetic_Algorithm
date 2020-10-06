function [fitnessValues, cumulativeProb] = fitness(s, dislist)
inn = size(s, 1);  % pop size 
fitnessValues = zeros(inn, 1);
for i = 1 : inn
    fitnessValues(i) = CalDist(dislist, s(i, :));  % calculate distance
end
fitnessValues = 1./fitnessValues'; % calculate fitness with diatance
fsum = 0;
for i = 1 : inn
    fsum = fsum + fitnessValues(i)^15;   
end
% high fitness will have high probability ti be selected
probs = zeros(inn, 1);
for i = 1: inn
    probs(i) = fitnessValues(i)^15 / fsum;
end

cumulativeProb = zeros(inn,1);
cumulativeProb(1) = probs(1);
for i = 2 : inn
    cumulativeProb(i) = cumulativeProb(i - 1) + probs(i);
end
cumulativeProb = cumulativeProb';
end