clc, clear all, close all
rinner_relay_array = 2.4e-3:1e-3:87.4e-3;
Rpi_over_Li_array = [];
for rinner_relay=rinner_relay_array
    Li = Inductance_of_spiral(rinner_relay);
    Rpi = parasitic_resistance(rinner_relay,7);
    Rpi_over_Li_array = [Rpi_over_Li_array, Rpi/Li];
end
OD_array = 2*(rinner_relay_array+(7-1)*(2.1e-3))*10^3;

yyaxis right
plot(OD_array(1:end),Rpi_over_Li_array,'LineWidth',3); % plot lossy term
% plot(OD_array(2:end),diff(Rpi_over_Li_array),'LineWidth',3); % plot the first order differential of the lossy term
% plot(OD_array(1:end),Rpi_over_Li_array./(1000*OD_array),'LineWidth',3); % plot lossy term/OD
ylabel('Lossy Term (R_{pi}/L_i)','FontSize',14,'Color','black');

yyaxis left
MaxS21_measurement_sym = [0.354620673265604,0.487650866225708,0.543693260978405,0.570036021090789,0.581388718109415,0.586518074307740,0.590208214903066,0.590623468881615,0.590339305456384,0.594286069229990,0.594402325690795,0.592152817471403,0.593513429178238,0.585613055226717,0.572265085566469,0.549311447887509,0.517606116850797,0.487431733669083];
MaxS21_measurement_asym = [0.266315534445775,0.344584271297965,0.374130013830375,0.390564036002884,0.396497086110775,0.398850370672499,0.399597764542076,0.400130631939953,0.399340033471839,0.400617623176591,0.401680454713445,0.398797658746916,0.396675337574872,0.387230270893168,0.371771162978389,0.350239036910654,0.320153202175780,0.293327310340021];
plt = plot(30:10:150,MaxS21_measurement_sym(1:13),'LineWidth',3); % Linear Magnitude
% plt = plot(30:10:150,20*log10(MaxS21_measurement_sym(1:13)),'LineWidth',3); % Log Magnitude
hold on
plt = plot(30:10:150,MaxS21_measurement_asym(1:13),'--','LineWidth',3); % Linear Magnitude
% plt = plot(30:10:150,20*log10(MaxS21_measurement_asym(1:13)),'--','LineWidth',3); % Log Magnitude
hold off
ylabel('S21 at the Optimal Location','FontSize',14,'Color','black');

xlabel('Outer Diameter of Intermediate Coils (mm)','FontSize',14);
% legend("S21 at the Optimal Location Symmetric","S21 at the Optimal Location Asymmetric","first order difference lossy element")
legend("S21 at the Optimal Location Symmetric","S21 at the Optimal Location Asymmetric","Losst Term")
% set(gca,"FontWeight","bold","Xlim",[30 150],"XTick",[30:10:150],"Ylim",[0 0.7]);
set(gca,'FontName','Times New Roman',"FontWeight","bold","Xlim",[30 150],"XTick",[30:10:150]);

rectangle('Position',[50 0 20 1],'Curvature',0.2,'EdgeColor','none', 'FaceColor',[1 0 0 0.3])
