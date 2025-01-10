%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program for the Convection-Diffusion Solver using FEM and applying
% Stabilization techniques 
% 
% Zienkiewicz Centre for Computational Engineering 
% College of Engineering
% Swansea University
%
% MODULE: EGM06- Computational Fluid Dynamics (Assignment - 2)
% Instructor ============= Prof. P Nithiarasu
% Author     ============= Prajwal Bharadwaj (2337862)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function convection_diffusion_solver()
    clc;  
    close all;  

    % UI setup for the users to select:
    disp('Select the method to solve the convection-diffusion problem:');
    disp('1 - Petrov-Galerkin Method with Optimal Alpha (PG Optimal)');
    disp('2 - Petrov-Galerkin Method with Alpha = 1 (PG Alpha1)');
    disp('3 - Standard Galerkin Method (SG)');
    disp('4 - Comparison of methods with Analytical Solution (CP)');
    choice = input('Enter your choice (1, 2, 3, or 4): ');

    % User inputs parameters
    NP = input('Enter the number of nodes: ');
    u = input('Enter the velocity value (m/s): ');
    k = 1; % Diffusion coefficient
    L = 1; % Total domain length
    le = L / (NP - 1); % Length of each element
    pec_nu = (u * le) / (2 * k); % Peclet number

    % Display Parameters
    fprintf('\nGrid Size: %.4fm\n', le);
    fprintf('Wave Velocity: %.1fm/s\n', u);
    fprintf('Peclet Number: %.4f\n', pec_nu);
    fprintf('Number of Nodes: %d\n', NP);
    fprintf('Number of Elements: %d\n\n', NP - 1);
    
    % User choices
    switch choice
        case 1 % Petrov-Galerkin Method with Optimal Alpha
            phi = petrov_galerkin(NP, u, k, L, (u*L/(NP-1))/(2*k)); 
            plot_results(phi, L, 'Petrov-Galerkin Method with Optimal Alpha');

        case 2 % Petrov-Galerkin Method with Alpha = 1
            phi = petrov_galerkin_alpha1(NP, u, k, L); 
            plot_results(phi, L, 'Petrov-Galerkin Method with Alpha = 1');

        case 3 % Standard Galerkin Method
            phi = standard_galerkin(NP, u, k, L);
            plot_results(phi, L, 'Standard Galerkin Method');

        case 4 % Comparison with Analytical Solution
            phi_PG_Optimal = petrov_galerkin(NP, u, k, L, (u*L/(NP-1))/(2*k));
            phi_PG_Alpha1 = petrov_galerkin_alpha1(NP, u, k, L);
            phi_SG = standard_galerkin(NP, u, k, L);
            phi_analytical = analytical_solution(NP, u, k, L);
            compare_methods(phi_PG_Optimal, phi_PG_Alpha1, phi_SG, phi_analytical, L);

        otherwise
            disp('Invalid choice. Exiting.');
            return;
    end
end

function plot_results(phi, L, titleText)
    x = linspace(0, L, length(phi));
    plot(x, phi, 'b^-', 'LineWidth', 1, 'MarkerIndices', 1:length(phi));
    grid on;
    xlabel('Domain (x)');
    ylabel('\phi');
    title(titleText);
end

function compare_methods(phi_PG_Optimal, phi_PG_Alpha1, phi_SG, phi_analytical, L)
    x = linspace(0, L, length(phi_PG_Optimal));
    figure;   
    plot(x, phi_PG_Optimal, 'r-p', 'LineWidth', 1, 'MarkerSize', 8, 'DisplayName', 'PG Optimal');    
    hold on;    
    plot(x, phi_PG_Alpha1, 'g-^', 'LineWidth', 1, 'MarkerSize', 8, 'DisplayName', 'PG Alpha=1');
    plot(x, phi_SG, 'b-s', 'LineWidth', 1, 'MarkerSize', 8, 'DisplayName', 'Standard Galerkin'); 
    plot(x, phi_analytical, 'k-o', 'LineWidth', 1, 'MarkerSize', 8, 'DisplayName', 'Analytical Solution');    
    hold off;
    grid on;
    legend('Location', 'southwest');
    xlabel('Domain (x)');
    ylabel('\phi (Scalar Quantity)');
    title('Comparison of Methods');
end
