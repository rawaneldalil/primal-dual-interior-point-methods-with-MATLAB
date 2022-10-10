function optimal_sol = Mehrotra_IPM(A, b, c, Equal)
    x_points = {};
    initial_point = get_starting_point(A, b, c, Equal);
    
    x = initial_point{1};
    s = initial_point{2};
    lambda = initial_point{3};
    
    x_points{1} = x;
    s_points{1} = s;
    
    %Checking if the constraints are equality constraints or inequality
    %ones.
    [A, c] = equality_check(A, c, Equal);

    r_d = A'*lambda + s - c;
    r_p = A*x - b;
    r_c = diag(x)*s;
    
    mu = x'*s/length(x);
    X = diag(x);
    S = diag(s);
    epsilon = 1e-8;
    
    optimality_check = max([mu, norm(r_p), norm(r_d)]) > epsilon;
    j = 2;
    while optimality_check 
        
        M = A*X*inv(S)*A';
        M_rhs = r_p + A*inv(S)*(-r_c + X*r_d);
        
        %predictor steps
        del_lambda_p = inv(M)*M_rhs;
        del_s_p = r_d - A'*del_lambda_p;
        del_x_p = inv(S)*(r_c - X*del_s_p);
        
        %largest possible steps.
        s_alpha = s(find(del_s_p > 0));
        del_s_alpha = del_s_p(find(del_s_p > 0));
        
        x_alpha = x(find(del_x_p > 0));
        del_x_alpha = del_x_p(find(del_x_p > 0));
        
        alpha_p_d = min(1, min(s_alpha./del_s_alpha));
        alpha_p_p = min(1, min(x_alpha./del_x_alpha));
        
        sigma = (((x - alpha_p_p*del_x_p)'*(s - alpha_p_d*del_s_p))/(length(x)*mu))^3;
  
       %Corrector steps
       r_c = r_c - sigma*mu + del_x_p.*del_s_p;
       
       M_rhs = r_p + A*inv(S)*(-r_c + X*r_d);
       del_lambda = inv(M)*M_rhs;
       del_s = r_d - A'*del_lambda;
       del_x = inv(S)*(r_c - X*del_s);
       
       eta = max(0.995, 1 - mu);
       alpha_p = min(1, eta*min(x_alpha./del_x_alpha));
       alpha_d = min(1, eta*min(s_alpha./del_s_alpha));
       
       x = x - alpha_p*del_x; 
       lambda = lambda - alpha_d*del_lambda;
       s = s - alpha_d*del_s;
       
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
    optimal_sol = {x, s, lambda, x_points, c, s_points};
end

