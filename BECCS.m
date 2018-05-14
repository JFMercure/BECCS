function varargout = BECCS(varargin)
% BECCS MATLAB code for BECCS.fig
%      BECCS, by itself, creates a new BECCS or raises the existing
%      singleton*.
%
%      H = BECCS returns the handle to a new BECCS or the handle to
%      the existing singleton*.
%
%      BECCS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BECCS.M with the given input arguments.
%
%      BECCS('Property','Value',...) creates a new BECCS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BECCS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BECCS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BECCS

% Last Modified by GUIDE v2.5 11-Apr-2018 19:16:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BECCS_OpeningFcn, ...
                   'gui_OutputFcn',  @BECCS_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before BECCS is made visible.
function BECCS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BECCS (see VARARGIN)

% Choose default command line output for BECCS
handles.output = hObject;
load('BECCSFigureData2.mat');
% save('BECCSFigureData.mat','CarbonMarket','CumCarbonMarket','CarbonMarketperGDP',...
%         'Biomass','BiomassNoCCS','BECCS','CumBiomass','CumBiomassNoCCS','CumBECCS',...
%         'CumBiomass20502100','CumBiomassNoCCS20502100','CumBECCS20502100','CumEmissions20102050',...
%         'Price','Emissions','iRow','time','Names','CumEm','GDP','Filter2degC','PDist2100_2deg','Years_of_Em_zero','dist_Years_of_Em_zero');
i=1;
handles.VarXY(i).Data = OUT.time;
handles.VarXY(i).Name = 'Time';
handles.VarXY(i).Units = '[Years]';
handles.VarXY(i).Dim = length(OUT.time);
handles.LoV{i} = 'Time';
handles.LoVUnit{i} = '[Years]';
handles.Type{i} = 'time';
i=i+1;
handles.VarXY(i).Data = OUT.CumBiomass20502100;
handles.VarXY(i).Name = 'Cum. Biomass 2050-2100';
handles.VarXY(i).Units = '[1000 EJ]';
handles.VarXY(i).Dim = length(OUT.CumBiomass20502100);
handles.LoV{i} = 'Cum. Biomass 2050-2100';
handles.LoVUnit{i} ='[1000 EJ]';
handles.Type{i} = 'model-scenario array';
i=i+1;
handles.VarXY(i).Data = OUT.CumBECCS20502100;
handles.VarXY(i).Name = 'Cum. BECCS 2050-2100';
handles.VarXY(i).Units = '[1000 EJ]';
handles.VarXY(i).Dim = length(OUT.CumBECCS20502100);
handles.LoV{i} = 'Cum. BECCS 2050-2100';
handles.LoVUnit{i} = '[1000 EJ]';
handles.Type{i} = 'model-scenario array';
i=i+1;
handles.VarXY(i).Data = OUT.CumEmissions20102050;
handles.VarXY(i).Name = 'Cum Emissions 2010-2050';
handles.VarXY(i).Units = '[GtCO2]';
handles.VarXY(i).Dim = length(OUT.CumEmissions20102050);
handles.LoV{i} = 'Cum Emissions 2010-2050';
handles.LoVUnit{i} = '[GtCO2]';
handles.Type{i} = 'model-scenario array'; 
handles.iThreshold = i;
%i=5;
i=i+1;
handles.VarXY(i).Data = OUT.Biomass;
handles.VarXY(i).Name = 'Biomass';
handles.VarXY(i).Units = '[EJ/year]';
handles.VarXY(i).Dim = length(OUT.Biomass);
handles.LoV{i} = 'Biomass';
handles.LoVUnit{i} = '[EJ/year]';
handles.Type{i} = 'multiple timeseries';
i=i+1;
handles.VarXY(i).Data = OUT.BECCS;
handles.VarXY(i).Name = 'Primary Biomass w/CCS';
handles.VarXY(i).Units = '[EJ/year]';
handles.VarXY(i).Dim = length(OUT.BECCS);
handles.LoV{i} = 'Primary Biomass w/CCS';
handles.LoVUnit{i} = '[EJ/year]';
handles.Type{i} = 'multiple timeseries';
i=i+1;
handles.VarXY(i).Data = OUT.CumBiomass;
handles.VarXY(i).Name = 'Cum. Biomass';
handles.VarXY(i).Units = '[%1000 EJ]';
handles.VarXY(i).Dim = length(OUT.CumBiomass);
handles.LoV{i} = 'Cum. Biomass';
handles.LoVUnit{i} = '[%1000 EJ]';
handles.Type{i} = 'multiple timeseries';
i=i+1;
handles.VarXY(i).Data = OUT.CumBECCS;
handles.VarXY(i).Name = 'Cum Biomass w/CCS';
handles.VarXY(i).Units = '[%1000 EJ]';
handles.VarXY(i).Dim = length(OUT.CumBECCS);
handles.LoV{i} = 'Cum Biomass w/CCS';
handles.LoVUnit{i} = '[%1000 EJ]';
handles.Type{i} = 'multiple timeseries';
i=i+1;
handles.VarXY(i).Data = OUT.Emissions;
handles.VarXY(i).Name = 'Emissions';
handles.VarXY(i).Units = '[GtCO2/yr]';
handles.VarXY(i).Dim = length(OUT.Emissions);
handles.LoV{i} = 'Emissions';
handles.LoVUnit{i} = '[GtCO2/yr]';
handles.Type{i} = 'multiple timeseries';
i=i+1;
handles.VarXY(i).Data = OUT.CumEm;
handles.VarXY(i).Name = 'Cum Emissions';
handles.VarXY(i).Units = '[GtCO2]';
handles.VarXY(i).Dim = length(OUT.CumEm);
handles.LoV{i} = 'Cum Emissions';
handles.LoVUnit{i} ='[GtCO2]';
handles.Type{i} = 'multiple timeseries';
i=i+1;
handles.VarXY(i).Data = OUT.Price;
handles.VarXY(i).Name = 'Carbon Price';
handles.VarXY(i).Units = '[USD/tCO2]';
handles.VarXY(i).Dim = length(OUT.Price);
handles.LoV{i} = 'Carbon Price';
handles.LoVUnit{i} = '[USD/tCO2]';
handles.Type{i} = 'multiple timeseries';
i=i+1;
handles.VarXY(i).Data = OUT.CarbonMarket;
handles.VarXY(i).Name = 'Carbon Market';
handles.VarXY(i).Units = '[Trillion USD /yr]';
handles.VarXY(i).Dim = length(OUT.CarbonMarket);
handles.LoV{i} = 'Carbon Market';
handles.LoVUnit{i} = '[Trillion USD /yr]';
handles.Type{i} = 'multiple timeseries';
i=i+1;
handles.VarXY(i).Data = OUT.CumCarbonMarket;
handles.VarXY(i).Name = 'Cum Carbon Market';
handles.VarXY(i).Units = '[Trillion USD]';
handles.VarXY(i).Dim = length(OUT.CumCarbonMarket);
handles.LoV{i} = 'Cum Carbon Market';
handles.LoVUnit{i} = '[Trillion USD]';
handles.Type{i} = 'multiple timeseries';
i=i+1;
handles.VarXY(i).Data = OUT.CarbonMarketperGDP;
handles.VarXY(i).Name = 'Carbon Market per GDP';
handles.VarXY(i).Units = '[%]';
handles.VarXY(i).Dim = length(OUT.CarbonMarketperGDP);
handles.LoV{i} = 'Carbon Market per GDP';
handles.LoVUnit{i} = '[%]';
handles.Type{i} = 'multiple timeseries';

