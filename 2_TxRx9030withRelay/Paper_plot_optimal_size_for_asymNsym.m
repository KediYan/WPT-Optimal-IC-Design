clc, clear all, close all

w = 1.1e-3; p = 1e-3; N = 7;
rinner_relay_array = 2.4e-3:1e-3:87.4e-3; 
OD_array = int16(2*(rinner_relay_array+(N-1)*(w+p))*10^3);
if length(rinner_relay_array) > 18
    % Data from [maxS21_array] variable in Optimal_location.m
    maxS21_sim_asym = [0.203011856161082	0.225976177328222	0.246876091891573	0.265505312384001	0.281889393789011	0.297357072047642	0.310680960227217	0.322060226401938	0.331732536629794	0.339924947056751	0.346843126183347	0.352667319048431	0.357552186865317	0.361628652435336	0.365971021331349	0.370005647049934	0.373624231226724	0.376870540247417	0.379779558566740	0.382379195519643	0.384691697372465	0.386734810765120	0.388522739205549	0.390066928442899	0.391376710663829	0.392459832118568	0.393322884205204	0.393971654247048	0.394411409124849	0.394647122474794	0.394683654229554	0.394525889764444	0.394178844727556	0.393647740707938	0.395100655397647	0.396463499707549	0.397598300251624	0.398504734756569	0.399183545515674	0.399636521690377	0.399866466022260	0.399877147929151	0.399673245016091	0.399260275052857	0.398644520451875	0.397933493707517	0.399129060243145	0.400058124124794	0.400725380242208	0.401136653878684	0.401298792880904	0.401219554902416	0.400907491943086	0.400371834253904	0.399622375486042	0.400248112662306	0.400965867922880	0.401413063002429	0.401599250958622	0.401534695282958	0.401230242188549	0.400697197357507	0.400188585537653	0.400874418914934	0.401290138602816	0.401446771564366	0.401355843198515	0.401029256661535	0.400479179259535	0.400486237249455	0.400884820193442	0.401032231427576	0.400940251673094	0.400620901646330	0.400086342581749	0.400224480250526	0.400426400114707	0.400396977756132	0.400147794354375	0.399690518647574	0.399593221035982	0.399709180442578	0.399610089943255	0.399306877071321	0.398810488203212	0.398848441170566];
    maxS21_sim_sym = [0.166297090578393	0.192724751330850	0.218532331783032	0.243001964640281	0.265666808662896	0.286283117722537	0.304781656867369	0.321215369146213	0.335713372975845	0.348445324596329	0.359596320284305	0.369350666768339	0.377882326148765	0.385350000296773	0.391895232919624	0.397642348750671	0.402699423764962	0.407159763905299	0.411103569961881	0.414599600595763	0.417706732073181	0.420475366996079	0.422948676298014	0.425163676832994	0.427152156279876	0.428941461256583	0.430555165679784	0.432013635883185	0.433334507652134	0.434533088634418	0.435622697825676	0.436614952151430	0.437520008647671	0.438346769404168	0.439103055280344	0.439795753420623	0.440430942766816	0.441014001069724	0.441549696321595	0.442042265047716	0.442495479493637	0.442912705410880	0.443296951866909	0.443650914275011	0.443977011648428	0.444277418923940	0.444554095067476	0.444808807563707	0.445043153799129	0.445258579770783	0.445456396487836	0.445637794378778	0.445803855971089	0.445955567071551	0.446093826642701	0.446219455543220	0.446333204276628	0.446435759872657	0.446527752008728	0.446609758464442	0.446682309989615	0.446745894655794	0.446800961752050	0.446847925278069	0.446887167080784	0.446919039675002	0.446943868783452	0.446961955627318	0.446973578994580	0.446978997110174	0.446978449329160	0.446972157671595	0.446960328215632	0.446943152363481	0.446920807993205	0.446893460507868	0.446861263792280	0.446824361086443	0.446782885783841	0.446736962161810	0.446686706050486	0.446632225446120	0.446573621073967	0.446510986905397	0.446444410633428	0.446373974110443];
    % Data from [Rpi_over_Li_array] variable in Optimal_size.m
    Rpi_over_Li_array = [1074437.46476571	970595.212667159	890061.453955713	825814.356678423	773386.164216626	729801.572613780	693003.981335863	661527.054011015	634297.541731250	610512.071920677	589557.478928658	570957.745054563	554337.741279241	539397.879833057	525896.034428249	513634.410302946	502449.853528432	492206.593433973	482790.734646828	474106.026056181	466070.574435493	458614.265660600	451676.722054892	445205.670262710	439155.626571435	433486.829951715	428164.370048609	423157.469816445	418438.891736663	413984.443485609	409772.564156598	405783.976133484	402001.390781453	398409.258496622	394993.555508514	391741.601283803	388641.901528524	385684.012699025	382858.424661764	380156.458728607	377570.178768098	375092.313477935	372716.188217597	370435.665057277	368245.089910790	366139.245795024	364113.311403535	362162.824302681	360283.648159658	358471.943496497	356724.141535317	355036.920760331	353407.185873043	351832.048860395	350308.811932458	348834.952117832	347408.107331872	346026.063756071	344686.744386878	343388.198629484	342128.592827008	340906.201628447	339719.400110013	338566.656574245	337446.525959845	336357.643802673	335298.720694844	334268.537194685	333265.939145303	332289.833364021	331339.183668852	330413.007211663	329510.371090773	328630.389218450	327772.219421212	326935.060752996	326118.151003187	325320.764383217	324542.209376984	323781.826741714	323038.987647132	322313.091941898	321603.566537273	320909.863898873	320231.460638166	319567.856196110];
