function val  = map_constrain(x,y,map, Zero_pool)
if ((x >=0 )&&(x <map.column)&&(y >=0 )&&(y <map.row)&&...
        ((any(map.obs(:) == x + map.column*y) == 0))&&...
        ((any(Zero_pool(:) == x + map.column*y) == 0))),
    val = 1;
else
    val = 0;
end
end
    