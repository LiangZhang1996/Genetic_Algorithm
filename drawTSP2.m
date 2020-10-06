function drawTSP2(xy,optRoute,minDist,bestFit)
figure('Name','TSP_GA | Results', 'NumberTitle','off');
% subplot(2,2,1)
% pclr = ~get(0,'DefaultAxesColor');
% plot(xy(:,1),xy(:,2),'.','Color',pclr)
% title('City Locations');
subplot(1,2,1);
rte = optRoute([1:100 1]);
plot(xy(rte,1),xy(rte,2),'r.-')
title(sprintf('Total Distance = %1.4f', minDist));
subplot(1,2,2)
n = length(bestFit);
x = 1:n;
plot(x,bestFit)
ylabel('Fitness')
xlabel('Generations')
title('Best fitness of each generation' )
end
