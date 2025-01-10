function phi = petrov_galerkin_alpha1(NP, u, k, L)
    le = L / (NP - 1);                    % Length of each element 
    NE = NP - 1;                          % Number of elements 
    alpha_opt = 1;                        % Alpha set to 1
    
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
    gmat_reduced = gmat(2:end-1, 2:end-1);
    f_reduced = f(2:end-1);
    f_reduced(1) = f_reduced(1) - gmat(2, 1) * 1; 

    %% Solving reduced solution vector phi
    phi_internal = gmat_reduced \ f_reduced;

    %% Assembling Global solution vector phi
    phi = [1; phi_internal; 0];
end
