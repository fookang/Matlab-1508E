# 📘 MATLAB Scripts for MA1508E

This repository contains a collection of MATLAB scripts developed for **MA1508E (Linear Algebra for Engineering)**.

> ⚠️ These scripts may not be entirely error-free. Use with caution.

---

## 📂 Files Included

| File                         | Description                                          |
|------------------------------|------------------------------------------------------|
| `Eigenvalue.m`               | Computes eigenvalues and display all necessary steps |
| `GeneraliseEigenvalue.m`     | Handles generalized eigenvectors and display all necessary steps |
| `orthogonalize.m`            | Applies Gram-Schmidt for orthogonal basis           |
| `orthonormal.m`              | 	Applies Gram-Schmidt and normalizes to an orthonormal basis |
| `least_square_solution.m`    | Solves least squares                                |
| `projection.m`               | Projects a vector onto a matrix's column space      |
| `solve_linear_system.m`      | Solves symbolic linear ODE systems                  |


## 🧪 Usage

These functions are best used inside **MATLAB Live Scripts** for step-by-step output.  

### ➕ Add the Folder to Your MATLAB Path

In the **Command Window**, run:

```matlab
% Add the folder containing the scripts to your MATLAB path:
addpath("path/to/your/folder");
```
```matlab
% (Optional) Save the path for future sessions:
savepath;
```

To use the function (input these commands in live scripts): 
⚠️ Step-by-step output only displays in Live Scripts (not in Command Window)

```matlab
% Compute eigenvalues and eigenvectors (with step-by-step display)
A = [2 1; 1 2];
[P, D] = Eigenvalue(A);
```
```matlab
% Find generalized eigenvectors for non-diagonalizable matrices
A = [4 1; 0 4];
GeneraliseEigenvalue(A);
```
```matlab
% Apply Gram-Schmidt for orthogonal basis
U = [1 1; 1 -1; 1 2];
V = orthogonalize(U);
```
```matlab
% Apply Gram-Schmidt and normalize to orthonormal basis
V = orthonormal(U);
```
```matlab
% Solve least squares problem A * x ≈ w
A = [1 1; 1 -1; 1 2];
w = [2; 0; 3];
x = least_square_solution(A, w);
```
```matlab
% Project vector w onto the column space of A
wp = projection(A, w);
```
```matlab
% Solve the system dy/dt = A*y with initial condition y(0) = y0
A = [0 1; -2 -3];
y0 = [1; 0];
solve_linear_system(A, y0);
```