%% The variables above have been arranged to be inserted in the order:
%   1: time
%   2 - handles.iThreshold:  'model-scenario array'
%   handles.iThreshold: - end: 'multiple timeseries';
%
% The possible X-Y pairs are:
% X = 'time' ; Y = 'multiple timeseries'; (time series plot) 
% X = 'model-scenario array' ; Y = 'model-scenario array' (scattered plot)
% X = 'model-scenario array' ; Y = hystogram (histogram)
%
% Therefore, depending the value chosen in X, different values of Y are available
% The variables 'multiple timeseries' are not available for X
% Two cases for Y
%Case 1:  If X==1 (time), then Y must be 'multiple timeseries'
handles.Ya = ones(1,i);
handles.Ya(1:handles.iThreshold) = 0; %Y cannot be time or 'model-scenario array'
%Case 2:  If X==2:handles.iThreshold ('model-scenario array'), then Y must also be 'model-scenario array'
handles.Yb = ones(1,i);
handles.Yb(handles.iThreshold+1:end) = 0; %Y cannot be 'multiple timeseries'
handles.Yb(1) = 0; %Y cannot be time

%% Insert the names in the VarX and VarY listboxes
insertXYNames(hObject,handles);

%Names of Models and Scenarios
handles.Names = OUT.Names;
handles.Models = OUT.Models;
handles.Scenarios = OUT.Scenarios;
handles.Filter2degC = OUT.Filter2degC;

