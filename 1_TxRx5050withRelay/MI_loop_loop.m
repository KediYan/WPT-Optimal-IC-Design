function [M] = MI_loop_spiral(r_loop_1,r_loop_2,d)
    N_loop = 1;
    w_p = (1+0.82)*1e-3;
    uo = 1.2566e-6; 
    % 
    func = @(theta) cos(theta)./sqrt(r_loop_1^2+r_loop_2^2+d^2-2*r_loop_1*r_loop_2*cos(theta));
    M = uo*r_loop_1*r_loop_2*integral(func,0,pi);