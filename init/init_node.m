function [node] = init_node(number, type)
    %   TYPES
    %   1 = input
    %   2 = bias
    %   3 = hidden
    %   4 = output
    %

    node = struct('num', number, 'type', type);
end