%% Unique Models and Scenarios
handles.uniModels = unique(handles.Models);
aux{1} = 'All';
aux(2:length(handles.uniModels)+1,1) = handles.uniModels;
set(handles.ModelsList,'String',aux);
handles.uniScen= unique(handles.Scenarios);
aux2{1} = 'All';
aux2(2:length(handles.uniScen)+1,1) = handles.uniScen;
set(handles.ScenList,'String',aux2);
set(handles.ModelsList,'Value',1);
set(handles.ScenList,'Value',1);
set(handles.textModels,'String',['Models: ' num2str(length(handles.uniModels))]);
set(handles.textScen,'String',['Scenarios: ' num2str(length(handles.uniScen))]);
%% Filter
%The filter criteria are: All (no filter), 2degC, Model and Scenario
set(handles.Filter2degCMenu,'String',{'All','below 2degC','above 2degC'});
set(handles.Filter2degCMenu,'Value',1);
%% Colour
% The colour criteri are: none, 2degC, Model and Scenario
set(handles.ColourMenu,'String',{'none','2degC','Model'});
set(handles.ColourMenu,'Value',1);

% Update handles structure
guidata(hObject, handles);

function out = cellfind(stringS, cellArray)
f = @(string)(@(cell_contents)(strcmp(string,cell_contents)));
out = cellfun(f(stringS),cellArray);

function insertXYNames(hObject,handles)
%For X, the possible variables go from 1 (time) to all the 'model-scenario array'
set(handles.Xlbox,'String',handles.LoV(1:handles.iThreshold));
set(handles.Xlbox,'Value',1); %by default, X = time
%For Y, given that X is time, it can only be 'multiple timeseries' (Ya)
set(handles.Ylbox,'String',handles.LoV(handles.Ya==1));
set(handles.Ylbox,'Value',1); %by default, Y=1
%We search for which variable is Y (from the complete list)
YList = get(handles.Ylbox,'String'); %==handles.LoV(handles.Ya==1)
Yvariable = YList{1};
Yi = find(cellfind(Yvariable, handles.LoV)); %This is the variable selected in Y
set(handles.nPoints,'String',num2str(length(handles.VarXY(Yi).Data))); 
guidata(hObject, handles);

function Filter2degCMenu_Callback(hObject, eventdata, handles)
iMenu = get(hObject,'Value');
aux = get(hObject,'String'); %{'All','below 2degC','above 2degC'}
item = aux{iMenu};
switch item
    case 'All'
        uniModels = unique(handles.Models);
        uniScen= unique(handles.Scenarios);
    case 'below 2degC'
        uniModels = unique(handles.Models(handles.Filter2degC));
        uniScen= unique(handles.Scenarios(handles.Filter2degC));
    case 'above 2degC'
        uniModels = unique(handles.Models(~handles.Filter2degC));
        uniScen= unique(handles.Scenarios(~handles.Filter2degC));    
