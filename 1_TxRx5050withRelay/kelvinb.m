function [ber, bei] = kelvinb(n, x)
    i = complex(0,1);
    a = exp(3*pi*i/4);
    be = besselj(n,x*a);
    ber = real(be);
    bei = imag(be);
