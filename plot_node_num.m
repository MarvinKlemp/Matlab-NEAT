function [gen_min, gen_avg, gen_max] = plot_node_num(gen_min, gen_avg, gen_max, networks)
    max = 0;
    min = 9999;
    avg = 0;
    
    for i=1:size(networks,2)
        num_nodes = networks{3, i}.num_next-1;
        
        if max < num_nodes
            max = num_nodes;
        end
        
        if min > num_nodes
            min = num_nodes;
        end
        
        avg = avg + num_nodes;
    end
    
    gen_min = [gen_min min];
    gen_avg = [gen_avg avg/size(networks,2)];
    gen_max = [gen_max max];
    
    figure(3)
    plot(gen_min);
    hold on;
    plot(gen_avg);
    hold on;
    plot(gen_max);
    hold off;
    legend('Min. Num. Nodes', 'Avg. Num. Nodes', 'Max. Num. Nodes'),
    xlabel('Generation');
    ylabel('Nodeanzahl');
    ylim([1 inf])
    drawnow
end