end
%filter the data
aux{1} = 'All';
aux(2:length(uniModels)+1,1) = uniModels;
set(handles.ModelsList,'String',aux);
aux2{1} = 'All';
aux2(2:length(uniScen)+1,1) = uniScen;
set(handles.ScenList,'String',aux2);
set(handles.textModels,'String',['Models: ' num2str(length(uniModels))]);
set(handles.textScen,'String',['Scenarios: ' num2str(length(uniScen))]);
set(handles.ModelsList,'Value',1);
set(handles.ScenList,'Value',1);
%         if max(get(handles.ModelsList,'Value'))>length(uniModels)+1
%             set(handles.ModelsList,'Value',1);
%         end
%         if max(get(handles.ScenList,'Value'))>length(uniScen)+1
%             set(handles.ScenList,'Value',1);
%         end


function ModelsList_Callback(hObject, eventdata, handles)
i=get(hObject,'Value');
if i(1)==1
    set(handles.textModels,'String',['Models: ' num2str(length(handles.uniModels))]);
else
    set(handles.textModels,'String',['Models: ' num2str(length(i))]);
end

function ScenList_Callback(hObject, eventdata, handles)
i=get(hObject,'Value');
if i(1)==1
    set(handles.textScen,'String',['Scenarios: ' num2str(length(handles.uniScen))]);
else
    set(handles.textScen,'String',['Scenarios: ' num2str(length(i))]);
end


function Xlbox_Callback(hObject, eventdata, handles)
%For X, the possible variables go from 1 (time) to all the 'model-scenario array' (6 in total)
Xi = get(hObject,'Value');
XList = get(handles.Xlbox,'String');
Xstr = XList{Xi};
Xtype = handles.Type{Xi};
%In the case of Y, because the list of variables change, we need to look for the name in the Ylbox, and then search for the variable index
Yi0 = get(handles.Ylbox,'Value'); %the value before updating the Gui
switch Xtype
    case 'time' 
        %In this case, the Y variables has to be multiple time series
        set(handles.Ylbox,'String',handles.LoV(handles.Ya==1));
        if Yi0 >= length(handles.LoV(handles.Ya==1))
            Yi0 = 1;
            set(handles.Ylbox,'Value',Yi0); %by default, Y=1
        end
        %To update the Nr of categories, we must search for which variable is Y (from the complete list)
        YList = get(handles.Ylbox,'String'); %==handles.LoV(handles.Ya==1)
        Yvariable = YList{Yi0};
        Yi = find(cellfind(Yvariable, handles.LoV)); %This is the variable selected in Y
        set(handles.nPoints,'String',num2str(length(handles.VarXY(Yi).Data)));
        %Update the type of plot
        set(handles.TypeOfPlotMenu,'Value',1);
    case 'model-scenario array'
        %In this case, the Y variables has to be model-scenario array as well
        set(handles.Ylbox,'String',handles.LoV(handles.Yb==1));
        if Yi0 >= length(handles.LoV(handles.Yb==1))
            Yi0 = 1;
            set(handles.Ylbox,'Value',Yi0); %by default, Y=1
        end
        %To update the Nr of categories, we must search for which variable is Y (from the complete list)
        YList = get(handles.Ylbox,'String'); %==handles.LoV(handles.Ya==1)
        Yvariable = YList{Yi0};
        Yi = find(cellfind(Yvariable, handles.LoV)); %This is the variable selected in Y
        set(handles.nPoints,'String',num2str(length(handles.VarXY(Yi).Data)));     
        %Update the type of plot
        set(handles.TypeOfPlotMenu,'Value',2);
    otherwise %'multiple timeseries'
        error('Problem with the variable X');
end

function Ylbox_Callback(hObject, eventdata, handles)
%In the case of Y, because the list of variables change, we need to look for the name in the Ylbox, and then search for the variable index
Yi0 = get(hObject,'Value'); %the value before updating the Gui
YList = get(hObject,'String'); %==handles.LoV(handles.Ya==1)
Yvariable = YList{Yi0};
Yi = find(cellfind(Yvariable, handles.LoV)); %This is the variable selected in Y
set(handles.nPoints,'String',num2str(length(handles.VarXY(Yi).Data)));


