function x = least_square_solution(A, w)
% Find the least square solution of w onto A
% using the normal equations: A'*A x = A'*w.
%
% Inputs:
%   A - m×n matrix
%   w - m×1 vector
%
% Output:
%   x - Least squares solution (or general solution if non-unique)
%
% Example:
%   A = [1 1; 1 -1; 1 2];
%   w = [2; 0; 3];
%   x = least_square_solution(A, w);

    A = sym(A);
    w = sym(w);

    B = A'*A;
    result = A' * w;
    C = rref([B result]);
    disp("RREF of [A'*A | A'*w]")
    disp(C);

    n = size(C,2);
    vec = C(:,n);
    
    syms s;
    N = null(B);
    if isempty(N)
        x = vec;
    else
        x = vec + s * N;
    end
    disp("Final equation")
    disp(x);
end