function [child] = crossover(t1_parent, t2_parent)
    if t1_parent{3}.fitness < t2_parent{3}.fitness
        child = t1_parent;
    else
        child = t2_parent;
    end
end

