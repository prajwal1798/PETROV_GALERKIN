# PETROV_GALERKIN
 Petrov-Galerkin Stability analysis for Higher Peclet Numbers

# **1D Convection-Diffusion Solver**

## **Overview**
This MATLAB project solves the **1D steady-state convection-diffusion equation** using the finite element method (FEM) and compares different formulations.

---

## **Problem Statement**
Solve the 1D convection-diffusion equation:
![equation](https://latex.codecogs.com/svg.image?\color{White}u\frac{\partial\phi}{\partial{x}}-k\frac{\partial^2\phi}{\partial{x}^2}=0)

### **Boundary Conditions**
- ![equation](https://latex.codecogs.com/svg.image?\color{White}\phi(0)=1) (inlet)
- ![equation](https://latex.codecogs.com/svg.image?\color{White}\phi(L)=0) (outlet)

---

## **Methods Implemented**

### 1. **Standard Galerkin Method (SG)**
- **Discretization:** Linear shape functions.
- **Issue:** Unstable for advection-dominated flows (![equation](https://latex.codecogs.com/svg.image?\color{White}Pe>1)).

### 2. **Petrov-Galerkin Method with Optimal Alpha**
- Adds artificial diffusion:
  ![equation](https://latex.codecogs.com/svg.image?\color{White}k_b=\frac{\alpha%20u%20h}{2})
- Optimal value of alpha:
  ![equation](https://latex.codecogs.com/svg.image?\color{White}\alpha_{\text{opt}}=\coth(Pe)-\frac{1}{Pe})

### 3. **Analytical Solution**
- Exact solution:
  ![equation](https://latex.codecogs.com/svg.image?\color{White}\phi(x)=\frac{e^{\frac{ux}{k}}-e^{\frac{uL}{k}}}{1-e^{\frac{uL}{k}}})
