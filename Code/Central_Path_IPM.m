function optimal_sol = Central_Path_IPM(A, b, c, Equal, choose_method, centrening_param, step_size)
    x_points = {};
    s_points = {};
    initial_point = get_starting_point(A, b, c, Equal);
    
    
    [A, c] = equality_check(A, c, Equal);
    
    x = initial_point{1};
    x_points{1}= x;
    s = initial_point{2};
    s_points{1}= s;
    lambda = initial_point{3};  
    mu = x'*s/length(x);
    
    e = ones(size(diag(x)*s));
    
    r_d = A'*lambda + s - c;
    r_p = A*x - b;
    r_c = diag(x)*s - centrening_param*mu*e;
    X = diag(x);
    S = diag(s);
    epsilon = 1e-12;
    
    optimality_check = max([mu, norm(r_p), norm(r_d)]) > epsilon;
    
    
    if choose_method == 'fixed'
        j = 2;
        while optimality_check
            M = A*X*inv(S)*A';
            M_rhs = r_p - A*inv(S)*(r_c - X*r_d);

            del_lambda = inv(M)*M_rhs;
            del_s = r_d - A'*del_lambda;
            del_x = inv(S)*(r_c - X*del_s);
            
            x = x - step_size*del_x;
            s = s - step_size*del_s;
            lambda = lambda - step_size*del_lambda;
            
            
            r_d = A'*lambda + s - c;
            r_p = A*x - b;
            r_c = diag(x)*s;
            
            mu = x'*s/length(x);
            
            X = diag(x);
            S = diag(s);
            optimality_check = max([mu, norm(r_p), norm(r_d)]) > epsilon;  
            x_points{j} = x;
            s_points{j} = s;
            j = j + 1;
        end 
        optimal_sol = {x, s, lambda, x_points, s_points};
    elseif choose_method == 'adapt'
        j = 2;
        while optimality_check
            M = A*X*inv(S)*A';
            M_rhs = r_p - A*inv(S)*(r_c - X*r_d);

            del_lambda = inv(M)*M_rhs;
            del_s = r_d - A'*del_lambda;
            del_x = inv(S)*(r_c - X*del_s);
            
            s_alpha = s(find(del_s > 0));
            del_s_alpha = del_s(find(del_s > 0));

            x_alpha = x(find(del_x > 0));
            del_x_alpha = del_x(find(del_x > 0));

            
            eta = max(0.995, 1 - mu);
            alpha_p = min(1, eta*min(x_alpha./del_x_alpha));
            alpha_d = min(1, eta*min(s_alpha./del_s_alpha));
            
            x = x - alpha_p*del_x;
            s = s - alpha_d*del_s;
            lambda = lambda - alpha_d*del_lambda;
            
            
            r_d = A'*lambda + s - c;
            r_p = A*x - b;
            r_c = diag(x)*s;
            
            mu = x'*s/length(x);
            
            X = diag(x);
            S = diag(s);
            optimality_check = max([mu, norm(r_p), norm(r_d)]) > epsilon;
            x_points{j} = x;
            s_points{j} = s;
            j = j + 1;
        end   
        
        optimal_sol = {x, s, lambda, x_points, s_points};
    end
    
end

