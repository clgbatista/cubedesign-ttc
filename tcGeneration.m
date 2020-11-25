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

function tc_hex = tcGeneration(sc_callsign,sc_ssid,filename)

et_callsign = 'CUBED0';
et_ssid = 0;

    try
        telecomands = (table2array(readtable(filename)));
        disp('=====================================================')
        disp('Running Mathworks MATLab')
        disp('=====================================================')
    catch
        fileID = fopen(filename);
        aux = textscan(fileID,"%s,%s,%s,%s",'Delimiter',',');
        telecomands = [aux{1}(2:end) aux{2}(2:end) aux{3}(2:end) aux{4}(2:end)];
        disp('=====================================================')
        disp('Running on GNU Octave')
        disp('File:' filename)
        disp('=====================================================')
    end
    
    for i=1:length(telecomands)
        ax42_header(i,:) = ax42header(et_callsign,et_ssid,sc_callsign,sc_ssid);
        cmd_codes = cell2mat(telecomands(i,1));
        cmd_subcodes = cell2mat(telecomands(i,2));
        parameter = cell2mat(telecomands(i,3));
        faulty_frame = cell2mat(telecomands(i,4));
        [flen fcode fsubcode fparam ffcs] = fault_inj(faulty_frame);
        message = tcParameter(parameter);
%        [fcs, hex]= crc16(message);% crc16 must not inlcude only the param field
%        check = [hex2dec(hex(1,1:2))+ffcs hex2dec(hex(1,3:4))];
%        information(i,:) = [message+2*fparam check];
        information(i,:) = [message+2*fparam];
        data_packet(i,:) = dataPacket(cmd_codes,cmd_subcodes,information(i,:),flen,fcode,fsubcode,ffcs);
        space_packet(i,:) = [ax42_header(i,:) data_packet(i,:)];
    end
    
    tc_hex = space_packet;
    
%[rows,columns] = size(space_packet);
%
%    for i=1:rows
%        for j=1:columns
%%            tc_hex(i,j) = convertCharsToStrings(dec2hex(space_packet(i,j),2));
%            tc_hex(i,j) = dec2hex(space_packet(i,j));
%        end
%    end
end