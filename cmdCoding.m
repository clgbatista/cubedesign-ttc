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

function cmd_code = cmdCoding(code)
    if code == "request"
        cmd_code = 01;
    elseif code == "subsystem"
        cmd_code = 02;
    elseif code == "log"
        cmd_code = 04;
    else
        cmd_code = 255;
    end
end