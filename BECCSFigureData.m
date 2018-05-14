function [OUT] = BECCSFigureData(varargin)
% Function that reads the AR5 database, stored in
% AR5Scen.mat and produces a summary of the relevant BECCS variables to be later plotted using the BECCS.fig

load AR5Scenarios; %AR5Scen [160023x25 table]
% [ 1 - MODEL | 2 - SCENARIO | 3 - REGION | 4 - VARIABLE | 5 - UNIT ...
% 6 - 2005
% 7 - 2010
% 8 - 2015 ... 15 - 2050 ... 25 - 2100 ]

runflag = true;
if nargin >=1
    runflag = varargin{1};
end

t2010 = 2010:10:2100;
time = t2010;
%List of variables to be extracted
LoVin = {'Primary Energy|Biomass','Primary Energy|Biomass|w/ CCS','Emissions|CO2','Price|Carbon','GDP|MER'};
%LoVout = {'Primary Biomass','BECCS','Emissions','Carbon Price','GDP','Cumulative Emissions','Carbon Market'};

%% Biomass 
BiomasswithNames = AR5Scen(AR5Scen.REGION == 'World' & AR5Scen.VARIABLE == LoVin{1},[1,2,4:25]); %EJ/yr
BiomasswithNames.Properties.VariableNames = {'MODEL' 'SCENARIO' 'VARIABLE' 'UNITS' 'Y2005' 'Y2010' 'Y2015' 'Y2020' 'Y2025' 'Y2030' 'Y2035' 'Y2040' ...
    'Y2045' 'Y2050' 'Y2055' 'Y2060' 'Y2065' 'Y2070' 'Y2075' 'Y2080' 'Y2085' 'Y2090' 'Y2095' 'Y2100'};
Biomassv0 = table2array(BiomasswithNames(:,24)); %EJ/yr
iaux = ~isnan(Biomassv0);
BiomasswithNames = BiomasswithNames(iaux,:);
BiomasswithNames = BiomasswithNames(:,[1:4,6:2:24]); %2010:10:2100

BECCSwithNames = AR5Scen(AR5Scen.REGION == 'World' & AR5Scen.VARIABLE == LoVin{2},[1,2,4:25]); %EJ/yr
BECCSwithNames.Properties.VariableNames = {'MODEL' 'SCENARIO' 'VARIABLE' 'UNITS' 'Y2005' 'Y2010' 'Y2015' 'Y2020' 'Y2025' 'Y2030' 'Y2035' 'Y2040' ...
    'Y2045' 'Y2050' 'Y2055' 'Y2060' 'Y2065' 'Y2070' 'Y2075' 'Y2080' 'Y2085' 'Y2090' 'Y2095' 'Y2100'};
BECCS0 = table2array(BECCSwithNames(:,24)); %EJ/yr
iaux = ~isnan(BECCS0);
BECCSwithNames = BECCSwithNames(iaux,:);
BECCSwithNames = BECCSwithNames(:,[1:4,6:2:24]); %2010:10:2100

%% List of all Emission, CPrice and GDP values in 2100 in AR5
Em2100withNames = AR5Scen(AR5Scen.REGION == 'World' & AR5Scen.VARIABLE == LoVin{3},[1,2,4:25]); %MtCO2
Em2100withNames.Properties.VariableNames = {'MODEL' 'SCENARIO' 'VARIABLE' 'UNITS' 'Y2005' 'Y2010' 'Y2015' 'Y2020' 'Y2025' 'Y2030' 'Y2035' 'Y2040' ...
    'Y2045' 'Y2050' 'Y2055' 'Y2060' 'Y2065' 'Y2070' 'Y2075' 'Y2080' 'Y2085' 'Y2090' 'Y2095' 'Y2100'};
Em2100v0 = table2array(Em2100withNames(:,24)); %MtCO2
iaux = ~isnan(Em2100v0);
Em2100withNames = Em2100withNames(iaux,:);
Em2100withNames = Em2100withNames(:,[1:4,6:2:24]); %2010:10:2100


CPricewithNames = AR5Scen(AR5Scen.REGION == 'World' & AR5Scen.VARIABLE == LoVin{4},[1,2,4:25]); %USD2005/tCO2
CPricewithNames.Properties.VariableNames = {'MODEL' 'SCENARIO' 'VARIABLE' 'UNITS' 'Y2005' 'Y2010' 'Y2015' 'Y2020' 'Y2025' 'Y2030' 'Y2035' 'Y2040' ...
    'Y2045' 'Y2050' 'Y2055' 'Y2060' 'Y2065' 'Y2070' 'Y2075' 'Y2080' 'Y2085' 'Y2090' 'Y2095' 'Y2100'};
