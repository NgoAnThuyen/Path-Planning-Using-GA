function rect(x,y,type)
    if strcmp(type,'env')
        fill([x-0.5 x+0.5 x+0.5 x-0.5],[y+0.5 y+0.5 y-0.5 y-0.5],[0.8627 0.8627 0.8627])
    end
    
    if strcmp(type,'start')
        fill([x-0.5 x+0.5 x+0.5 x-0.5],[y+0.5 y+0.5 y-0.5 y-0.5],'g')
    end
    
    if strcmp(type,'target')
        fill([x-0.5 x+0.5 x+0.5 x-0.5],[y+0.5 y+0.5 y-0.5 y-0.5],[142	30	32]/255	)
     end
    
     if strcmp(type,'obs')
     fill([x-0.5 x+0.5 x+0.5 x-0.5],[y+0.5 y+0.5 y-0.5 y-0.5], [47,79,79]/255)
     end
     
     if strcmp(type,'path')
     fill([x-0.5 x+0.5 x+0.5 x-0.5],[y+0.5 y+0.5 y-0.5 y-0.5],'')
     end
     
    end