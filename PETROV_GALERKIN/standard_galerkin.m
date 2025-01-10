function phi = standard_galerkin(NP, u, k, L)
    le = L / (NP - 1);            % Length of each element
    NE = NP - 1;                  % Number of elements
    
    %% Initialise Global Matrix and Global Forcing function
    gmat = zeros(NP, NP);
    f = zeros(NP, 1);

    %% Computing Local and Global Matrix 
    for ie = 1:NE
        emat = zeros(2,2);
        emat(1,1) = -0.5 * u + (k / le);
        emat(1,2) = 0.5 * u - (k / le);
        emat(2,1) = -0.5 * u - (k / le);
        emat(2,2) = 0.5 * u + (k / le);

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
