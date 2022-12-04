function newpop=Mutate_Uniform(pop,mutate_prob,elitism,bestchrom,map)
if (nargin < 4),
   error(['Too few input arguments.']);
end;
cnt =0;
[pop_size,chrom_len]=size(pop);
newpop=pop;
for pop_index= 1:pop_size,
   if (elitism==0) || (elitism==1 && pop_index~=bestchrom),
     
         if mutate_prob > rand				% If true then mutate  
              k1 = randi([2 chrom_len-1]) ;
              cond = 0; 
              temp =newpop(pop_index,k1);
              while cond==0,
                newpop(pop_index,k1)= Find_next_point(newpop(pop_index,k1-1),map,[]);
                cond = (check_path(newpop(pop_index,:),map))&&(any(map.obs(:)==newpop(pop_index,k1))==0);
                cnt = cnt +1;
                if cnt == 100,
                    cnt =0;
                     newpop(pop_index,k1)=temp ;
                    break;
                end
              end
         end  
    
   end
end


end