CPricev0 = table2array(CPricewithNames(:,[6,24])); %2010 and 2100
iaux = ~isnan(CPricev0(:,2));
CPricewithNames = CPricewithNames(iaux,:); %selection 2100 ~=NaN
CP2010 = CPricev0(iaux,1);
CP2010(isnan(CP2010))=0;
CPricewithNames(:,6)=num2cell(CP2010);
CPricewithNames = CPricewithNames(:,[1:4,6:2:24]); %2010:10:2100

GDPwithNames = AR5Scen(AR5Scen.REGION == 'World' & AR5Scen.VARIABLE == LoVin{5},[1,2,4:25]); %USD2005 billion
GDPwithNames.Properties.VariableNames = {'MODEL' 'SCENARIO' 'VARIABLE' 'UNITS' 'Y2005' 'Y2010' 'Y2015' 'Y2020' 'Y2025' 'Y2030' 'Y2035' 'Y2040' ...
    'Y2045' 'Y2050' 'Y2055' 'Y2060' 'Y2065' 'Y2070' 'Y2075' 'Y2080' 'Y2085' 'Y2090' 'Y2095' 'Y2100'};
GDPv0 = table2array(GDPwithNames(:,24)); %USD2005 billion
iaux = ~isnan(GDPv0) & GDPv0~=0;
GDPwithNames = GDPwithNames(iaux,:);
GDPwithNames = GDPwithNames(:,[1:4,6:2:24]); %2010:10:2100


