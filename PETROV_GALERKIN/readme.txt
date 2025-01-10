Swansea University
Zienkiewicz Centre for Computational Engineering
====================================================================
Convection-Diffusion Solver using Finite Element Method (Coursework 2)
=====================================================================

Overview
--------
This MATLAB script provides solutions to the convection-diffusion problem using four different methods:
1. Petrov-Galerkin Method with Optimal Alpha (PG Optimal)
2. Petrov-Galerkin Method with Alpha = 1 (PG Alpha1)
3. Standard Galerkin Method (SG)
4. Comparison of Methods with Analytical Solution (CP)

The script allows the user to select a method, input the number of nodes, and the velocity value. It calculates and displays essential parameters like grid size, wave velocity, Peclet number, number of nodes, and elements. Then, it solves the convection-diffusion equation and plots the solution.

USER GUIDE:

How to Run
--------------------------------------------------------------------------------------------------------------
1. Open MATLAB.
2. Navigate to the directory containing the script.
3. Run the script by typing `convection_diffusion_solver` in the MATLAB command window.
4. Follow the on-screen prompts to select a method and enter the required parameters.

Requirements
--------------------------------------------------------------------------------------------------------------
- MATLAB (The script was designed to be compatible with most recent versions of MATLAB.)

Input Parameters
--------------------------------------------------------------------------------------------------------------
- Number of Nodes: Enter an integer value for the total number of nodes in the domain.
- Velocity Value (m/s): Enter a numerical value for the velocity.

Selection of Method
--------------------------------------------------------------------------------------------------------------
Choose the method to solve the convection-diffusion problem:
1. Enter '1' for the Petrov-Galerkin Method with Optimal Alpha.
2. Enter '2' for the Petrov-Galerkin Method with Alpha = 1.
3. Enter '3' for the Standard Galerkin Method.
4. Enter '4' for a comparison with the Analytical Solution.

The script will then proceed to solve the problem using the selected method and plot the solution.

Note: For method comparison (option 4), the script will plot solutions from both Petrov-Galerkin methods, Standard Galerkin, and the Analytical Solution for direct comparison.

Acknowledgments:
Professor Perumal Nithiarasu for concepts of CFD using FEM, applying stabilization using Petrov-Galerkin methodology & scripting matrix assemblies.

Author:
Prajwal Bharadwaj
2337862
MSc Computational Engineering (2023-25)
Swansea University
Wales, UK
