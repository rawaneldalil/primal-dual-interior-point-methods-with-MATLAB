function f_reduced = get_f_reduced(c, x_points)
    f_reduced = [];

    for i = 1: length(x_points)
        f_reduced(i) = c'*x_points{i};
    end

end

