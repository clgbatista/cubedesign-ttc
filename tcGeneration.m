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

function space_packet = tcGeneration(sc_callsign,sc_ssid,filename)

et_callsign = 'CUBED0';
et_ssid = 0;

telecomands = (table2array(readtable(filename)));

    for i=1:length(telecomands)
        ax42_header(i,:) = ax42header(et_callsign,et_ssid,sc_callsign,sc_ssid);
        cmd_codes = cell2mat(telecomands(i,1));
        cmd_subcodes = cell2mat(telecomands(i,2));
        parameter = cell2mat(telecomands(i,3));
        message = tcParameter(parameter);
        [fcs hex]= crc16(message);
        check = [hex2dec(hex(1,1:2)) hex2dec(hex(1,3:4))]
        information(i,:) = [message check];
        data_packet(i,:) = dataPacket(cmd_codes,cmd_subcodes,information(i,:));
        space_packet(i,:) = [ax42_header(i,:) data_packet(i,:)];
    end
end