function[arfii,arfo]=Filtered(rSignal,fsn,t)
    %Make lowpass filter with cutoff frequency of 50Hz
    d1 = designfilt('lowpassiir','FilterOrder',4,'PassbandFrequency',50,'PassbandRipple',0.2,'SampleRate',fsn);
    iSignal=filter(d1,rSignal);
    
    fo=abs(fft(iSignal));
    fii=1/t:1/t:fsn;
    k=find(fii<50);
    
    figure
    subplot(2,1,1)
    plot(fii,fo);
    title('Filtered Signal');
    xlabel('Time');
    
    %Eliminate data above our cutoff frequency
    arfo=fo(1:length(k));
    arfii=fii(1:length(k));
    second=arfo;
        
    %Obteined fundamental frequency
    second(1)=[];
    k=find(second==max(second));
    fprintf('Cutoff frequency used:\n\t 50 Hz')
    fprintf('\n Fundamental frequency is:\n');
    disp(arfii(k+1));
  
    
    subplot(2,1,2)
    plot(arfii,arfo,'r','Marker','*','MarkerEdgeColor','b','MarkerIndices',(k+1));
    title('Fourier');
    xlabel('Time');
    
end
    