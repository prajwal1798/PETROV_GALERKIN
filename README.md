# PETROV_GALERKIN
 Petrov-Galerkin Stability analysis for Higher Peclet Numbers

# **Convection-Diffusion Solver**

## **Overview**
This MATLAB program provides solutions to the steady-state convection-diffusion equation using the finite element method (FEM) with various approaches.

## **Governing Equation**
The general form of the 1D convection-diffusion equation:
![equation](https://latex.codecogs.com/svg.image?u%20%5Cfrac%7Bd%5Cphi%7D%7Bdx%7D%20-%20k%20%5Cfrac%7Bd%5E2%5Cphi%7D%7Bdx%5E2%7D%20%3D%200)

where:
- \(u\): Constant convection velocity
- \(k\): Diffusion coefficient
- \(\phi\): Scalar quantity being transported

### **Boundary Conditions**
- \(\phi(0) = 1\)
- \(\phi(L) = 0\)

### **Analytical Solution**
![equation](https://latex.codecogs.com/svg.image?%5Cphi(x)%20%3D%20%5Cfrac%7Be%5E%7B%5Cfrac%7Bu%20x%7D%7Bk%7D%7D%20-%20e%5E%7B%5Cfrac%7Bu%20L%7D%7Bk%7D%7D%7D%7B1%20-%20e%5E%7B%5Cfrac%7Bu%20L%7D%7Bk%7D%7D%7D)

## **Finite Element Discretization**
### **Shape Functions**
For 1D linear elements:
![equation](https://latex.codecogs.com/svg.image?N_1%20%3D%201%20-%20%5Cfrac%7Bx%7D%7Bl%7D,%20%5Cquad%20N_2%20%3D%20%5Cfrac%7Bx%7D%7Bl%7D)

where \(l\) is the length of each element.

### **Standard Galerkin Formulation for the Convection Term**
![equation](https://latex.codecogs.com/svg.image?%5Cint_%7B%5COmega_e%7D%20%5Cmathbf%7BN%7D%5ET%20u%20%5Cfrac%7Bd%5Cphi%7D%7Bdx%7D%20d%5COmega%20%3D%20%5Cfrac%7Bu%7D%7B2%7D%20%5Cbegin%7Bbmatrix%7D%20-1%20%26%201%5C%5C%20-1%20%26%201%20%5Cend%7Bbmatrix%7D%20%5Cbegin%7Bbmatrix%7D%5Cphi_1%5C%5C%5Cphi_2%5Cend%7Bbmatrix%7D)

---

### **Instructions**
1. Open MATLAB and navigate to the folder containing the script.
2. Run the script by typing:
   ```matlab
   convection_diffusion_solver
