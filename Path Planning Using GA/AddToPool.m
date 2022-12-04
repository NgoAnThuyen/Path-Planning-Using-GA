function Pool_out= AddToPool(input,map,Pool);
n = length(input);
dis=zeros(n,1) ;
path = [];
for t = 1:n-1,
    [x ,y]  = ConvertToXY(input,map);
    dis(t)  = sqrt((x(t+1)-x(t))^2+(y(t+1)-y(t))^2);
    path(t,:) = [input(t), input(t+1)];
end
Pool_out.path  = path;
Pool_out.dis   = dis; 
end