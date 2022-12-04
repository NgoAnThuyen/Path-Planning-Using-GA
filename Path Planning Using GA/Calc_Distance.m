function distance = Calc_Distance(point,map)

for i=1:size(point,2)
    [x(i),y(i)] = ConvertToXY(point(i),map);
end

for i=1:size(point,2)-1,
     d(i) = sqrt((x(i+1)-x(i))^2+(y(i+1)-y(i))^2);
end

distance = sum(d);
    