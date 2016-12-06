function [gene] = init_connection(in, out)
%{
In 1
Out 4
Weight 0.7
Enabled
Innov 1
%}
    enabled = 1;
    weight = randn();
    innovation = 1;
    
    gene = struct('in', in, 'out', out, 'weight', weight,'enabled', enabled, 'innovation', innovation);
end

