function ExtractPool(parent,map,Pool)
n = length(parent);
for t1= n-1:-1:1, % inverse loop 
    temp_path = parent(t1);
    temp_d    = 0;
    for t2 = t1+1: n-1,
        [xt1_1,yt1_1 ] =ConvertToXY(parent(t1-1),map)
        [xt1,yt1 ] =ConvertToXY(parent(t1),map)
        [xt2,yt2 ] =ConvertToXY(parent(t2),map)
        temp_path = [temp_path parent(t2)];
        temp_d    = sqrt((xt2-xt1_1)^2 +(yt2 -yt1_1)^2) + temp_d;
        if(any(Pool.dis(:)==sqrt((xt2-xt1)^2 +(yt2 -yt1)^2)  ) == 1)&&(sqrt((xt2-xt1)^2 +(yt2 -yt1)^2) > temp_d),
            Pool.dis  = [Pool.dis  ; temp_d];
            Pool.path = [Pool.path ; temp_path];
        end
    end

end
end