% --- Outputs from this function are returned to the command line.
function varargout = BECCS_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


%% ------------- PLOT ------------- %%
function PlotButton_Callback(hObject, eventdata, handles)

LineWidth_plot = 1;
FontSize_title = 30;
FontSize_title_sp = 20;
FontSize_label = 16;
FontSize_tick = 8;
FontWeight_tick = 'bold';
FontSize_legend = 8;
Location_legend = 'southeast';
FontSize_text = 8;
Col = [[0 0 1]; [0 .5 0]; [0 0 0]; [.3 .3 .3]; [.6 .6 .6]; [.8 .8 .8]; [1 .3 1]; [.6 .3 1]; [1 0 0]; [.7 0 0]; [1 .5 .5]; [1 .8 .8]];
Col = [Col; [1 1 0]; [1 1 .4]; [.3 .3 1]; [.6 .6 1]; [0 1 0]; [.3 1 .3]; [1 .8 0]; [1 .6 0]; [.8 .5 .3]; [.3 .5 .8]; [1 0 1]; [1 .5 1]; [0 0 .5]; [0 .2 0]; [.2 0 0]; [.5 .5 0];];
Col = cat(1,Col,Col);
%%  Figure preparation: the figure number
aux =  str2double(get(handles.figureEdit,'String'));
if ~isnan(aux) && aux == round(aux)
    figure(aux);
else
    figure(1);
end
clf
set(gcf,'color','w');

%% Data to plot
Xi = get(handles.Xlbox,'Value');
XData0 = handles.VarXY(Xi).Data;
XUnits = handles.VarXY(Xi).Units;
XList = get(handles.Xlbox,'String');
Xstr = XList{Xi};
% Xtype = handles.Type{Xi};

Yi0 = get(handles.Ylbox,'Value'); %the value before updating the Gui
YList = get(handles.Ylbox,'String'); %==handles.LoV(handles.Ya==1)
Ystr = YList{Yi0};
Yvariable = YList{Yi0};
Yi = find(cellfind(Yvariable, handles.LoV)); %This is the variable selected in Y
YData0 = handles.VarXY(Yi).Data;
YUnits = handles.VarXY(Yi).Units;

%% Filters
[index, filter2, outM, outS] = indexModelScen(handles);
filter2 = filter2 & handles.Filter2degC;


