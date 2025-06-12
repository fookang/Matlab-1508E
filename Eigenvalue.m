function [allEigVect, diagonal] = Eigenvalue(A)
% Eigenvalue - Display all the steps required to calculate the Eigenvalue
% Returns:
%   allEigVect - matrix whose columns are the eigenvectors of A
%   D          - diagonal matrix of eigenvalues (or empty if not diagonalizable)
%
% Example usage 1 (if returned value is required):
%   [P, D] = Eigenvalue([2 1; 1 2]);
%
% Example usage 2 (if only steps are required -- run in live script)
%   Eigenvalue([2 1; 1 2])


% Ensure symbolic for exact computation
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
allEigVect = [];

for i = 1:length(uniqueEigenvalues)
    value = uniqueEigenvalues(i);
    algebraic = (algebraicMultiplicities(i));
    
    disp(['Eigenvalue: ', char(value)])
    disp(['(',char(value) ,')I - A: '])
    disp((value)*eye(row) - A)
    disp('RREF: ')
    disp(rref((value)*eye(row) - A))
    eigVector = null((value)*eye(row) - A);
    geometric = size(eigVector, 2);
    disp('Eigenvectors:')
    disp(eigVector)

    if geometric < double(algebraic)
        disp(['Matrix is NOT diagonalizable: eigenvalue ', char(value), ...
              ' has geometric multiplicity ', num2str(geometric), ...
              ' < algebraic multiplicity ', num2str(algebraic)]);
        disp('Please use GeneraliseEigenvalue function')
        return;
    end

    allEigVect = [allEigVect eigVector];

end

disp('All eigenvectors (columns):')
disp(allEigVect)

diagonal = diag(eigenvalues);
disp('Diagonal matrix of eigenvalues:');
disp(diagonal)

end