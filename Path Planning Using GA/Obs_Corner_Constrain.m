function val = Obs_Corner_Constrain(x1,y1,x2,y2,map)
a =(y1-y2)/(x1-x2);
b= y2 - x2*a;
% y = ax + b
val = 1;
[xobs, yobs] = ConvertToXY(map.obs,map) ;
x =[xobs + 0.5;xobs + 0.5;xobs - 0.5;xobs - 0.5];
y =[yobs + 0.5;yobs - 0.5;yobs + 0.5;yobs - 0.5];
f= y -a*x -b;
if any(f(:)==0),
    val =0;
end
    
end