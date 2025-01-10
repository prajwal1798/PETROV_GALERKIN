% petrov_galerkin_multi_nodes_plot.m

% Define the set of nodes to be used for plotting
node_sets = [10, 25, 100, 250];
u = 25; % Constant velocity for all cases
k = 1; % Diffusion coefficient
L = 1; % Length of the domain

% Open a new figure
figure;
hold on; % Hold on for multiple plots

% Loop over the set of nodes and plot results
for NP = node_sets
    pec_nu = (u * L / (NP - 1)) / (2 * k); % Peclet number for each node set
    phi = petrov_galerkin(NP, u, k, L, pec_nu); % Solve using Petrov-Galerkin method
    
    % Generate the x values for plotting
    x = linspace(0, L, NP);
    
    % Plot the results
    plot(x, phi, 'DisplayName', ['Nodes = ' num2str(NP)], LineWidth=1);
end

% Customize the plot
hold off;
grid on;
grid minor;
xlabel('Domain (x)');
ylabel('Solution (\phi)');
title('Petrov-Galerkin Method for Various Node Counts');
legend('Location', 'southwest');

function phi = petrov_galerkin(NP, u, k, L, pec_nu)
    le = L / (NP - 1);                    % Length of each element 
    NE = NP - 1;                          % Number of elements 
    alpha_opt = coth(pec_nu) - 1/pec_nu;  % Optimal Alpha
    
    %% Initialise Global Matrix and Global Forcing function
    gmat = zeros(NP, NP);
    f = zeros(NP, 1);
    
    %% Computing Local and Global Matrix 
    for ie = 1:NE
        emat = zeros(2,2);
        emat(1,1) = -0.5 * u + (k / le) + (alpha_opt * u / 2);
        emat(1,2) = 0.5 * u - (k / le) - (alpha_opt * u / 2);
        emat(2,1) = -0.5 * u - (k / le) - (alpha_opt * u / 2);
        emat(2,2) = 0.5 * u + (k / le) + (alpha_opt * u / 2);

        ip1 = ie;
        ip2 = ie + 1;
        gmat(ip1,ip1) = gmat(ip1,ip1) + emat(1,1);
        gmat(ip1,ip2) = gmat(ip1,ip2) + emat(1,2);
        gmat(ip2,ip1) = gmat(ip2,ip1) + emat(2,1);
        gmat(ip2,ip2) = gmat(ip2,ip2) + emat(2,2);
    end
    
    %% Global Matrix reduction for Applied BC's
    %% phi(1) = 1; phi(0) = 0; 
    % Therefore reduce the first and last row and column repsectively
    gmat_reduced = gmat(2:end-1, 2:end-1);
    f_reduced = f(2:end-1);

    %% Since first column could not be deletd, as the dirichet is not 0, taking it into RHS
    f_reduced(1) = f_reduced(1) - gmat(2, 1) * 1;

    %% Solving reduced solution vector phi
    phi_internal = gmat_reduced \ f_reduced;

    %% Assembling Global solution vector phi
    phi = [1; phi_internal; 0];
end