else
    maxS21_sim_asym = [0.203011856161082	0.297357072047642	0.346843126183347	0.370005647049934	0.384691697372465	0.392459832118568	0.394683654229554	0.396463499707549	0.399866466022260	0.397933493707517	0.401298792880904	0.400248112662306	0.401230242188549	0.401446771564366	0.400884820193442	0.400224480250526	0.399593221035982	0.398848441170566];
    Rpi_over_Li_array = [1074437.46476571	729801.572613780	589557.478928658	513634.410302946	466070.574435493	433486.829951715	409772.564156598	391741.601283803	377570.178768098	366139.245795024	356724.141535317	348834.952117832	342128.592827008	336357.643802673	331339.183668852	326935.060752996	323038.987647132	319567.856196110];
    maxS21_sim_sym = [0.163186560117824	0.282327038388954	0.355709301859455	0.393967964472896	0.414193405207022	0.425533112402070	0.432281823729520	0.436498934377765	0.439227944688156	0.441029550219668	0.442221686820108	0.442993325275760	0.443461407763561	0.443700818358742	0.443760901557005	0.443674949285178	0.443465853565670	0.443149587150973];
end

% Data from [maxS21_array] variable in Optimal_location.m
maxS21_meas_asym = [-11.4920700000000	-9.25409100000000	-8.53954900000000	-8.16615500000000	-8.03520000000000	-7.98380000000000	-7.96753900000000	-7.95596400000000	-7.97314300000000	-7.94539900000000	-7.92238600000000	-7.98494800000000	-8.03129600000000	-8.24061400000000	-8.59448600000000	-9.11270900000000	-9.89284300000000	-10.6529500000000];
maxS21_meas_sym = [-9.00471900000000	-6.23782000000000	-5.29292100000000	-4.88195400000000	-4.71066800000000	-4.63437200000000	-4.57989500000000	-4.57378600000000	-4.57796600000000	-4.52008900000000	-4.51839000000000	-4.55132400000000	-4.53138900000000	-4.64778500000000	-4.84805500000000	-5.20362700000000	-5.72001200000000	-6.24172400000000];

% figure
% yyaxis right
% plot(OD_array(2:end),atand(diff(maxS21_array)/max(diff(maxS21_array))),"LineWidth",3);
% % ylabel("Rate of Change of S21 in degree",'FontSize',12,'Color','black')
% ylabel("Rate of Change of S21 in degree",'FontSize',12)
% set(gca,'FontName','Times New Roman',"FontWeight","bold","Xlim",[30 150],"XTick",[30:10:150],'YColor','black');
% yyaxis left
% plot(OD_array(1:end),maxS21_array/max(maxS21_array),"LineWidth",3);
% % ylabel("Normalized S21 at the Optimal Location",'FontSize',12,'Color','black')
% ylabel("Normalized S21 at the Optimal Location",'FontSize',12)
% set(gca,'FontName','Times New Roman',"FontWeight","bold","Xlim",[30 150],"XTick",[30:10:150],'YColor','black');
% 
% xlabel('Outer Diameter of Intermediate Coils (mm)','FontSize',12,'Color','black');
% rectangle('Position',[50 0 20 1],'Curvature',0.2,'EdgeColor','none', 'FaceColor',[1 0 0 0.3])

