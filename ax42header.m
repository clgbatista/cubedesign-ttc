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

function ax42_header = ax42header(et_call,et_ssid,sc_call,sc_ssid)
  SYNC_BYTE = hex2dec('2A');
  CALLSIGN_SIZE = 6;
  CONTROL = hex2dec('03');
  PID = hex2dec('F0');
  %
  for i=1:CALLSIGN_SIZE 
    aux_et(i) = double(et_call(i));
    aux_sc(i) = double(sc_call(i));
  end
  %
  ax42_header = [SYNC_BYTE aux_et et_ssid aux_sc sc_ssid CONTROL PID];
end