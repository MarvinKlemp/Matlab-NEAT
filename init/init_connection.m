function [gene] = init_connection(in, out, bias)
%{
In 1
Out 4
Weight 0.7
Enabled
Innov 1
%}
    enabled = 1;
    
    if bias == 0
        weight = randn();
    else 
        weight = 1;
    end
    
    innovation = 1;
    
    gene = struct('in', in, 'out', out, 'weight', weight,'enabled', enabled, 'innovation', innovation);
end

