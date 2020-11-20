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

function cmd_subcode = cmdSubcoding(subcode)
    if subcode == 'beacon'
        cmd_subcode = 04;
    elseif subcode == 'platform'
        cmd_subcode = 01;
    elseif subcode == 'payload'
        cmd_subcode = 02;
    elseif subcode == 'on'
        cmd_subcode = 01;
    elseif subcode == 'off'
        cmd_subcode = 02;
    elseif subcode == 'log'
        cmd_subcode = 01;
    else
        cmd_subcode = 255;
    end
end