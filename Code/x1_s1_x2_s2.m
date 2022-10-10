function output = x1_s1_x2_s2(x_points, s_points)
    output = {};
    x_1 = [];
    x_2 = [];
    s_1 = [];
    s_2 = [];
    
    for i = 1:length(x_points)
        x_1(i) = x_points{i}(1);
        x_2(i) = x_points{i}(2);
        
        s_1(i) = s_points{i}(1);
        s_2(i) = s_points{i}(2);
    end
    output = {x_1, s_1, x_2, s_2};
end

