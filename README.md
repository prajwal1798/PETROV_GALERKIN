# PETROV_GALERKIN
 Petrov-Galerkin Stability analysis for Higher Peclet Numbers

## **Overview**
This MATLAB program provides solutions to the steady-state convection-diffusion equation using the finite element method (FEM) with various approaches:

1. **Standard Galerkin (SG) Method**: Classical FEM formulation that suffers from instability in advection-dominated scenarios.
2. **Petrov-Galerkin (PG) Method with Optimal α**: A stabilized approach that adds artificial diffusion for stability.
3. **Petrov-Galerkin with α = 1**: A fully upwind scheme with significant stabilization.
4. **Comparison Against Analytical Solution**: Evaluates the performance of numerical methods against the exact analytical solution.

## **Governing Equation**
The general form of the 1D convection-diffusion equation:
\[
u \frac{d\phi}{dx} - k \frac{d^2\phi}{dx^2} = 0
\]
where:
- \(u\): Constant convection velocity
- \(k\): Diffusion coefficient
- \(\phi\): Scalar quantity being transported

Boundary conditions:
- \(\phi(0) = 1\) (inlet)
- \(\phi(L) = 0\) (outlet)

The analytical solution for this problem:
\[
\phi(x) = \frac{e^{\frac{u x}{k}} - e^{\frac{u L}{k}}}{1 - e^{\frac{u L}{k}}}
\]

## **Finite Element Discretization**

### **Shape Functions**
For 1D linear elements:
\[
N_1 = 1 - \frac{x}{l}, \quad N_2 = \frac{x}{l}
\]
where \(l\) is the length of each element.

### **Standard Galerkin Formulation**
The FEM formulation for the convection term:
\[
\int_{\Omega_e} \mathbf{N}^T u \frac{d\phi}{dx} d\Omega = \frac{u}{2}
\begin{bmatrix}
-1 & 1 \\
-1 & 1
\end{bmatrix}
\begin{bmatrix}
\phi_1 \\
\phi_2
\end{bmatrix}
\]

The FEM formulation for the diffusion term:
\[
k \int_{\Omega_e} \frac{d\mathbf{N}^T}{dx} \frac{d\phi}{dx} d\Omega = -\frac{k}{l^2}
\begin{bmatrix}
1 & -1 \\
-1 & 1
\end{bmatrix}
\begin{bmatrix}
\phi_1 \\
\phi_2
\end{bmatrix}
\]

### **Petrov-Galerkin Stabilization**
In the Petrov-Galerkin method, an artificial diffusion term is introduced:
\[
k_b = \frac{\alpha u h}{2}
\]
where \(h\) is the element length, and \(\alpha\) is a stabilization parameter. The modified equation becomes:
\[
U \frac{d\phi}{dx} - \frac{d}{dx} \left[(k + k_b) \frac{d\phi}{dx} \right] = 0
\]

The optimal value of \(\alpha\) is:
\[
\alpha_{opt} = \text{coth}(|Pe|) - \frac{1}{|Pe|}
\]
where \(Pe = \frac{u l}{2k}\) is the Peclet number.

## **MATLAB Code Structure**

### **Files and Functions**
- `convection_diffusion_solver.m`: Main script for selecting the solution method.
- `petrov_galerkin.m`: Implements the Petrov-Galerkin method with optimal \(\alpha\).
- `petrov_galerkin_alpha1.m`: Implements the Petrov-Galerkin method with \(\alpha = 1\).
- `standard_galerkin.m`: Implements the Standard Galerkin method.
- `analytical_solution.m`: Provides the analytical solution.

### **How to Run the Program**
1. Open MATLAB and navigate to the folder containing the script.
2. Run the script by typing:
   ```matlab
   convection_diffusion_solver
