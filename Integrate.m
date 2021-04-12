function [fsn,t,rSignal]=Integrate(scr)
    %Calculate time vector
    fs=25000;
    t=length(scr)/fs;
    t1=1/fs:1/fs:t;
    
    figure
    subplot(2,1,1)
    plot(t1,scr);
    title('Original Signal');
    xlabel('Time');
    
    factors=FACTS(length(scr));
    if length(factors)<4
        scr(1,:)=[];
        scr(length(scr),:)=[];
        factors=FACTS(length(scr));
    end 
    
    %Find integrals using trapezoid method
    rSignal=trapz(reshape(abs(scr),[factors(2,1),factors(2,2)]));
    fsn=length(rSignal)/t;
    t2=1/fsn:1/fsn:t;
    disp('Sampling rate used:');
    disp(fs);
    
    subplot(2,1,2)
    plot(t2,rSignal,'r');
    title('Integrated Signal');
    xlabel('Time');
end 
    