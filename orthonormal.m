function V = orthonormal(U)
% orthogonalize - Applies the Gram-Schmidt process to produce an orthonormal 
% set of vectors.
%
% Inputs:
%   U - matrix where each column is an input vector
%
% Outputs:
%   V - matrix where each column is an orthonormal vector
%
% Example:
%   U = [1 1; 1 -1; 1 1];
%   V = orthonormal(U);


    U = sym(U);
    
    
    [row, column] = size(U);
    V = sym(zeros(row,column));
    V(:,1) = U(:,1) / norm(U(:,1));

    for i = 2:column
        ui = U(:,i);
        vi = U(:,i);
        for j = 1:i-1
            vj = V(:,j);
            vi = vi - (dot(vj,ui)/ dot(vj,vj) * vj);
        end
        vi = vi / norm(vi);
        V(:,i) = simplify(vi);
    end

end