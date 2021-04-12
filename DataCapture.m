function[scr]= DataCapture
    i=0;
    disp('Welcome');
    
    while i==0
        disp('Choose the document you want to export');
        [file,path] = uigetfile('*.txt');
        if isequal(file,0)
            disp('User selected cancel');
        else
            try
                scr=load(fullfile(path,file),'-ascii','omitnan'); 
                i=1;
            catch Exc
                disp("Invalid document");
            end
        end
    end
end 