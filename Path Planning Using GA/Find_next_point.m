function next_point = Find_next_point(current_point,map,Zero_pool)
    [x_current, y_current] = ConvertToXY(current_point,map);
    next = [];
    global break_state;

    %%
    if map.corner_constrain,
    if(map_constrain((x_current-1),(y_current+1),map,Zero_pool))&&...
        (Obs_Corner_Constrain(x_current,y_current,x_current-1,y_current+1,map))%1
        next=[next,(x_current-1)+map.column*(y_current+1) ];
    end
    
    if(map_constrain( (x_current+0),(y_current+1),map,Zero_pool))&&...
            (Obs_Corner_Constrain(x_current,y_current,x_current+0,y_current+1,map))%2
        next=[next,(x_current+0)+map.column*(y_current+1) ];
    end
    
    if(map_constrain( (x_current+1),(y_current+1),map,Zero_pool))&&...
            (Obs_Corner_Constrain(x_current,y_current,x_current+1,y_current+1,map))%3
        next=[next,(x_current+1)+map.column*(y_current+1) ];
    end
   
    if(map_constrain((x_current+1),(y_current+0),map,Zero_pool))&&...
            (Obs_Corner_Constrain(x_current,y_current,x_current+1,y_current+0,map))%4
        next=[next,(x_current+1)+map.column*(y_current+0) ];
    end
    
    if(map_constrain((x_current+1),(y_current-1),map,Zero_pool))&&...
            (Obs_Corner_Constrain(x_current,y_current,x_current-1,y_current+1,map))%5
        next=[next,(x_current+1)+map.column*(y_current-1) ];
    end
    
    if(map_constrain((x_current+0),(y_current-1),map,Zero_pool))&&...
            (Obs_Corner_Constrain(x_current,y_current,x_current+0,y_current-1,map))%6
        next=[next,(x_current+0)+map.column*(y_current-1) ];
    end
    
    if(map_constrain((x_current-1),(y_current-1),map,Zero_pool))&&...
          (  Obs_Corner_Constrain(x_current,y_current,x_current-1,y_current-1,map))%7
        next=[next,(x_current-1)+map.column*(y_current-1) ];
    end
    
    if(map_constrain((x_current-1),(y_current+0),map,Zero_pool))&&...
            (Obs_Corner_Constrain(x_current,y_current,x_current-1,y_current+0,map))%8
        next=[next,(x_current-1)+map.column*(y_current+0) ];
    end
   else
        %%
        if(map_constrain((x_current-1),(y_current+1),map,Zero_pool))%1
        next=[next,(x_current-1)+map.column*(y_current+1) ];
        end
    
    if(map_constrain( (x_current+0),(y_current+1),map,Zero_pool))%2
        next=[next,(x_current+0)+map.column*(y_current+1) ];
    end
    
    if(map_constrain( (x_current+1),(y_current+1),map,Zero_pool))%3
        next=[next,(x_current+1)+map.column*(y_current+1) ];
    end
   
    if(map_constrain((x_current+1),(y_current+0),map,Zero_pool))%4
        next=[next,(x_current+1)+map.column*(y_current+0) ];
    end
    
    if(map_constrain((x_current+1),(y_current-1),map,Zero_pool))%5
        next=[next,(x_current+1)+map.column*(y_current-1) ];
    end
    
    if(map_constrain((x_current+0),(y_current-1),map,Zero_pool))%6
         next=[next,(x_current+0)+map.column*(y_current-1) ];
    end
    
    if(map_constrain((x_current-1),(y_current-1),map,Zero_pool))%7
        next=[next,(x_current-1)+map.column*(y_current-1) ];
    end
    
    if(map_constrain((x_current-1),(y_current+0),map,Zero_pool))%8
        next=[next,(x_current-1)+map.column*(y_current+0) ];
    end
    end

if(length(next) == 0)
    next_point = 1000 ;
    break_state = 1;
else
    next_point= next(randi([1 length(next)]));
end
end