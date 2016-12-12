function [gene] = init_connection(in, out, bias)
    enabled = 1;
    
    if bias == 0
        weight = 0.1*randn();
    else 
        weight = 1;
    end
    
    innovation = 1;
    
    gene = struct('in', in, 'out', out, 'weight', weight,'enabled', enabled, 'innovation', innovation);
end

