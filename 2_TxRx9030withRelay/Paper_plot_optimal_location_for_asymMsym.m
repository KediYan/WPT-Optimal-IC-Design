clc, clear all
close all
% equal coupling point vs. size of relays
OD_TSC = 90e-3; OD_RSC = 30e-3; w = 1.1e-3; p = 1e-3; N = 7;
IR_TSC = OD_TSC/2-(N-1)*(w+p); IR_RSC = OD_RSC/2-(N-1)*(w+p); 
IR_TLC = 33.75e-3; IR_RLC = 5.22e-3;
d12 = 35e-3; d34 = 2e-3;
Ltxl = Inductance_of_loop(IR_TLC); Lrxl = Inductance_of_loop(IR_RLC);
M12 = MI_loop_spiral(IR_TLC,IR_TSC,d12); M34 = MI_loop_spiral(IR_RLC,IR_RSC,d34);

Ltxc =  Inductance_of_spiral(IR_TSC); 
Lrxc = Inductance_of_spiral(IR_RSC);

k12 = M12/sqrt(Ltxl*Ltxc); k34 = M34/sqrt(Lrxl*Lrxc);
alpha = k12/k34; beta = Ltxl/Lrxl;

rinner_relay_array = [2.4 7.4 12.4 17.4 22.4 27.4 32.4 37.4 42.4 47.4 52.4 ...
    57.4 62.4 67.4 72.4 77.4 82.4 87.4]*10^-3;
d2i_array = 1e-3:1e-3:149e-3;
%d2i_array = 5e-3:5e-3:145e-3;
k_ratio_array = []; k_alphasqrtbeta_array_asym = []; OD = 30:10:200;
for relay_index = 1:1:18
    rinner_relay = rinner_relay_array(relay_index); Lrelay = Inductance_of_spiral(rinner_relay);
    ktx_relay_array = []; krx_relay_array = [];
    for d2i = d2i_array
        ktx_relay_array = [ktx_relay_array, MI_spiral_spiral(IR_TSC,rinner_relay,d2i)/sqrt(Ltxc*Lrelay)];
        krx_relay_array = [krx_relay_array, MI_spiral_spiral(IR_RSC,rinner_relay,150e-3-d2i)/sqrt(Lrxc*Lrelay)];
    end
    [value,index] = min(abs(ktx_relay_array-alpha*sqrt(beta)*krx_relay_array));
    k_ratio_array = [k_ratio_array, ktx_relay_array(index)];
    k_alphasqrtbeta_array_asym = [k_alphasqrtbeta_array_asym, d2i_array(index)*1e3];
end

MaxS21LocationSimulationAsym = [97 98 98 99 100 101 102 104 106 109 111 114 118 121 126 130 135 141];
MaxS21LocationMeasurementAsym = [100 100 100 100 100 102.5 105 105 110 110 110 115 120 120 125 125 130 135];
MaxS21LocationSimulationSym = [75 75 75 75 75 75 75 75 75 75 75 75 75 75 75 75 75 75];
MaxS21LocationMeasurementSym = [75 75 75 75 75 75 75 75 75 75 75 75 75 75 75 75 75 75];
k_alphasqrtbeta_array_sym = [75 75 75 75 75 75 75 75 75 75 75 75 75 75 75 75 75 75];
%% Plot
close all
% figure
% plot(MaxS21LocationSimulationAsym,OD,'Color','#0072BD','LineStyle','-','Marker','none','LineWidth',3);
% hold on
% plot(MaxS21LocationMeasurementAsym,OD,'Color','#EDB120','LineStyle','none','Marker','x','LineWidth',3);
% hold on
% plot(k_alphasqrtbeta_array_asym,OD,'Color','#77AC30','LineStyle','-','Marker','none','LineWidth',3)
% hold off
% xlabel('Separation Between the Transmitting Coil and the Intermediate Coil (mm)','FontSize',12);
% set(gca,'XLim',[0 150],'XTick',[5:10:145],'XTickLabelRotation',0)
% ylabel('Outer Diameter of the Intermediate Coil (mm)','FontSize',12);
% set(gca,'YTick',[30:10:200])
% legend({'Simulation: Max(S21) Location (Asymmatric)','Measurement: Max(S21) Location (Asymmatric)','Simulation: k_{2i}/k_{3i} = \alpha\beta^{1/2} (Asymmatric)',},'Location','Northwest','FontSize',10);
% set(gca,'FontSize',12,'FontName','Times New Roman','FontWeight','bold');
% set(gcf,'position',[680,513,606,465]);

figure
plot(MaxS21LocationSimulationSym,OD,'Color','#0000FF','LineStyle','-','Marker','none','LineWidth',3);
hold on
plot(MaxS21LocationMeasurementSym,OD,'Color','#0072BD','LineStyle','none','Marker','o','MarkerSize',15,'LineWidth',3);
hold on
plot(MaxS21LocationSimulationAsym,OD,'Color','#D95319','LineStyle','-','Marker','none','LineWidth',3);
hold on
plot(MaxS21LocationMeasurementAsym,OD,'Color','#EDB120','LineStyle','none','Marker','x','MarkerSize',15,'LineWidth',3);
hold on
plot(k_alphasqrtbeta_array_sym,OD,'Color','#00FF00','LineStyle','-','Marker','none','LineWidth',3)
hold on
plot(k_alphasqrtbeta_array_asym,OD,'Color','#77AC30','LineStyle','-','Marker','none','LineWidth',3)
hold off
xlabel('Separation Between the Transmitting Coil and the Intermediate Coil (mm)');
set(gca,'XLim',[0 150],'XTick',[5:10:145],'XTickLabelRotation',0)
ylabel('Outer Diameter of the Intermediate Coil (mm)');
set(gca,'YTick',[30:10:200])
legend({'Simulation: S21^* Curve (Symmatric)','Measurement: S21^* Curve (Symmatric)',...
    'Simulation: S21^* Curve (Asymmatric)','Measurement: S21^* Curve (Asymmatric)',...
    'Simulation: k_{2i}/k_{3i} = \alpha\beta^{1/2} (Symmatric)','Simulation: k_{2i}/k_{3i} = \alpha\beta^{1/2} (Asymmatric)'},...
    'Location','Northwest','FontSize',14,'FontWeight','bold');
% legend({'Simulation: Max(S21) Location (Symmatric)','Measurement: Max(S21) Location (Symmatric)',...
%     'Simulation: Max(S21) Location (Asymmatric)','Measurement: Max(S21) Location (Asymmatric)',...
%     'Simulation: k_{2i}/k_{3i} = \alpha\beta^{1/2} (Symmatric)','Simulation: k_{2i}/k_{3i} = \alpha\beta^{1/2} (Asymmatric)'},'Location','Northwest','FontSize',12);
set(gca,'FontSize',20,'FontName','Times New Roman','FontWeight','bold');
set(gcf,'position',[334,80,1055,727]);


