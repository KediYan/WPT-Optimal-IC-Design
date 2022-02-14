function Rpi = parasitic_resistance(rinner,N)
    w = 1.1e-3;
    p = 1e-3;
    if N == 1
        p = 0;
    end
    Di = rinner*2;
    Do = 2*(rinner+(N-1)*(w+p));
    
    sigma = 59.6e6;
    f = 13.56e6;
    u0 = 1.2566e-6;
    l = 0.5*N*pi*(Do+Di);
    n = w/(w+p);
    RDC = l/(sigma*pi*(w/2)^2); 
    delta = 1/sqrt(pi*f*sigma*u0*n);
    gamma = w/(delta*sqrt(2));
    [ber0 bei0] = kelvinb(0, gamma);
    [ber1 bei1] = kelvinb(1, gamma);
    [ber2 bei2] = kelvinb(2, gamma);
    ber_prim = 1/sqrt(2)*(ber1+bei1);
    bei_prim = 1/sqrt(2)*(bei1-ber1);
    Rskin_effect = RDC*gamma/2*(ber0*bei_prim-bei0*ber_prim)/(ber_prim^2+bei_prim^2);
    Rproximity_effect = -RDC*gamma/2*2*pi*(ber2*ber_prim+bei2*bei_prim)/(ber0^2+bei0^2);
    Rpi = RDC+Rskin_effect+Rproximity_effect;