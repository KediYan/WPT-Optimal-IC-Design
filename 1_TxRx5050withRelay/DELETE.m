clc, clear all
close all
% four-coil system
OD_TSC = 50e-3; OD_RSC = 50e-3; w = 1.1e-3; p = 1e-3; N = 7;
IR_TSC = OD_TSC/2-(N-1)*(w+p); IR_RSC = OD_RSC/2-(N-1)*(w+p); 
% loop coils
IR_TLC = (OD_TSC/2 + IR_TSC)/2; IR_RLC = (OD_TSC/2 + IR_TSC)/2;
% separation of loop and spiral
d12 = 15e-3; d34 = 15e-3;
% resonant frequency = 13.56 MHz
wo = 2*pi*13.56*10^6; 
Rsource = 50; Rload = 50;
%------------------------%
% Characteristics of Tx loop
Rp1 = parasitic_resistance(IR_TLC,1);
L1 = Inductance_of_loop(IR_TLC);
C1 = 1/(wo^2*L1);
% Characteristics of Rx loop
Rp4 = parasitic_resistance(IR_RLC,1);
L4 = Inductance_of_loop(IR_RLC);
C4 = 1/(wo^2*L4);
% Characteristics of Tx spiral
Rp2 = parasitic_resistance(IR_TSC,7);
% Rp2 = 1.9;
L2 = Inductance_of_spiral(IR_TSC);
C2 = 1/(wo^2*L2);
% Characteristics of Rx spiral
Rp3 = parasitic_resistance(IR_RSC,7);
% Rp3 = 0.4;
L3 = Inductance_of_spiral(IR_RSC);
C3 = 1/(wo^2*L3);
% Self Impedance
Z11 = Rp1+1i*wo*L1-1i/(wo*C1);
Z22 = Rp2+1i*wo*L2-1i/(wo*C2);
Z33 = Rp3+1i*wo*L3-1i/(wo*C3);
Z44 = Rp4+1i*wo*L4-1i/(wo*C4);

M12 = MI_loop_spiral(IR_TLC,IR_TSC,d12); M34 = MI_loop_spiral(IR_RLC,IR_RSC,d34);
Z12 = 1i*wo*M12; Z34 = 1i*wo*M34; 
Z21 = Z12; Z43 = Z34;

real_S21 = [0.028 0.066 0.126 0.237 0.339 0.468 0.589 0.631 0.596 0.519 0.447 ...
    0.367 0.305 0.249 0.209];
d23_array = []; sim_S21 = []; i = 0;
% |Z11 Z12 Z13 Z14|
% |Z21 Z22 Z23 Z24|
% |Z31 Z32 Z33 Z34|
% |Z41 Z42 Z43 Z44|
for d23=10e-3:10e-3:150e-3
    i = i + 1;
    % Mutual Inductance
    M13 = MI_loop_spiral(IR_TLC,IR_RSC,d12+d23);
    M14 = MI_loop_loop(IR_TLC,IR_RLC,d12+d23+d34);
    M23 = MI_spiral_spiral(IR_TSC,IR_RSC,d23);
    M24 = MI_loop_spiral(IR_TSC,IR_RLC,d23+d34);
    % Mutual Impedance
    Z13 = 1i*wo*M13; Z14 = 1i*wo*M14;
    Z23 = 1i*wo*M23; Z24 = 1i*wo*M24;
    Z31 = Z13; Z32 = Z23;
    Z41 = Z14; Z42 = Z24;
    
    z_param = [Z11,Z12,Z13,Z14;Z21,Z22,Z23,Z24;Z31,Z32,Z33,Z34;Z41,Z42,Z43,Z44];
    s_params = z2s(z_param,50);
    sim_S21(i) = abs(s_params(2,1))+abs(s_params(3,2))+abs(s_params(4,3));
%     sim_S21(i) = abs(s_params(4,1));
    d23_array(i) = d23;
end

plot(d23_array,sim_S21,'r-');
hold on
plot(d23_array,real_S21,'bo');
hold off
xlabel('d23 (meter)');
ylabel('S21 Linear Magnitude');
legend('Simualtion','Measurement');