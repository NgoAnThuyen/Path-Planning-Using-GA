function parent=Select_Linear_Ranking(par,fitness,eta,elitism,bestchrom)

if (nargin < 5),
   error(['Too few input arguments.']);
end;

N=length(fitness);
[fitness,order] = sort(fitness,'descend'); %sap xep NST theo thu tu giam dan fitness
%order ghi nhan vi tri cua phan tu do truoc khi sap xep.

for k=1:N,
    p(k)=(eta+(2-eta)*(k-1)/(N-1))/N;   %cong thuc SGK
end

s=zeros(1,N+1);

for k=1:N, 
    s(k+1)=s(k)+p(k); 
end;

for k = 1:N,
    if elitism==1 & order(k)== bestchrom	% mode bao ton ca the tot nhat
     	parent(order(k),:)=par(order(k),:);       % giu ca the tot nhat ay khong bi mat di
        												
    else
        r=rand*s(N+1);                    % This makes the pointer for the roulette wheel.  
        index=find(s<r); j=index(end);    %j=find(s<r,1,'last');
  		parent(order(k),:)=par(order(j),:);
    end
end   
