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

function [flen fcode fsubcode fparam ffcs] = fault_inj(faulty)
    switch faulty
        case "length"
            flen = 1;
            fcode = 0;
            fsubcode = 0;
            fparam = 0;
            ffcs = 0;
        case "code"
            flen = 0;
            fcode = 1;
            fsubcode = 0;
            fparam = 0;
            ffcs = 0;
        case "subcode"
            flen = 0;
            fcode = 0;
            fsubcode = 1;
            fparam = 0;
            ffcs = 0;
        case "param"
            flen = 0;
            fcode = 0;
            fsubcode = 0;
            fparam = 255;
            ffcs = 0;
        case "fcs"
            flen = 0;
            fcode = 0;
            fsubcode = 0;
            fparam = 0;
            ffcs = 1;
        otherwise
            flen = 0;
            fcode = 0;
            fsubcode = 0;
            fparam = 0;
            ffcs = 0;
    end
end