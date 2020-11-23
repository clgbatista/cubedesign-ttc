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

The commands and telemetries from this service works in order to request from the satellite the status of specific subsystems.

The subservices allow the request of platform (obc,eps and aocs), payload, and beacon (a summary) telemetries.

The 16-bit mask allows the selection between the different subsystems of the platform.

##### Commands

Code	|Subcode	|Length	|Parameter	| Info
--------|---------------|-------|---------------|------
0x01	|0x01		|0x0004	|16-bit mask*	| Request Platform Telemetry
0x01	|0x02		|0x0004	|16-bit mask*	| Request Payload Telemetry
0x01	|0x04		|0x0004	|16-bit mask*	| Request Beacon

###### 16-bit mask

mask		| subsystem
----------------|---------------------------
0x0000		| Beacon (only on subcode 0x04)
0x0001		| OBC (only on subcode 0x01)
0x0002		| EPS (only on subcode 0x01)
0x0004		| AOCS (only on subcode 0x01)
0x0008		| Payload (only on subcode 0x02)

##### Telemetries

Code	|Subcode	|Length	|Timestamp	| Data
--------|---------------|-------|---------------|------
0x01	|0x01		|0x000E	|4-byte UTC time| Platform Frame
0x01	|0x02		|0x000E	|4-byte UTC time| Payload Frame
0x01	|0x04		|0x000E	|4-byte UTC time| Beacon Frame

###### Platform Frame

>OBC

OBC State	| Error Counter	
----------------|-------------------
6B ASCII Char	| 4B Integer

>EPS

EPS State	| Battery Voltage (mV)
----------------|-------------------
6B ASCII Char	| 4B Integer

>AOCS

AOCS State	| Actuator State	
----------------|-------------------
6B ASCII Char	| 4B ASCII Char

###### Payload Frame

Payload On/Off	|Payload State 
----------------|-------------------------------------
3B ASCII Char	|7B ASCII Char


###### Beacon Frame

OBC State	| AOCS State	| Payload On/Off	|Padding
----------------|---------------|-----------------------|--------
3B ASCII Char	|3B ASCII Char	|3B ASCII Char		|Unused 1B

#### Power, code 0x02

This service allows the control of the power sourcing for the subsystems.

The bitmask only works for the payload condition, 0x0008.

##### Commands

Code	|Subcode	|Length	|Parameter	| Info
--------|---------------|-------|---------------|------
0x02	|0x01		|0x0004	|16-bit mask*	| Payload ON
0x02	|0x02		|0x0004	|16-bit mask*	| Payload OFF

##### Telemetries

N/A

#### Logging, code 0x04

This service allows the reception of event logs.

On this demand two information wil be provided by the spacecraft:
1. the last succesfully received command.
2. the reason of the last unsuccesfull received command.

##### Commands

Code	|Subcode	|Length	|Parameter1	|Parameter2	| Info
--------|---------------|-------|---------------|---------------|------------
0x04	|0x01		|0x0004	|8 random bits	|0x00		| Event Log

##### Telemetries

Code	|Subcode	|Length	|Timestamp	| Data
--------|---------------|-------|---------------|------
0x04	|0x01		|0x0024	|4-byte UTX time| 32B log event

###### Data

Last received Command	|Last Error on Reception
------------------------|--------------------------
16B ASCII Char		|16B ASCII Char

>**Last Received Command**:
>This telemetry field must return the last succesfull received command name.

>**Last Error on Reception**:
>This telemetry field must return the last unsuccesfull received command reason, due to heuristics. 
