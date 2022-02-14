clear all,clc,close all
%-----User Variables-----%
% spiral coils
OD_TSC = 50e-3; OD_RSC = 50e-3; w = 1.1e-3; p = 1e-3; N = 7;
IR_TSC = OD_TSC/2-(N-1)*(w+p); IR_RSC = OD_RSC/2-(N-1)*(w+p); 
% loop coils
IR_TLC = (OD_TSC/2 + IR_TSC)/2; IR_RLC = (OD_RSC/2 + IR_RSC)/2;
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
L2 = Inductance_of_spiral(IR_TSC);
C2 = 1/(wo^2*L2);
% Characteristics of Rx spiral
Rp3 = parasitic_resistance(IR_RSC,7);
L3 = Inductance_of_spiral(IR_RSC);
C3 = 1/(wo^2*L3);
% Self Impedance
Z11 = Rp1+Rsource+1i*wo*L1-1i/(wo*C1);
Z22 = Rp2+1i*wo*L2-1i/(wo*C2);
Z33 = Rp3+1i*wo*L3-1i/(wo*C3);
Z44 = Rp4+Rload+1i*wo*L4-1i/(wo*C4);

rinner_relay_array = 2.4e-3:5e-3:87.4e-3; OD_relay_array = 2*(rinner_relay_array+(N-1)*(w+p));
S21_simulation = []; i = 0; d2i_steps = 5e-3:5e-3:145e-3; %5e-3:5e-3:145e-3 OR 1e-3:1e-3:149e-3

for rinner_relay=rinner_relay_array 
    i = i + 1;
    S21_of_each_relay_size = []; 
    for d2i = d2i_steps             % Separation between TSC and ISC: 5mm to 145 mm
        d3i = 150e-3 - d2i;         % TSC and RSC are 150 mm away 
        % Mutual Inductance
        M12 = MI_loop_spiral(IR_TLC,IR_TSC,d12);
        M34 = MI_loop_spiral(IR_RLC,IR_RSC,d34);
        M2i = MI_spiral_spiral(IR_TSC, rinner_relay, d2i);
        M3i = MI_spiral_spiral(IR_RSC, rinner_relay, d3i);
        % Characteristics of the Relay Coil
        Li = Inductance_of_spiral(rinner_relay);
        Rpi = parasitic_resistance(rinner_relay,7);
        Ci = 1/(wo^2*Li);
        Zii = Rpi+1i*wo*Li-1i/(wo*Ci);
        % Mutual Impedance
        Z12 = 1i*wo*M12;
        Z34 = 1i*wo*M34;
        Z2i = 1i*wo*M2i;
        Z3i = 1i*wo*M3i;
        % VL/VS
        Numerator = Z12*Z2i*Z3i*Z34*Rload;
        Denominator = Z11*Z22*Zii*Z33*Z44+Z11*Z2i^2*Z34^2+Zii*Z12^2*Z34^2+Z44*Z12^2*Z3i^2-...
            Z12^2*Zii*Z33*Z44-Z2i^2*Z11*Z33*Z44-Z3i^2*Z11*Z22*Z44-Z34^2*Z11*Z22*Zii;
        VL_over_Vs = Numerator./Denominator;
        S21 = 2*VL_over_Vs*(Rsource/Rload)^0.5;
        S21_of_each_relay_size = [S21_of_each_relay_size,abs(S21)];
    end
    S21_simulation(i,:) = S21_of_each_relay_size;
end

imagesc(d2i_steps*1e3,OD_relay_array*1e3,S21_simulation);
set(gca,'YDir','normal','XTick',[5:10:145],'YTick',[30:10:200],'FontName','Times New Roman','FontWeight','bold');
xlabel('Separation Between the TX and the IC (mm)','FontSize',12);
ylabel('Outer Diameter of the IC (mm)','FontSize',12);
cb = colorbar;
cb.Label.String = 'S21 Linear Magnitude';
cb.Label.FontSize = 12;
colormap(parula);
caxis([0 0.7]);
