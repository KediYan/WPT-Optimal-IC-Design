function [M] = MI_loop_spiral(r_loop,rinner_spiral,d)
    N_loop = 1;
    N_spiral = 7;
    w_p = 2.1e-3;
    r_spiral = [rinner_spiral+0*w_p rinner_spiral+1*w_p rinner_spiral+2*w_p ...
        rinner_spiral+3*w_p rinner_spiral+4*w_p rinner_spiral+5*w_p rinner_spiral+6*w_p];
    uo = 1.2566e-6; 
    M = 0;
    for i=1:N_loop
        for j=1:N_spiral
            func = @(theta) cos(theta)./sqrt(r_loop(i)^2+r_spiral(j)^2+d^2-2*r_loop(i)*r_spiral(j)*cos(theta));
            M = M + uo*r_loop(i)*r_spiral(j)*integral(func,0,pi);
        end
    end