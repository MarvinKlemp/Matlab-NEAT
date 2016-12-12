function [res] = network_has_connection(network, in, out)
    res = false;

    for i=1:size(network{2},2)
        if network{2}(i).in == in && network{2}(i).out == out 
            res = true;
        end
    end
end

