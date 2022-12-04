function child=Cross_Twopoint(parent,cross_prob,elitism,bestchrom,map)
if (nargin < 5),
   error(['Too few input arguments.']);
end;

[pop_size,chrom_len]=size(parent);
for p1 = 1:pop_size,						% parent number 1 
	if (elitism==1) & (p1 == bestchrom)  	% giu lai ca the tot nhat
        child(p1,:)=parent(p1,:);
    else
         p2=p1;  							% Randomly chose the parent number 2
        while p2 == p1,   					% other than parent number 1
        	p2 = rand*pop_size; 											 								
        	p2 = p2 - rem(p2,1)+1;     
        end    
    	if cross_prob > rand           		% If true then crossover occur. cross_prob: xac suat lai ghep
 
            a = map.target;  % target point
            while a == map.target || a == map.start  %chon  gen ngau nhien cua p1
                k1 = rand*chrom_len;
                k1 = k1 - rem(k1,1) + 1;
                a = parent(p1,k1);
            end
%             [row0,col0] = find([parent(1:p1-1,:); zeros(1,chrom_len) ; parent(p1+1:pop_size,:)] == a);  %Tim trong cac ca the con lai 1 ca the co gen a
         [row0,col0] = find([parent(1:p1-1,:); map.start*ones(1,chrom_len); parent(p1+1:pop_size,:)] == a);  %Tim trong cac ca the con lai 1 ca the co gen a
            K = [row0,col0];
            if isempty(K) child(p1,:) = parent(p1,:);  %ko co thi thoi
            else
                    K = K(randi([1 size(K,1)]),1:2);
                    row = K(1);
                    col = K(2);
                  
                if col < k1 child(p1,1:col) = parent(row,1:col);
                    child(p1,k1:chrom_len) = parent(p1,k1:chrom_len);
                    child(p1,col:k1) = a;
                else
                    child(p1,1:k1) = parent(p1,1:k1);
                    child(p1,col:chrom_len) = parent(row,col:chrom_len);
                    child(p1,k1:col) = a;
                end
            end
     	else                           		% No crossover occurs
			child(p1,:)=parent(p1,:);
 		end
  	end  	% End the "if ELITISM..." statement
end  		% End "for p1=..." loop
