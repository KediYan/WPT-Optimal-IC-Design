function L_spiral = Inductance_of_spiral(rinner_spiral)
    N = 7;
    w = 1.1e-3;
    p = 1e-3;
    Di = rinner_spiral*2;
    Do = 2*(rinner_spiral+(N-1)*(w+p));
    L_uH = (N^2*(Do-N*(w+p))^2)/(16*Do+28*N*(w+p));
    L_spiral = L_uH*39.37/(10^6); % H