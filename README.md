# CUBE DESIGN VIRTUAL 2020

All rights reserved.

## Tracking, Telemetry and Command Subsystem

### How to use this repository

1. Download or clone this repository.

```
git clone https://github.com/clgbatista/cubedesign-ttc.git
```

2. Open the *ttec_read.m* file.

3. Change the variable *sc_callsign* to your respective Spacecraft Callsign.

4. Change the filename for the specific Flight Plan (.csv files) of your desire. *Default as telecomands.csv*

5. Run the *ttec_read.m* file to autogenerate the command frames.

### The Challenge

### List of Telemetries and Commands by Service

#### Requesting, code 0x01

##### Commands

Code	|Subcode	|Length	|Parameter	| Info
--------|---------------|-------|---------------|------
0x01	|0x01		|0x0004	|16-bit mask*	| Request Platform telemetry
0x01	|0x02		|0x0004	|16-bit mask*	| Request Payload Telemetry
0x01	|0x04		|0x0004	|16-bit mask*	| Request Beacon

##### Telemetries

Code	|Subcode	|Length	|Timestamp	| Data
--------|---------------|-------|---------------|------
0x01	|0x01		|0x000E	|4-byte UTC time| Platform Frame
0x01	|0x02		|0x000E	|4-byte UTC time| Payload Frame
0x01	|0x04		|0x000E	|4-byte UTC time| Beacon Frame

###### Platform Frame

OBC State	| AOCS State	| Battery Voltage (mV)
----------------|---------------|----------------------
3B ASCII Char	|3B ASCII Char	|4B Integer

###### Payload Frame

Payload On/Off	|Payload State 
----------------|-------------------------------------
3B ASCII Char	|7B ASCII Char


###### Beacon Frame

OBC State	| AOCS State	| Payload On/Off	|Padding
----------------|---------------|-----------------------|--------
3B ASCII Char	|3B ASCII Char	|3B ASCII Char		|Unused 1B

#### Power, code 0x02

Code	|Subcode	|Length	|Parameter	| Info
--------|---------------|-------|---------------|------
0x02	|0x01		|0x0004	|16-bit mask*	| Payload ON
0x02	|0x02		|0x0004	|16-bit mask*	| Payload OFF

#### Logging, code 0x04

Code	|Subcode	|Length	|Parameter	| Info
--------|---------------|-------|---------------|------
0x04	|0x01		|0x0004	|16 random bits	| Payload ON

Code	|Subcode	|Length	|Timestamp	| Data
--------|---------------|-------|---------------|------
0x04	|0x01		|0x0024	|4-byte UTX time| 32B log event
