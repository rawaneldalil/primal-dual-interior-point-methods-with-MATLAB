function [A, c] = equality_check(A, c, Equal)
    [m, n] = size(A);
    [mc, nc] = size(c);
    check_equ = ~isequal(Equal, zeros(size(Equal)));
    if check_equ
        non_zero_elem = nnz(Equal);
        c(mc+1:mc+non_zero_elem,:) = 0;
        A(:, n+1:n+non_zero_elem) = zeros(m, non_zero_elem);
        var = 1;
        for i = 1:mc
            disp(i)
            if Equal(i, 1) == -1
                A(i, n + var) = 1;
                var = var + 1;
            elseif Equal(i, 1) == 1
                A(i, n + var) = -1;
                var = var + 1;
            end
        end
    end
end

