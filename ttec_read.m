%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright (C) 2020 - INPE - CubeDesign Virtual
% Carlos L GOMES BATISTA - LabV&VSiS
%
% Limited use for the CubeDesign Virtual
% Tracking, Telemetry and Commands Subsystem Challenge
%
% Date of creation: 14/09/2020
%
% Version: 1.0
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
%
%
clc
clear

et_callsign = 'CUBED0';
et_ssid = 0;
sc_callsign = 'CUBES1';
sc_ssid = 0;
%%
telecomands = table2array(readtable("telecomands.csv"));

for i=1:length(telecomands)
    disp(telecomands(i,:))
    ax42_header(i,:) = ax42header(et_callsign,et_ssid,sc_callsign,sc_ssid);
    cmd_codes = telecomands(i,1);
    cmd_subcodes = telecomands(i,2);
    parameter = telecomands(i,3);
    message = tcParameter(parameter);
    fcs = crc16(message);
    information(i,:) = [message fcs];
end

%%
% parameter = ["obc" "eps" "aocs" "payload" "beacon" "padding"];
% message = tcParameter(parameter);
% fcs = crc16(message);
% information = [message fcs];
% %%
% cmd_codes = ["request" "subsystem" "log"];
% cmd_subcodes = ["beacon" "platform" "payload" "log"];
data_packet = dataPacket(cmd_codes,cmd_subcodes,information);
% %%
% ax42_header = ax42header(et_callsign,et_ssid,sc_callsign,sc_ssid);
%%
space_packet = [ax42_header data_packet];

%% Saving the workspace
save telecomands.mat space_packet

