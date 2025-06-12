function [Sy] = solve_linear_system(A, y0)
    % solve the system dy/dt = A*y symbolically
    %   A: coefficient matrix
    %   y0: initial conditions
    
    n = length(y0);
    if size(A,1) ~= n || size(A,2) ~= n
        error('Matrix must be square and match the initial condition');
    end

    syms t;
    y = sym('y', [n 1]);

    % Create symbolic function expressions y1(t), y2(t)...
    for i = 1:n
        y(i) = str2sym("y" + i + "(t)");
    end

    
    Dy = diff(y,t) == A*y;
    
    disp("General Solution");
    generalSol = dsolve(diff(y,t) == A * y);
    for i = 1:n
        fieldName = "y" + i;
        disp(fieldName + "(t) =")
        disp(generalSol.(fieldName))
        fprintf("\n")
    end
    
    % Define initial equation
    conds = cell(n,1);
    for i = 1:n
        conds{i} = subs(y(i),t,0) == y0(i);
    end

    Sy = dsolve(Dy, conds{:});
    disp("Solution with initial condition")
    for i = 1:n
        fieldName = "y" + i;
        disp(fieldName + "(t) =")
        disp(Sy.(fieldName))
        fprintf("\n")
    end

end