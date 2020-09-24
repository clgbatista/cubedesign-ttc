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

clc
clear

et_callsign = 'CUBED0';
et_ssid = 0;
sc_callsign = 'CUBES1';
sc_ssid = 0;
%%
message = [hex2dec('DE') hex2dec('AD')];
fcs = crc16(message);
information = [message fcs];
%%
cmd_codes = [01 02 03];
cmd_subcodes = [01 02 03];
data_packet = dataPacket(cmd_codes(1),cmd_subcodes(1),information);
%%
ax42_header = ax42header(et_callsign,et_ssid,sc_callsign,sc_ssid);
%%
space_packet = [ax42_header data_packet]
