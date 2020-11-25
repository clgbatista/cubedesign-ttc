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

function data_packet = dataPacket(code,subcode,information,flen,fcode,fsubcode)
    cmd_code = cmdCoding(code);
    cmd_subcode = cmdSubcoding(subcode);
    info_length = length(information)+flen;
    data_packet_header = [cmd_code<<fcode cmd_subcode<<fsubcode 0 info_length];
    data_packet = [data_packet_header information];
end
