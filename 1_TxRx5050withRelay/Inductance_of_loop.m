function L_loop = Inductance_of_loop(rinner_loop)
%  	%Kirchhoff's Formula     
% 	Rloop = rinner_loop*100; % m -> cm
%     w = 1.1e-1; % cm
%     L_nH = 4*pi*Rloop*(log(8*Rloop/w)-1.75); % nH
%     L_loop = L_nH*10^-9;

    %Maxwell Formula
    uo = 1.2566e-6; % permibility in free space
    u = 1;
    a = 0.82e-3/2; % wire radius in m
    k_square = 4*rinner_loop*(rinner_loop-a)/(2*rinner_loop-a)^2;
    [K,E] = ellipke(sqrt(k_square));
    L_loop = u*uo*(2*rinner_loop-a)*((1-k_square/2)*K - E);
