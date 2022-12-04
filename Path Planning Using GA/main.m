tic
clc
clear all
close all
rand('state',sum(100*clock));
GenGrid; % tao ban do
if(n < 0)     
for i = 1:length(Obs)	
        [xb(i), yb(i)]= ConvertToXY(Obs(i),map); % return array obs
        rect(xb(i),yb(i),'obs');
end
end
prompt = {'Enter max generation:','Enter max stall generation:','Enter pop_size:','Enter cross_prob:','Enter Mutate_prob', 'Enter 1 to conserve best individual:' };
dlgtitle = 'Parameter Input';
dims = [1 35];
definput = {'400','100','60','0.9','0.5','1'};
parameter            = inputdlg(prompt,dlgtitle,dims,definput);
max_generation       = str2double(parameter{1});
max_stall_generation = str2double(parameter{2});
pop_size             = str2double(parameter{3});
cross_prob           = str2double(parameter{4});
mutate_prob          = str2double(parameter{5}); 
elitism              = str2double(parameter{6}); 

par = Init(pop_size,map);
Terminal = 0;
generation = 0;
stall_generation=0;
 
for pop_index=1:pop_size, %vong lap danh gia do thich nghi
      fitness(pop_index) = 10*check_node(par(pop_index,:))+Calc_Distance(par(pop_index,:),map); %cong thuc do thich nghi la fitness = tong quang duong
end;
[bestfit0,bestchrom]=min(fitness);
[n0 path0] = check_node(par(bestchrom,:))

s = null(1,2);
for i=1:size(par(bestchrom,:),2)
    [x0, y0] = ConvertToXY(par(bestchrom,i),map);
    s = [s;x0 y0];
end
plot(s(:,1),s(:,2),'b--','lineWidth',1);
 
while ~Terminal,
    generation = generation+1;
    disp(['generation #' num2str(generation) ' of maximum ' num2str(max_generation)]);
    parent = Select_Linear_Ranking(par,fitness,0.5,elitism,bestchrom); %elitism: co tot nhat. De giu ca the tot nhat lai. bestchrom: luu giu ca the tot nhat
   	child = Cross_Twopoint(parent,cross_prob,elitism,bestchrom,map);
    par = Mutate_Uniform(child,mutate_prob,elitism,bestchrom,map);

    for pop_index=1:pop_size, %vong lap danh gia do thich nghi
     fitness(pop_index) =10*check_node(par(pop_index,:))+Calc_Distance(par(pop_index,:),map);
    end;
    [bestfit(generation),bestchrom]=min(fitness);
    bestfit(generation)
    
    if generation == max_generation
        Terminal = 1;
    elseif generation>1,
        if abs(bestfit(generation)-bestfit(generation-1)) < 0.01,
            stall_generation=stall_generation+1;
            if stall_generation == max_stall_generation, Terminal = 1;end
        else
            stall_generation=0;
        end;
    end;
end; %While
 
par(bestchrom,:);    %ket qua quy hoach cuoi cung

s = null(1,2);
for i=1:size(par(bestchrom,:),2)
    [x0, y0] = ConvertToXY(par(bestchrom,i),map);
    s = [s;x0 y0];
end
plot(s(:,1),s(:,2),'-r*','lineWidth',2);
figure(2)
hold on
plot(bestfit,'b','lineWidth',2);
xlabel('Generation');
ylabel('Fitness');
[n path]= check_node(par(bestchrom,:))
plotResult

time = toc