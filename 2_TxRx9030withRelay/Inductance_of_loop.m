function L_loop = Inductance_of_loop(rinner_loop)
    Rloop = rinner_loop*100; % m -> cm
    w = 1.1e-1; % cm
    % Kirchhoff's Formula
    L_nH = 4*pi*Rloop*(log(8*Rloop/w)-1.75); % nH
    L_loop = L_nH*10^-9;
