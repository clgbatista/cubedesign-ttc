%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
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

function [crc, hex] = crc16(packet)
% Calculates CRC16/XModem for packet
% Input: byte content in an array
% Ref: https://en.wikipedia.org/wiki/Computation_of_cyclic_redundancy_checks 
% Usage: crc16( [49 50] ) - ASCII for 1 and 2
% Validation: dec2hex( crc16( double('123456789') ) ) compare the result at
% https://www.lammertbies.nl/comm/info/crc-calculation
% J. Chen. Feb, 2020
% crc = 0;
crc = hex2dec('FFFF');   % for 0xFFFF version
%%
for i = 1:length(packet)
    crc = bitxor( crc, bitshift(packet(i),8) );
    for bit = 1:8
        if bitand( crc, hex2dec('8000') )     % if MSB=1
          crc = bitxor( bitshift(crc,1), hex2dec('1021') );
        else
          crc = bitshift(crc,1);
        end
        crc = bitand( crc, hex2dec('ffff') );  % trim to 16 bits
    end
end
hex = dec2hex(crc);
end