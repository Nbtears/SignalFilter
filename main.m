clc; 
clear all;
close all;
[scr]= DataCapture;
[fsn,t,rSignal]=Integrate(scr);
[arfii,arfo]=Filtered(rSignal,fsn,t);

