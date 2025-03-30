function V = orthonormal(U)
    % U: matrix of input column vectors (symbolic), each column is a vector
    % V: matrix of orthogonalized column vectors
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