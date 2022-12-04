function [x,y] = ConvertToXY(t,map)
x = rem(t,map.column);
y = (t-x)/map.column;
end