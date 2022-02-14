clc, clear all, close all
LMfilename = 'VNADataSymmetric5050\Samed2i-DifferentOD\LinearMagnitude\LMd2i75OD100.txt';
SCfilename = 'VNADataSymmetric5050\Samed2i-DifferentOD\SmithChart\SCd2i75OD100.txt';
%LMfilename = 'VNADataSymmetric5050\SameOD-Differentd2i\LinearMagnitude\LMOD140d2i145.txt';
%SCfilename = 'VNADataSymmetric5050\SameOD-Differentd2i\SmithChart\SCOD140d2i145.txt';
%% Linear Magnitude (LM)
close all
LMfile = importdata(LMfilename);
LMfrequency = str2double(LMfile.textdata(7:end,1)); LinearMagnitude = LMfile.data();
F13p56index = find(LMfrequency == 13.56e6); [BestS21, BestS21index] = max(LinearMagnitude);
%figure
plot(LMfrequency,LinearMagnitude);
hold on
plot(LMfrequency(F13p56index),LinearMagnitude(F13p56index),'r.','MarkerSize',14);
hold on
plot(LMfrequency(BestS21index),LinearMagnitude(BestS21index),'.','MarkerFaceColor','#D95319','MarkerSize',14);
hold off
xlabel('Frequency (MHz)'); ylabel('S21 Linear Magnitude');
set(gca,'YLim',[0 0.7],'FontSize',12);
annotation('textbox',[0.52 0.5 0.37 0.12],'String',{['OriginalFreq = ',num2str(LMfrequency(F13p56index))];...
    ['S21 = ',num2str(LinearMagnitude(F13p56index))]},'Color','r','FontSize',12);
annotation('textbox',[0.52 0.3 0.37 0.12],'String',{['BestS21Freq = ',num2str(LMfrequency(BestS21index))];...
    ['BestS21 = ',num2str(LinearMagnitude(BestS21index))]},'Color','#D95319','FontSize',12);
%% Smith Chart (SC)
close all
SCfile = importdata(SCfilename);
SCfrequency = SCfile.data(:,1); realData = SCfile.data(:,2); imagData = SCfile.data(:,3);
S21 = realData+1j*imagData;
smithplot(SCfrequency,S21,'Marker','.');
hold on
smithplot(SCfrequency(F13p56index),realData(F13p56index)+1j*imagData(F13p56index),'Marker','.','MarkerSize',14);
hold on
smithplot(SCfrequency(BestS21index),realData(BestS21index)+1j*imagData(BestS21index),'Marker','.','MarkerSize',14);
hold off