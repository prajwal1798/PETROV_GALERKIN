# PETROV_GALERKIN
 Petrov-Galerkin Stability analysis for Higher Peclet Numbers

# **1D Convection-Diffusion Solver**

## **Overview**
This MATLAB project solves the **1D steady-state convection-diffusion equation** using the finite element method (FEM) and compares different formulations:

---

## **Problem Statement**
The 1D steady-state convection-diffusion equation:
![equation](https://latex.codecogs.com/svg.image?\color{White}u\frac{\partial\phi}{\partial{x}}-k\frac{\partial^2\phi}{\partial{x}^2}=0)

### **Boundary Conditions**
- Inlet: ![equation](https://latex.codecogs.com/svg.image?\color{White}\phi(0)=1)
- Outlet: ![equation](https://latex.codecogs.com/svg.image?\color{White}\phi(L)=0)

---

## **Methods Implemented**

### 1. **Standard Galerkin Method (SG)**
- **Discretization:** Linear shape functions.
- **Issue:** Unstable for advection-dominated flows (![equation](https://latex.codecogs.com/svg.image?\color{White}Pe>1)).

### 2. **Petrov-Galerkin Method with Optimal \(\alpha\)**
- Adds artificial diffusion:
  ![equation](https://latex.codecogs.com/svg.image?\color{White}k_b=\frac{\alpha%20u%20h}{2})
- Optimal \(\alpha\):
  ![equation](https://latex.codecogs.com/svg.image?\color{White}\alpha_{\text{opt}}=\coth(Pe)-\frac{1}{Pe})
- Stable for all Peclet numbers.

### 3. **Petrov-Galerkin Method with \(\alpha = 1\)**
- Fully upwind scheme (\(\alpha = 1\)).
- Adds more numerical diffusion but ensures stability.

### 4. **Analytical Solution**
- Exact solution:
  ![equation](https://latex.codecogs.com/svg.image?\color{White}\phi(x)=\frac{e^{\frac{ux}{k}}-e^{\frac{uL}{k}}}{1-e^{\frac{uL}{k}}})

---

## **Finite Element Discretization**
- Shape functions:
  ![equation](https://latex.codecogs.com/svg.image?\color{White}N_1=1-\frac{x}{l},\quad%20N_2=\frac{x}{l})

### **Convection Term Matrix (Displayed as Table)**
The convection term matrix:
|   |   |
|---|---|
| -1 |  1 |
| -1 |  1 |

### **Diffusion Term Matrix (Displayed as Table)**
The diffusion term matrix:
|   |   |
|---|---|
|  1 | -1 |
| -1 |  1 |

---

## **Results Summary**
- **Standard Galerkin (SG)**: Unstable for advection-dominated flows.
- **Petrov-Galerkin with optimal \(\alpha\)**: Matches the analytical solution.
- **Petrov-Galerkin (\(\alpha = 1\))**: Adds significant diffusion but stabilizes the solution.
- **Grid Convergence:** Achieved at 150 nodes for \(u = 25 \, \text{m/s}\).

---

## **MATLAB Scripts**
- `convection_diffusion_solver.m`: Main script.
- `petrov_galerkin.m`: PG with optimal \(\alpha\).
- `petrov_galerkin_alpha1.m`: PG with \(\alpha = 1\).
- `standard_galerkin.m`: SG method.
- `analytical_solution.m`: Exact solution function.

---

## **How to Run**
1. Open MATLAB.
2. Navigate to the directory containing the scripts.
3. Run the following command:
   ```matlab
   convection_diffusion_solver


