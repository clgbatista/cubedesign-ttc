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

function tc_parameter = tcParameter(parameter)
    bitmask = 0;
    rng(0); % random seed
    switch parameter
        case "obc"
            bitmask = [0 1];
        case "eps"
            bitmask = [0 2];
        case "aocs"
            bitmask = [0 4];
        case "payload"
            bitmask = [0 8];
        case "beacon"
            bitmask = [0 0];
        case "padding"
            bitmask  = randi(255,1,2);
    end
    tc_parameter = bitmask;
end