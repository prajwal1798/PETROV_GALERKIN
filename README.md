# PETROV_GALERKIN
 Petrov-Galerkin Stability analysis for Higher Peclet Numbers

# **1D Convection-Diffusion Solver**

## **Overview**
This MATLAB project solves the **1D steady-state convection-diffusion equation** using the finite element method (FEM) and compares different formulations:

1. **Standard Galerkin (SG)**: Classical FEM formulation.
2. **Petrov-Galerkin (PG) with optimal $\alpha$**: Adds artificial diffusion for stability.
3. **Petrov-Galerkin (PG) with $\alpha = 1$**: Fully upwind method.
4. **Analytical Solution**: Reference for comparison.

---

## **Problem Statement**
Solve the 1D convection-diffusion equation:
$$
u \frac{\partial \phi}{\partial x} - k \frac{\partial^2 \phi}{\partial x^2} = 0
$$
where:
- $u$ is the constant convection velocity.
- $k$ is the diffusion coefficient.
- $\phi$ is the scalar concentration variable.

### **Boundary Conditions**
- $\phi(0) = 1$ (inlet)
- $\phi(L) = 0$ (outlet)

---

## **Methods Implemented**
### 1. **Standard Galerkin Method (SG)**
- **Discretization:** Linear shape functions for both the trial and weighting functions.
- **Issue:** Unstable for advection-dominated flows ($Pe > 1$).

### 2. **Petrov-Galerkin Method with Optimal $\alpha$**
- Adds artificial diffusion:
  $$
  k_b = \frac{\alpha u h}{2}
  $$
  where $h$ is the element length and $\alpha$ is the stabilization parameter.

- Optimal $\alpha$:
  $$
  \alpha_{\text{opt}} = \coth(Pe) - \frac{1}{Pe}
  $$
  where $Pe = \frac{u l}{2k}$ is the Peclet number.
  
- **Result:** Stable even for high Peclet numbers.

### 3. **Petrov-Galerkin Method with $\alpha = 1$**
- **Scheme:** Fully upwind formulation ($\alpha = 1$).
- Adds significant numerical diffusion but ensures stability.

### 4. **Analytical Solution**
- Exact solution for reference:
  $$
  \phi(x) = \frac{e^{\frac{u x}{k}} - e^{\frac{u L}{k}}}{1 - e^{\frac{u L}{k}}}
  $$

---

## **MATLAB Scripts**
- `convection_diffusion_solver.m`: Main driver script.
- `petrov_galerkin.m`: PG with optimal $\alpha$.
- `petrov_galerkin_alpha1.m`: PG with $\alpha = 1$.
- `standard_galerkin.m`: SG method.
- `analytical_solution.m`: Computes the exact solution.

---

## **Results Summary**
- **Standard Galerkin (SG)**: Oscillatory behavior for $Pe > 1$.
- **PG with optimal $\alpha$**: Matches the analytical solution at all Peclet numbers.
- **PG with $\alpha = 1$**: Stable but introduces artificial diffusion.
- **Grid Convergence:** Solution converges with 150 nodes for $u = 25 \, \text{m/s}$.

**Computation Time:**
- PG Optimal: ~58.12s for $u = 0.1 \, \text{m/s}$.
- SG: ~51.78s for the same velocity.

---

## **How to Run**
1. Open MATLAB.
2. Navigate to the directory with the scripts.
3. Run:
   ```matlab
   convection_diffusion_solver
