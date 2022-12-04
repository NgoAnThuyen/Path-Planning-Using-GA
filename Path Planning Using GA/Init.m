function par = Init(pop_size,map)
disp('Initializing population...')
Zero_pool = [];
global break_state;
par =map.start*ones(pop_size,1);
for pop_index = 1:pop_size
    disp(['Searching the pop#',num2str(pop_index),'...'])
    par(:,1)=map.start*ones(pop_size,1);
     cond =1;
    while cond,
        par_index = 1;
    while( par(pop_index,par_index)~=map.target ),
         par_index=par_index+1;
        par(pop_index,par_index) = Find_next_point(par(pop_index,par_index-1),map,Zero_pool);
        Zero_pool = [Zero_pool, par(pop_index,par_index)]; 
        if (break_state)
            break_state = 0;
            break;
        end
    end
    Zero_pool = [];

    cond = any(par(pop_index,:) == 1000);
    if cond
        for u = 1: find( par(pop_index,:)==1000)
        par(pop_index,u) = map.start;
        end
    end
     end
end
par_size=size(par,2);
for pop_index = 1:pop_size,
    k=find( par(pop_index,:) == map.target);
    for par_index=k:par_size,
        par(pop_index,par_index) = map.target;
    end
end
end