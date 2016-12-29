function [] = plot_elite(elite)
    num_nodes = elite{3}.num_next-1;
    A = zeros(num_nodes, num_nodes);
    
    for i=1:size(elite{2},2)
        A(elite{2}(i).in, elite{2}(i).out) = elite{2}(i).weight;
    end
    G = digraph(A);
    figure(2);
    plot(G)
    hold off;
    drawnow
end

