function [elite] = find_elite(networks)
    elite = networks(:,1);
    for i=1:size(networks, 2)
        if networks{3, i}.fitness < elite{3}.fitness
            elite = networks(:, i);
        end
    end
end

