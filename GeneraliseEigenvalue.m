function GeneraliseEigenvalue(A)
    % Eigenvalue - Display the steps to get Eigenvalue and Generalised Eigen value
    % Use this function for matrices that are not diagonalizable.
    
    % Check if square maxtrix
    A = sym(A);
    [row, col] = size(A);
    if(row ~= col)
        disp("Maxtrix need to be square")
        return;
    end
    
    syms x;
    polynomial = (det(x*eye(row) - A));
    disp('Characteristic polynomial: ')
    disp(polynomial)
    
    simplifiedPoly = simplify(polynomial);
    if polynomial ~= simplifiedPoly
        disp('Simplified polynomial: ')
        disp(simplifiedPoly)
    end
    
    % Solve the characteristic polynomial
    eigenvalues = solve(polynomial == 0, x);
    disp('Eigenvalues:')
    disp(eigenvalues')
    
    
    % Remove duplicates
    uniqueEigenvalues = unique(eigenvalues');
    
    % Check for alebraic multiplicities
    algebraicMultiplicities = arrayfun(@(v) sum(double(eigenvalues) == double(v)), uniqueEigenvalues);

    
    for i = 1:length(uniqueEigenvalues)
        value = uniqueEigenvalues(i);
        alegraic = (algebraicMultiplicities(i));
        
        disp(['Eigenvalue: ', char(value)])
        disp(['(',char(value) ,')I - A: '])
        disp((value)*eye(row) - A)
        disp('RREF: ')
        disp(rref((value)*eye(row) - A))
        eigVector = null((value)*eye(row) - A);
        geometric = size(eigVector, 2);
        disp('Eigenvectors:')
        disp(eigVector)
    
        if geometric < double(alegraic)
            disp([char(value), ' is a repeated eigenvalue. Finding generalized eigenvector'])
            B = A - value*eye(row);
            disp (['A-',char(value),'I matrix'])
            disp(B)
            vec = [B eigVector(:,1)];
            disp (['[A-',char(value),'I Eigenvector]' ])
            disp(vec);
            disp('RREF');
            disp(rref(vec))
            nullSpace = null(B);
            % Solve (A - λI) * x = v1 symbolically
            X = sym('x', [row, 1]);
            eqns = B * X == eigVector(:,1);
            sol = solve(eqns,X);
            genVec = zeros(row, 1);
            for k = 1:row
                genVec(k) = sol.(sprintf('x%d', k));
            end
            genVec = sym(genVec);
            % Display result
            syms s;
            disp('Generalized eigenvector solution:')
            x = genVec + s * nullSpace;
            disp(['x = ', char(genVec),'+ s * ', char(nullSpace), ', s ∈ ℝ'])
            disp(' ')
            disp('Symbolic display')
            disp(x)

        end    
    end
end