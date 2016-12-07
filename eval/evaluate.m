function [fitness, err] = evaluate(network, data)
    [num_input, num_hidden, num_out] = network_get_stats(network); 
    act = zeros(1, num_hidden+num_out);
    
    % calculate fitness
    err = [];
    for i=1:size(data,2)
        for j=1:size(data{i}, 1)
            in = data{i}(j, 3);
            target = data{i}(j, 2);
            
            [error, act] = network_run(network, act, in, target);
            err = [err error];
        end
    end
    
    fitness = sum(err) / size(err,2);
    err = fitness;
end

