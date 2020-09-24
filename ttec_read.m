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
et_ssid = 0
sc_callsign = 'CUBES1';
sc_ssid = 0
%%
ax42_header = [];
ax42_header = ax42header(et_callsign,et_ssid,sc_callsign,sc_ssid);
%%
cmd_codes = [01 02 03];
cmd_subcodes = [01 02 03];
code = cmd_codes;
subcode = cmd_subcodes;
information = [hex2dec('DE') hex2dec('AD')];
info_length = length(information);
data_packet_header = [code(1) subcode(1) info_length];
data_packet = [data_packet_header information];
