function phi = analytical_solution(NP, u, k, L)
    x = linspace(0, L, NP);
    phi = (exp(u * x / k) - exp(u * L / k)) / (1 - exp(u * L / k));
end