% figure
% yyaxis left
% plot(OD_array,maxS21_sim_sym/max(maxS21_sim_sym),'b','LineWidth',3);
% hold on
% plot(30:10:200,10.^(maxS21_meas_sym/20)/max(10.^(maxS21_meas_sym/20)),'bx','LineWidth',3);
% hold on
% plot(OD_array,maxS21_sim_asym/max(maxS21_sim_asym),'Color','#0072BD','LineStyle','-','LineWidth',3);
% hold on
% plot(30:10:200,10.^(maxS21_meas_asym/20)/max(10.^(maxS21_meas_asym/20)),'Color','#0072BD','LineStyle','none','Marker','o','LineWidth',3);
% hold on
% plot(OD_array,Rpi_over_Li_array/max(Rpi_over_Li_array),'Color','#EDB120','LineStyle','--','Marker','none','LineWidth',3);
% hold off
% ylabel({'Normalized Lossy Term (R_{pi}/L_i)','Normalize S21 at the Optimal Location'},'FontSize',15,'Color','black');
% set(gca,'FontName','Times New Roman',"FontWeight","bold",'Ylim',[0 1.1],'YTick',[0:0.1:1.0],'YColor','black');
% 
% yyaxis right
% plot(OD_array(2:end),atand(diff(maxS21_sim_sym/max(maxS21_sim_sym))),'Color','#D95319','LineStyle','-',"LineWidth",3);
% hold on
% plot(40:10:200,atand(diff(10.^(maxS21_meas_sym/20)/max(10.^(maxS21_meas_sym/20)))),'Color','#D95319','LineStyle','none','Marker','v',"LineWidth",3);
% hold on
% plot(OD_array(2:end),atand(diff(maxS21_sim_asym/max(maxS21_sim_asym))),'r','LineStyle','-',"LineWidth",3);
% hold on
% plot(40:10:200,atand(diff(10.^(maxS21_meas_asym/20)/max(10.^(maxS21_meas_asym/20)))),'r^',"LineWidth",3);
% hold off
% ylabel("Rate of Change of S21 (degree)",'FontSize',15,'Color','black')
% set(gca,'FontName','Times New Roman',"FontWeight","bold",'Ylim',[-5 50],'YTick',[-5:5:45],'YColor','black');
% 
% set(gcf,'position',[504,212,1028,706]);
% xlabel('Outer Diameter of Intermediate Coils (mm)','FontSize',15,'Color','black');
% set(gca,'FontName','Times New Roman',"FontWeight","bold","Xlim",[40 150],"XTick",[40:10:150])
% legend('Simulation: S21 (Symmetric)','Measurement: S21 (Symmetric)',...
%     'Simulation: S21 (Asymmetric)','Measurement: S21 (Asymmetric)',...
%     'Normalized Lossy Term','Simulation: Rate of Change of S21 (Symmetric)','Measurement: Rate of Change of S21 (Symmetric)',...
%     'Simulation: Rate of Change of S21 (Asymmetric)','Measurement: Rate of Change of S21 (Asymmetric)',...
%     'FontSize',15)
% rectangle('Position',[55 -5 10 55],'Curvature',0.2,'EdgeColor','none', 'FaceColor',[1 0 0 0.3])

