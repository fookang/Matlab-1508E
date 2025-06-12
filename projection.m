function [wp] = projection(A, w)
% Projection of vector w onto the column space of A

    if rank(A) < size(A,2)
        error('Matrix does not have linearly independent columns.');
    end

    A = sym(A);
    wp = A * inv(A' * A) * A' * w;
end