TypeOfPlot = get(handles.TypeOfPlotMenu,'Value');
switch TypeOfPlot
    case 1 % timeseries
        XData = XData0; %time
        %YData = YData0(repmat(index,1,size(YData0,2)));
        YData = YData0(index,:);
        % ColourFilter
        switch get(handles.ColourMenu,'Value')
            case 1%all
                plot(XData,YData,'LineWidth',LineWidth_plot);
            case 2%2degC
                alpha1 = 0.6;
                alpha2 = 0.1;
                YY = YData(filter2(index),:);
                for i=1:size(YY,1)
                    pp = plot(XData,YY(i,:),'LineWidth',LineWidth_plot,'Color',[1 0 0]);
                    pp.Color(4) = alpha1;
                    hold on;
                end
                YY = YData(~filter2(index),:);
                for i=1:size(YY,1)
                    pp = plot(XData,YY(i,:),'LineWidth',LineWidth_plot,'Color',[0 0 1]);
                    pp.Color(4) = alpha2;
                    hold on;
                end
                hold off;
            case 3%model
                alpha = 0.5;
                for i=1:max(outM(index))
                    YY = YData(outM(index)==i,:);
                    for j=1:size(YY,1)
                        pp = plot(XData,YY(j,:),'LineWidth',LineWidth_plot,'Color',Col(i,:));
                        pp.Color(4) = alpha;
                        hold on;
                    end
                end
                hold off;
        end
        %plot(XData,YData,'LineWidth',LineWidth_plot);
        titleStr = Ystr;
        title(titleStr,'FontSize',FontSize_title,'FontWeight','bold');
        ylabel(YUnits,'FontSize',FontSize_label,'FontWeight','bold');
        xlabel(XUnits,'FontSize',FontSize_label,'FontWeight','bold');
    case 2 % model-scenario scatter
        XData = XData0(index); %time
        YData = YData0(index);
        %% Regression
        fit = Regression(handles, XData, YData, index);
        subplot(1,2,1);
        switch get(handles.ColourMenu,'Value')
            case 1%all
                scatter(XData,YData);
            case 2%2degC
                scatter(XData(filter2(index)),YData(filter2(index)),'CData',[1 0 0]);
                hold on;
                scatter(XData(~filter2(index)),YData(~filter2(index)),'CData',[0 0 1]);
            case 3%model
                alpha = 1;
                for i=1:max(outM(index))
                    YY = YData(outM(index)==i,:);
                    XX = XData(outM(index)==i,:);
                    for j=1:size(YY,1)
                        pp = scatter(XX(j),YY(j),'CData',Col(i,:));
                        hold on;
                        set(pp,'MarkerFaceAlpha',alpha);
                    end
                end
        end
        %scatter(XData,YData);
        hold on;
        plot(fit.fit1);
        hold off;
        titleStr = [Ystr ' vs ' Xstr];
        title(titleStr,'FontSize',FontSize_title_sp,'FontWeight','bold');
        ylabel([Ystr ' ' YUnits],'FontSize',FontSize_label,'FontWeight','bold');
        xlabel([Xstr ' ' XUnits],'FontSize',FontSize_label,'FontWeight','bold');
        
        subplot(1,2,2);
        scatter(YData,fitted(fit.fit4));
        text(min(YData)+0.7*(max(YData)-min(YData)),min(YData)+0.2*(max(YData)-min(YData)),char(fit.fit4.Formula));
        text(min(YData)+0.7*(max(YData)-min(YData)),min(YData)+0.1*(max(YData)-min(YData)),['R2 Adjusted: ' num2str(fit.fit4.Rsquared.Adjusted)]);
        line([min(YData),max(YData)],[min(YData),max(YData)]);
        title(' Linear Mixed Model (Fix+Rand Effects): Fit vs Data','FontSize',FontSize_title_sp,'FontWeight','bold');
        xlabel(['Data: ' Ystr YUnits],'FontSize',FontSize_label,'FontWeight','bold');
        ylabel(['Fitted: ' Ystr YUnits],'FontSize',FontSize_label,'FontWeight','bold');
end



function fit = Regression(handles, XData, YData, index)
%Function that calculates the regression
%index has the filter for Models and Scenarios
M = handles.Models(index);
S = handles.Scenarios(index);
regTable = table(YData,XData,M,S);
regTable.M = categorical(regTable.M);
regTable.S = categorical(regTable.S);
fit1 = fitlm(XData,YData);
disp(['fit 1: ' char(fit1.Formula)]); disp('R2'); disp(fit1.Rsquared)
fit.fit1 = fit1;
%fit2 = fitlme(regTable,'YData~XData+(1|M)+(XData|M)');
%disp(['fit 2: ' char(fit2.Formula)]); disp('R2'); disp(fit2.Rsquared)
%fit.fit2 = fit2;
%fit3 = fitlme(regTable,'YData~XData+(1|S)+(XData|S)');
%disp(['fit 3: ' char(fit3.Formula)]); disp('R2'); disp(fit3.Rsquared)
%fit.fit3 = fit3;
fit4 = fitlme(regTable,'YData~XData+(1|M)+(1|S)');
disp(['fit 4: ' char(fit4.Formula)]); disp('R2'); disp(fit4.Rsquared)
fit.fit4 = fit4; 
%fit5 = fitlme(regTable,'YData~XData+(1|M)+(1|S)+(XData|M)+(XData|S)');
%disp(['fit 5: ' char(fit5.Formula)]); disp('R2'); disp(fit4.Rsquared)
%fit.fit5 = fit5; 

    
function [filter2MS, filter2, outM, outS] = indexModelScen(handles)
%Function that calculates an index array, according to the Models and Scenarios chosen
%filter2MS is tru for all the model/scenarios available
%filter2 is true for the scenarios below 2degC
%outM has a number for each model available (1..n)
%outS has a number for each scenario available (1..n)
iModelsFilter = get(handles.ModelsList,'Value');
iScenFilter = get(handles.ScenList,'Value');
auxM = get(handles.ModelsList,'String');
Models = auxM(iModelsFilter);
auxS = get(handles.ScenList,'String');
Scens = auxS(iScenFilter);
iFilter = get(handles.Filter2degCMenu,'Value');
filter2 = true(size(handles.Filter2degC));
switch iFilter
    case 1% 'All'
    case 2% 'below 2degC'
        filter2 = handles.Filter2degC;
    case 3
        filter2 = ~handles.Filter2degC;
