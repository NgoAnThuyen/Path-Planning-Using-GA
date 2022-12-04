
figure(3)

hold on
fill([0-0.5 0+1.5 0+1.5 0-0.5],[0+0.5 0+0.5 0-0.5 0-0.5 ],[89, 147, 112]/255);
fill([0-0.5 0+1.5 0+1.5 0-0.5],[-1+0.5 -1+0.5 -1-0.5 -1-0.5 ],[89, 147, 112]/255);
fill([0-0.5 0+1.5 0+1.5 0-0.5],[-2+0.5 -2+0.5 -2-0.5 -2-0.5 ],[89, 147, 112]/255);

fill([2-0.5 2+1.5 2+1.5 2-0.5],[0+0.5 0+0.5 0-0.5 0-0.5 ],[89, 147, 112]/255);
fill([2-0.5 2+1.5 2+1.5 2-0.5],[-1+0.5 -1+0.5 -1-0.5 -1-0.5 ],[0.8627 0.8627 0.8627]);
fill([2-0.5 2+1.5 2+1.5 2-0.5],[-2+0.5 -2+0.5 -2-0.5 -2-0.5 ],[0.8627 0.8627 0.8627]);


fill([4-0.5 4+1.5 4+1.5 4-0.5],[0+0.5 0+0.5 0-0.5 0-0.5 ],[89, 147, 112]/255);
fill([4-0.5 4+1.5 4+1.5 4-0.5],[-1+0.5 -1+0.5 -1-0.5 -1-0.5 ],[0.8627 0.8627 0.8627]);
fill([4-0.5 4+1.5 4+1.5 4-0.5],[-2+0.5 -2+0.5 -2-0.5 -2-0.5 ],[0.8627 0.8627 0.8627]);

text(0,0,'Number of node'); text(2,0,'The first')                        ;text(4,0,'The best fit');
text(0,-1,'Fitness')      ; text(2,-1,num2str(bestfit0))                 ;text(4,-1,num2str(bestfit(end)));
text(0,-2,'Distance')     ; text(2,-2,num2str(Calc_Distance(path0,map))) ;text(4,-2,num2str(Calc_Distance(path,map)));
xlim([-0.5 5.5])
ylim([-3 0.5])

set(gca,'xticklabel',{[]})
set(gca,'yticklabel',{[]})
set(gca,'XColor', 'none','YColor','none')
title('The result of path planning based on GA')