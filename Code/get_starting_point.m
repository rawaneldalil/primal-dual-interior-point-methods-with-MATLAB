function st_point = get_starting_point(A, b, c, Equal)
    [A, c] = equality_check(A, c, Equal);
    
    x_dash = A'*inv(A*A')*b;
    lambda_dash = inv(A*A')*A*c;
    s_dash = c - A'*lambda_dash;
    
    del_x = max(-1.5*min(x_dash), 0);
    del_s = max(-1.5*min(s_dash), 0);
    
    e_x = ones(size(x_dash));
    e_s = ones(size(s_dash));
    
    x_err = x_dash + del_x*e_x;
    s_err = s_dash + del_s*e_s;
    
    del_x_dash = del_x + 0.5*(x_err' * s_err)/ sum(e_s'*s_err);
    del_s_dash = del_s + 0.5*(x_err' * s_err)/ sum(e_x'*x_err);
    
    x = x_dash + del_x_dash*e_x;
    s = s_dash + del_s_dash*e_s;
    lambda = lambda_dash;
    
    st_point = {x, s, lambda};
    
end