end
if iModelsFilter(1)==1 & iScenFilter(1)==1
    filterM = true(size(filter2));
    filterS = true(size(filter2));
    filter2MS = filter2;
    outM = zeros(size(filterM));
    outS = zeros(size(filterS));
    for i=2:length(auxM) %starts from 2, because the first is all and it is selected
        outM(cellfind(auxM(i), handles.Models))=i-1;
    end
    for i=2:length(auxS) %starts from 2, because the first is all and it is selected
        outS(cellfind(auxS(i), handles.Scenarios))=i-1;
    end
elseif iModelsFilter(1)==1 %All Models, a group of scenarios
    filterM = true(size(filter2));
    filterS = false(size(filter2));
    outS = zeros(size(filterS));
    outM = zeros(size(filterM));
    for i=1:length(iScenFilter)
        filterS = filterS | cellfind(Scens(i), handles.Scenarios);
        outS(cellfind(Scens(i), handles.Scenarios))=i;
    end
    filter2MS = filter2 & filterS;
    for i=2:length(auxM) %starts from 2, because the first is all and it is selected
        outM(cellfind(auxM(i), handles.Models))=i-1;
    end
elseif iScenFilter(1)==1 %All Scenarios, a group of models
    filterS = true(size(filter2));
    filterM = false(size(filter2));
    outM = zeros(size(filterM));
    outS = zeros(size(filterS));
    for i=1:length(iModelsFilter)
        filterM = filterM | cellfind(Models(i), handles.Models);
        outM(cellfind(Models(i), handles.Models))=i;
    end
    filter2MS = filter2 & filterM;
    for i=2:length(auxS) %starts from 2, because the first is all and it is selected
        outS(cellfind(auxS(i), handles.Scenarios))=i-1;
    end
else
    filterM = false(size(filter2));
    filterS = false(size(filter2));
    outM = zeros(size(filterM));
    outS = zeros(size(filterS));
    for i=1:length(iScenFilter)
        filterS = filterS | cellfind(Scens(i), handles.Scenarios);
        outS(cellfind(Scens(i), handles.Scenarios))=i;
    end
    for i=1:length(iModelsFilter)
        filterM = filterM | cellfind(Models(i), handles.Models);
        outM(cellfind(Models(i), handles.Models))=i;
    end
    filter2MS = filter2 & filterM & filterS;
end
%filterABC = logical(filterABC);
set(handles.nPoints,'String',num2str(sum(filter2MS)));


function Xlbox_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Ylbox_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TypeOfPlotMenu_Callback(hObject, eventdata, handles)

function TypeOfPlotMenu_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Filter2degCMenu_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ColourMenu_Callback(hObject, eventdata, handles)

function ColourMenu_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function figureEdit_Callback(hObject, eventdata, handles)


function figureEdit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function figure1_CreateFcn(hObject, eventdata, handles)

function ModelsList_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ScenList_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