if runflag
    hwb = waitbar(0);
    iRow = 0;
    for i = 1:size(Em2100withNames,1)
        waitbar(i/size(Em2100withNames,1),hwb,['i = ' num2str(i)]);
        Model = Em2100withNames{i,1};
        Scenario = Em2100withNames{i,2};
        Emissionsi = Em2100withNames(i,:);
        CPricei = CPricewithNames(CPricewithNames.MODEL==Model & CPricewithNames.SCENARIO==Scenario ,:);
        GDPi = GDPwithNames(GDPwithNames.MODEL==Model & GDPwithNames.SCENARIO==Scenario ,:);
        Biomassi = BiomasswithNames(BiomasswithNames.MODEL==Model & BiomasswithNames.SCENARIO==Scenario ,:);
        BECCSi = BECCSwithNames(BECCSwithNames.MODEL==Model & BECCSwithNames.SCENARIO==Scenario ,:);
        if size(CPricei,1)>1 || size(GDPi,1)>1  || size(Biomassi,1)>1 || size(Emissionsi,1)>1 || size(BECCSi,1)>1 
                disp('Not unique Model-Scenario Combination');
        end
        if size(CPricei,1)<1 || size(GDPi,1)<1 || size(Biomassi,1)<1 || size(Emissionsi,1)<1 || size(BECCSi,1)<1 
                %disp('One variable missing in a scenario');
        else
            iRow = iRow + 1;
            Emissions(iRow,:) = table2array(Emissionsi(1,5:end))/1000;%GtCO2 %2010:10:2100
            Price(iRow,:) = table2array(CPricei(1,5:end));%USD/tCO2 %2010:10:2100
            GDP(iRow,:) = table2array(GDPi(1,5:end))/1000; %2010:10:2100 USD2005 trillion
            CumEm(iRow,:) = cumtrapz(t2010,Emissions(iRow,:)); %GtCO2
            CumEmissions20102050(iRow,1) = trapz(t2010(t2010<=2050),Emissions(iRow,t2010<=2050));
            Biomass(iRow,:) = table2array(Biomassi(1,5:end));%EJ/year %2010:10:2100
            CumBiomass(iRow,:) = cumtrapz(t2010,Biomass(iRow,:))/1000; %1000 EJ
            CumBiomass20502100(iRow,1) = trapz(t2010(t2010>=2050),Biomass(iRow,t2010>=2050))/1000; %1000 EJ
            %disp(['Biomass: ' num2str(CumBiomass20502100(iRow) - CumBiomass(iRow,end)+CumBiomass(iRow,t2010==2050))]);
            BECCS(iRow,:) = table2array(BECCSi(1,5:end));%EJ/year %2010:10:2100
            CumBECCS(iRow,:) = cumtrapz(t2010,BECCS(iRow,:))/1000; %1000 EJ
            CumBECCS20502100(iRow,1) = trapz(t2010(t2010>=2050),BECCS(iRow,t2010>=2050))/1000; %1000 EJ
            %disp(['BECCS: ' num2str(CumBECCS20502100(iRow) - CumBECCS(iRow,end)+CumBECCS(iRow,t2010==2050))]);

            Models(iRow,1) = cellstr(Model);
            Scenarios(iRow,1) = cellstr(Scenario);
            CarbonMarket(iRow,:) = Price(iRow,:).*Emissions(iRow,:)/1000; %Trillion USD2005
            CarbonMarketperGDP(iRow,:) = (Price(iRow,:).*Emissions(iRow,:))./(GDP(iRow,:)*1000); %
            CumCarbonMarket(iRow,:) = cumtrapz(t2010,Price(iRow,:).*Emissions(iRow,:))/1000; %trillion USD2005
            %if isnan(Price(iRow,end)) || isnan(Emissions(iRow,end))
            if CumEm(iRow,end)<1300
                Filter2degC(iRow,1) = true;
            else
                Filter2degC(iRow,1) = false;
            end
            Names(iRow,1)=cellstr(Model); %name of the model
            Names(iRow,2)=cellstr(Scenario); %name of the scenario            
        end
    end
    OUT.Emissions = Emissions(1:iRow,:);
    OUT.CumEm = CumEm(1:iRow,:);
    OUT.CumEmissions20102050 = CumEmissions20102050(1:iRow);
    OUT.Biomass = Biomass(1:iRow,:);
    OUT.CumBiomass = CumBiomass(1:iRow,:);
    OUT.CumBiomass20502100 = CumBiomass20502100(1:iRow);
    OUT.BECCS = BECCS(1:iRow,:);
    OUT.CumBECCS = CumBECCS(1:iRow,:);
    OUT.CumBECCS20502100 = CumBECCS20502100(1:iRow);
    OUT.GDP = GDP(1:iRow,:);
    OUT.Price = Price(1:iRow,:);
    OUT.CarbonMarket = CarbonMarket(1:iRow,:);
    OUT.CarbonMarketperGDP = CarbonMarketperGDP(1:iRow,:);
    OUT.CumCarbonMarket = CumCarbonMarket(1:iRow,:);
    OUT.iRow = iRow;
    OUT.time = time;
    OUT.Names = Names;
    OUT.Models = Models;
    OUT.Scenarios = Scenarios;
    OUT.Filter2degC = Filter2degC;
    
    %Especial variables requested by JF
   
    PDist2100_2deg = Price(Filter2degC,end); %Distribution of prices in 2100 
    % Distribution of emissions cutting the horizontal axis (emissions=0)
    aux = Emissions(Filter2degC,:);
    aux2 = interp1(time,aux',[2010:2100])';
    Years_of_Em_zero = sum(aux2<0,1);
    aux = circshift(Years_of_Em_zero,[0,1]);
    dist_Years_of_Em_zero = Years_of_Em_zero - circshift(Years_of_Em_zero,[0,1]);
    dist_Years_of_Em_zero(1) = 0;
    save('BECCSFigureData2.mat','OUT');
%     save('BECCSFigureData.mat','CarbonMarket','CumCarbonMarket','CarbonMarketperGDP',...
%         'Biomass','BiomassNoCCS','BECCS','CumBiomass','CumBiomassNoCCS','CumBECCS',...
%         'CumBiomass20502100','CumBiomassNoCCS20502100','CumBECCS20502100','CumEmissions20102050',...
%         'Price','Emissions','iRow','time','Names','CumEm','GDP','Filter2degC','PDist2100_2deg','Years_of_Em_zero','dist_Years_of_Em_zero');
    close(hwb);
else
    load('BECCSFigureData2.mat');
end

return;


%% plots
figure(1)
clf
set(gcf,'color','w');
subplot(2,1,1)
%bar(2010:2100,Years_of_Em_zero);
bar(2010:2100,dist_Years_of_Em_zero);
title('Distribution of emissions cutting the horizontal axis (emissions=0)','FontSize',titleFontSize/2,'FontWeight','bold');
ylabel('# of scenarios','FontSize',LabelFontSize/2,'FontWeight','bold');
xlabel('year','FontSize',LabelFontSize/2,'FontWeight','bold');

subplot(2,1,2)
h4 = histogram(CarbonMarket(:,end));
edges = [-100:100];
h5 = histogram(CarbonMarket(:,end),edges);
title('Carbon market in 2100 (2degC Scenarios)','FontSize',titleFontSize/2,'FontWeight','bold');
xlabel('Carbon price x Emissions [USD2005 trillion]','FontSize',LabelFontSize/2,'FontWeight','bold');
ylabel('# of scenarios','FontSize',LabelFontSize/2,'FontWeight','bold');

%% Carbon price
figure(2)
clf
set(gcf,'color','w');
%AR5 Plots
subplot(3,2,1)
plot(t2010, Price(selection,:)')
title('Price of carbon over time (2degC Scenarios)','FontSize',titleFontSize/2,'FontWeight','bold');
ylabel('Carbon Price [USD2005/tCO2]','FontSize',LabelFontSize/2,'FontWeight','bold');
xlabel('year','FontSize',LabelFontSize/2,'FontWeight','bold');
subplot(3,2,2)
h1 = histogram(Price(selection,end),100);
%h1 = histogram(Price(selection,end),100,'Normalization','probability');
title('Price of carbon in 2100 (2degC Scenarios)','FontSize',titleFontSize/2,'FontWeight','bold');
xlabel('Carbon Price [USD2005/tCO2]','FontSize',LabelFontSize/2,'FontWeight','bold');
ylabel('# of scenarios','FontSize',LabelFontSize/2,'FontWeight','bold');
% hold on;
% pd = fitdist(h1.Values','Normal');
% x_values = 0:250000;
% y = pdf(pd,x_values);
% plot(x_values,y,'LineWidth',2)

%% Emissions
subplot(3,2,3)
plot(t2010, Emissions(selection,:)')
title('Emissions over time (2degC Scenarios)','FontSize',titleFontSize/2,'FontWeight','bold');
ylabel('Emissions [GtCO2]','FontSize',LabelFontSize/2,'FontWeight','bold');
xlabel('year','FontSize',LabelFontSize/2,'FontWeight','bold');
subplot(3,2,4)
edges = [-25:15];
h2 = histogram(Emissions(selection,end),edges);
pivot = find(edges==0);
negValues = h2.Values((pivot-1):-1:1);
posValues = h2.Values(pivot:end);
negFraction = sum(negValues)/(sum(negValues)+sum(posValues));
% Info regarding number of negative scenarios
%disp(['Fraction of scenarios with negative emissions: ' num2str(negFraction*100) '% (' num2str(sum(negValues)) ...
%    ' scenarios)  of a total of ' num2str(sum(h2.Values)) ' scenarios']); 
title('Emissions in 2100 (2degC Scenarios)','FontSize',titleFontSize/2,'FontWeight','bold');
xlabel('Emissions [GtCO2]','FontSize',LabelFontSize/2,'FontWeight','bold');
ylabel('# of scenarios','FontSize',LabelFontSize/2,'FontWeight','bold');
%h2 = histogram(Emissions(selection,end),100,'Normalization','probability');
% hold on;
% pd = fitdist(h2.Values','Normal');
% x_values = -25:15;
% y = pdf(pd,x_values)/100;
% plot(x_values,y,'LineWidth',2)

%% Carbon market
subplot(3,2,5)
%plot(t2010, CarbonMarket'/1000000);
plot(t2010, CarbonMarket');
%ylabel('Carbon market [USD2005 trillion]','FontSize',LabelFontSize,'FontWeight','bold');
title('Carbon market over time (2degC Scenarios)','FontSize',titleFontSize/2,'FontWeight','bold');
ylabel('Carbon market [USD2005 trillion]','FontSize',LabelFontSize/2,'FontWeight','bold');
xlabel('year','FontSize',LabelFontSize/2,'FontWeight','bold');
ylim([-550,550]);
subplot(3,2,6)
%h3 = histogram(CarbonMarket(:,end)/1000000,100);
edges = [-100:100];
h3 = histogram(CarbonMarket(:,end),edges);
title('Carbon market in 2100 (2degC Scenarios)','FontSize',titleFontSize/2,'FontWeight','bold');
xlabel('Carbon price x Emissions [USD2005 trillion]','FontSize',LabelFontSize/2,'FontWeight','bold');
ylabel('# of scenarios','FontSize',LabelFontSize/2,'FontWeight','bold');



%% Emissions vs Biomass
figure(3)
clf
set(gcf,'color','w');
subplot(2,2,[1,3]);
scatter(CumBiomass20502100(),CumEmissions20102050());
lsline;
xlabel(LoVBio{1},'FontSize',LabelFontSize,'FontWeight','bold');
ylabel(LoVBio{2},'FontSize',LabelFontSize,'FontWeight','bold');
title('All scenarios','FontSize',titleFontSize,'FontWeight','bold');
subplot(2,2,[2,4]);
scatter(CumBiomass20502100(selection),CumEmissions20102050(selection));
lsline;
xlabel(LoVBio{1},'FontSize',LabelFontSize,'FontWeight','bold');
ylabel(LoVBio{2},'FontSize',LabelFontSize,'FontWeight','bold');
title('2degC scenarios','FontSize',titleFontSize,'FontWeight','bold');