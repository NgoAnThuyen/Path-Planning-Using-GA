function [val pool_out]= check_node(input)
    N = length(input);
    val = 0;
    pool = [];
    for i = 1 : N,
        if any(pool(:)==input(i))==0
             pool = [ pool , input(i)];
        end
    end
    val = length(pool);
    pool_out = pool;
end