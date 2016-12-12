function [error, act] = network_run(network, act, input, target)
    W = network_to_mat(network);
    
    act = tanh([input 1 act] * W);
    out = act(end);

    error = (target - out)*(target-out);
end

