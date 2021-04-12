i=true;
while i==true
    clc; 
    clear all;
    close all;
    [scr]= DataCapture;
    [fsn,t,rSignal]=Integrate(scr);
    [arfii,arfo]=Filtered(rSignal,fsn,t);
    option=(input('If you want to use the program again.Press 1'));
    str2double(option);
    if option==1
        i=true;
    else 
        i=false;
    end 
    
end 
