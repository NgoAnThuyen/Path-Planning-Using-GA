function val = check_path(point,map)
for i=1:size(point,2)
    [x(i),y(i)] = ConvertToXY(point(i),map);
end
val = 1;
for i=1:size(point,2)-1,
     d(i) = sqrt((x(i+1)-x(i))^2+(y(i+1)-y(i))^2);
     if ~((d(i) == 1) || (d(i)==sqrt(2))||(d(i) == 0))&&((point(1)==map.start)&&(point(end))==map.target)
         val = 0;
         break;
     end
end

end