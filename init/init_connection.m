function [gene] = init_connection(in, out, bias)
    persistent connections;
    persistent num_innovation;
    
    if size(connections) == 0
        connections = zeros(100,100);
    end
    
    if size(num_innovation) == 0
        num_innovation = 1;
    end

    % Check if connection exists
    if connections(in, out) ~= 0
        innovation = connections(in, out);
    else
        innovation = num_innovation;
        connections(in, out) = innovation;
        num_innovation = num_innovation + 1;
    end
    
    enabled = 1;
    
    if bias == 0
        weight = 0.1*randn();
    else 
        weight = 1;
    end
    
    gene = struct('in', in, 'out', out, 'weight', weight,'enabled', enabled, 'innovation', innovation);
end

