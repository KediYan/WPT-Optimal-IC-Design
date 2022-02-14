function [M] = MI_spiral_spiral(rinner_spiral, rinner_relay, d)
    N_relay = 7;
    N_spiral = 7;
    w_p = 2.1e-3;
    R_relay = [rinner_relay+0*w_p rinner_relay+1*w_p rinner_relay+2*w_p ...
        rinner_relay+3*w_p rinner_relay+4*w_p rinner_relay+5*w_p rinner_relay+6*w_p];
    R_spiral = [rinner_spiral+0*w_p rinner_spiral+1*w_p rinner_spiral+2*w_p ...
        rinner_spiral+3*w_p rinner_spiral+4*w_p rinner_spiral+5*w_p rinner_spiral+6*w_p];
    uo = 1.2566e-6; 
    M = 0;
    for i=1:N_relay
        for j=1:N_spiral
            func = @(theta) cos(theta)./sqrt(R_relay(i)^2+R_spiral(j)^2+d^2-2*R_relay(i)*R_spiral(j)*cos(theta));
            M = M + uo*R_relay(i)*R_spiral(j)*integral(func,0,pi);
        end
    end