% figure
% subplot(2,1,1)
% yyaxis left
% plot(OD_array(1:end),maxS21_sim_asym/max(maxS21_sim_asym),"LineWidth",3);
% set(gca,'Ylim',[0 1.1],'YTick',[0:0.1:1.0])
% ylabel("Normalized S21 at the Optimal Location",'FontSize',12)
% yyaxis right
% % plot(OD_array(2:end),atand(diff(maxS21_sim_asym)/max(diff(maxS21_sim_asym))),"LineWidth",3);
% plot(OD_array(2:end),atand(diff(maxS21_sim_asym/max(maxS21_sim_asym))),"LineWidth",3);
% % set(gca,'Ylim',[-10 100],'YTick',[-10:10:90])
% ylabel("Rate of Change of S21 in degree",'FontSize',12)
% xlabel('Outer Diameter of Intermediate Coils (mm)','FontSize',12,'Color','black');
% set(gca,'FontName','Times New Roman',"FontWeight","bold","Xlim",[30 150],"XTick",[30:10:150]);
% 
% subplot(2,1,2)
% yyaxis left
% plot(OD_array(1:end),Rpi_over_Li_array/max(Rpi_over_Li_array),"LineWidth",3);
% set(gca,'Ylim',[0 1.1],'YTick',[0:0.1:1.0])
% ylabel("Normalized Lossy Term",'FontSize',12)
% yyaxis right
% plot(OD_array(2:end),atand(diff(Rpi_over_Li_array/max(Rpi_over_Li_array))),"LineWidth",3);
% % set(gca,'Ylim',[-10 100],'YTick',[-10:10:90])
% ylabel("Rate of Change of Lossy Term in degree",'FontSize',12)
% xlabel('Outer Diameter of Intermediate Coils (mm)','FontSize',12,'Color','black');
% set(gca,'FontName','Times New Roman',"FontWeight","bold","Xlim",[30 150],"XTick",[30:10:150]);

% figure
% yyaxis left
% plot(OD_array,maxS21_sim_sym/max(maxS21_sim_sym),'b','LineWidth',3);
% hold on
% plot(30:10:200,10.^(maxS21_meas_sym/20)/max(10.^(maxS21_meas_sym/20)),'bx','LineWidth',3);
% hold on
% plot(OD_array,maxS21_sim_asym/max(maxS21_sim_asym),'Color','#0072BD','LineStyle','-','LineWidth',3);
% hold on
% plot(30:10:200,10.^(maxS21_meas_asym/20)/max(10.^(maxS21_meas_asym/20)),'Color','#0072BD','LineStyle','none','Marker','o','LineWidth',3);
% hold on
% plot(OD_array,2*pi*13.56e6./Rpi_over_Li_array/max(2*pi*13.56e6./Rpi_over_Li_array),'Color','#EDB120','LineStyle','--','Marker','none','LineWidth',3);
% hold off
% ylabel({'Normalized Quality Factor','Normalized S21 at the Optimal Location'},'FontSize',15,'Color','black');
% set(gca,'FontName','Times New Roman',"FontWeight","bold",'Ylim',[0 1.1],'YTick',[0:0.1:1.0],'YColor','black');
% 
% yyaxis right
% plot(OD_array(2:end),atand(diff(maxS21_sim_sym/max(maxS21_sim_sym))),'Color','#D95319','LineStyle','-',"LineWidth",3);
% hold on
% plot(40:10:200,atand(diff(10.^(maxS21_meas_sym/20)/max(10.^(maxS21_meas_sym/20)))),'Color','#D95319','LineStyle','none','Marker','v',"LineWidth",3);
% hold on
% plot(OD_array(2:end),atand(diff(maxS21_sim_asym/max(maxS21_sim_asym))),'r','LineStyle','-',"LineWidth",3);
% hold on
% plot(40:10:200,atand(diff(10.^(maxS21_meas_asym/20)/max(10.^(maxS21_meas_asym/20)))),'r^',"LineWidth",3);
% hold on
% plot(40:10:200,atand(diff(2*pi*13.56e6./Rpi_over_Li_array/max(2*pi*13.56e6./Rpi_over_Li_array))),'m:','Marker','none',"LineWidth",3);
% hold off
% ylabel(["Rate of Change of S21 (degree)","Rate of Change of Quality Factor"],'FontSize',15,'Color','black')
% set(gca,'FontName','Times New Roman',"FontWeight","bold",'Ylim',[-5 50],'YTick',[-5:5:45],'YColor','black');
% 
% set(gcf,'position',[504,212,1028,706]);
% xlabel('Outer Diameter of Intermediate Coils (mm)','FontSize',15,'Color','black');
% set(gca,'FontName','Times New Roman',"FontWeight","bold","Xlim",[40 150],"XTick",[40:10:150])
% legend('Simulation: Normalized S21 (Symmetric)','Measurement: Normalized S21 (Symmetric)',...
%     'Simulation: Normalized S21 (Asymmetric)','Measurement: Normalized S21 (Asymmetric)',...
%     'Normalized Quality Factor','Simulation: Rate of Change of S21 (Symmetric)','Measurement: Rate of Change of S21 (Symmetric)',...
%     'Simulation: Rate of Change of S21 (Asymmetric)','Measurement: Rate of Change of S21 (Asymmetric)',...
%     'Rate of Change of Quality Factor','FontSize',15)
% rectangle('Position',[55 -5 10 55],'Curvature',0.2,'EdgeColor','none', 'FaceColor',[1 0 0 0.3])

