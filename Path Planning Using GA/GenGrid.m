%% tao moi truong
prompt = {'Number of row:', 'Number of column:' ,'Enter 1 to add obstacle corner constrain'};
dlgtitle = 'Input map size';
dims = [1 35];
definput = {'10','10','0'};
parameter        = inputdlg(prompt,dlgtitle,dims,definput);
row              = str2double(parameter{1});
column           = str2double(parameter{2});
corner_constrain = str2double(parameter{3});

set(gca,'xticklabel',{[]})
set(gca,'yticklabel',{[]})
set(gca,'XColor', 'none','YColor','none')
xlim([-0.5 column - 0.5])
ylim([-0.5 row    - 0.5])
hold on;
for x=0:column-1
    for y=0:row-1
        rect(x,y,'env');     
    end
end
%% Khoi tao vat can
answ = inputdlg({'Number of obstacle, input -1 to load Obs: '},'Input the Obstacle',[1 35],{'5'});
n=str2double(answ(1));
if (n >=0)
Obs=null(1,2);
for i = 1:n	 % So vong lap tuong duong voi so vat can
%         axis equal
        title(['Choose the obstacle  number ', num2str(i)]);
        hold on; box on;
        p(i,:) = ginput(1); %Tao ma tran chua vi tri cua vat can
        [xb, yb]= ReturnXY(p(i,:)); % return array obs
        rect(xb,yb,'obs');
        Obs=[Obs;column*yb+xb];
end
else
load('data_obs.mat');
end


%% Khoi tao diem bat dau
 title(['Choose the start point ']);
 hold on; box on;
 p_start = ginput(1); %Tao ma tran chua vi tri cua vat can
 [x_start, y_start]= ReturnXY(p_start); % return array obs
 rect(x_start,y_start,'start');
 start = column*y_start+x_start;
 %% Khoi tao diem ket thuc
 title(['Choose the target point ']);
 hold on; box on;
 p_target = ginput(1); %Tao ma tran chua vi tri cua vat can
 [x_target, y_target]= ReturnXY(p_target); % return array obs
rect(x_target,y_target,'target');
target = column*y_target+x_target;
%%
xlim([-0.5 column - 0.5])
ylim([-0.5 row    - 0.5])
for x=0:column-1
    for y=0:row-1
         num=column*y+x;
        text(x-0.2,y,num2str(num));
    end
end
title('Map with Obstacles');
set(gca,'xticklabel',{[]})
set(gca,'yticklabel',{[]})

%% Sau khi tao ban do xong thi Ban do gom:
map.start            = start;
map.target           = target;
map.obs              = Obs;
map.row              = row;
map.column           = column;
map.corner_constrain = corner_constrain;