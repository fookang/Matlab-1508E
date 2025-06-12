function V = orthogonalize(U)
% orthogonalize - Applies the Gram-Schmidt process to produce an orthogonal 
% set of vectors.
%
% Inputs:
%   U - matrix where each column is an input vector
%
% Outputs:
%   V - matrix where each column is an orthogonalized vector
%
% Example:
%   U = [1 1; 1 -1; 1 1];
%   V = orthogonalize(U);


    U = sym(U);
    
    
    [row, column] = size(U);
    V = sym(zeros(row,column));
    V(:,1) = U(:,1);

    for i = 2:column
        ui = U(:,i);
        vi = U(:,i);
        for j = 1:i-1
            vj = V(:,j);
            vi = vi - (dot(vj,ui)/ dot(vj,vj) * vj);
        end
        V(:,i) = simplify(vi);
    end

end