figure
yyaxis left
sym_sim = plot(OD_array,maxS21_sim_sym/max(maxS21_sim_sym),'Color','#0000FF','LineStyle','-','Marker','none',"LineWidth",3);
hold on
annotation('textarrow',[0.43 0.34],[0.76 0.775],'String','IC OD = 62 mm (Symmetric)','Color','#0000FF','FontSize',12,'Linewidth',3,'FontName','Times New Roman',"FontWeight","bold")
% annotation('textarrow',[0.43 0.34],[0.76 0.775],'String','\textrm{\textbf{\boldmath$\hat{OD}_{ic}$ = 62 mm (Symmetric)}}','Color','#0000FF','Linewidth',3,'Interpreter','Latex','FontSize',12)
maxS21_index_sym = find(OD_array==62);
plot(OD_array(maxS21_index_sym),maxS21_sim_sym(maxS21_index_sym)/max(maxS21_sim_sym),'Marker','.','MarkerSize',25,'Color','#0000FF','LineStyle','none');
hold on
sym_meas = plot(30:10:200,10.^(maxS21_meas_sym/20)/max(10.^(maxS21_meas_sym/20)),'Color','#0072BD','LineStyle','none','Marker','o',"LineWidth",3);
hold on
asym_sim = plot(OD_array,maxS21_sim_asym/max(maxS21_sim_asym),'Color','#D95319','LineStyle','-','Marker','none',"LineWidth",3);
hold on
annotation('textarrow',[0.38 0.3],[0.72 0.77],'String','IC OD = 56 mm (Asymmetric)','Color','#D95319','FontSize',12,'Linewidth',3,'FontName','Times New Roman',"FontWeight","bold")
maxS21_index_asym = find(OD_array==56);
plot(OD_array(maxS21_index_asym),maxS21_sim_asym(maxS21_index_asym)/max(maxS21_sim_asym),'Marker','.','MarkerSize',25,'Color','#D95319','LineStyle','none');
hold on
asym_meas = plot(30:10:200,10.^(maxS21_meas_asym/20)/max(10.^(maxS21_meas_asym/20)),'Color','#EDB120','LineStyle','none','Marker','x',"LineWidth",3);
hold off
ylabel('Normalized S21^* along the Optimal Location','FontSize',12,'Color','black');
set(gca,'FontName','Times New Roman',"FontWeight","bold",'Ylim',[0 1.1],'YTick',[0:0.1:1.0],'YColor','black');

yyaxis right
quality_factor = plot(OD_array,(2*pi*13.56e6./Rpi_over_Li_array),'Color','#77AC30','LineStyle','-','Marker','none',"LineWidth",3);
ylabel('Quality Factor (Q_i)','FontSize',12,'Color','black');
set(gca,'FontName','Times New Roman',"FontWeight","bold",'Ylim',[0 350],'YTick',[0:50:300],'YColor','black');

xlabel('Outer Diameter of Intermediate Coils (mm)','FontSize',12,'Color','black');
set(gca,'FontName','Times New Roman',"FontWeight","bold","Xlim",[30 150],"XTick",[30:10:150])
legend([sym_sim,sym_meas,asym_sim,asym_meas,quality_factor],{'Simulation: Normalized S21^* (Symmetric)','Measurement: Normalized S21^* (Symmetric)',...
    'Simulation: Normalized S21^* (Asymmetric)','Measurement: Normalized S21^* (Asymmetric)',...
    'Simulation: Quality Factor (Q_i)'},'FontSize',11,'Location','southeast')




