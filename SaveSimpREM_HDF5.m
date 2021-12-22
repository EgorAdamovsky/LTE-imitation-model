function [size_f, time_] = SaveSimpREM_HDF5(Simp_REM, time, name_)

    global eNodeBS;
    global number_UE;

    tic
    name = ['REM_' name_ '_time_' num2str(time)];                       
    Simp_REM = uint8([Simp_REM{:}]);                                     
    report_UE = GenerateReportAboutUE();                                 
    report_BS = GenerateReportAboutBS();                                   
    h5create([name '.h5'], '/REM', size(Simp_REM), 'Datatype', 'uint8');  
    h5write([name '.h5'], '/REM', Simp_REM);                              
    h5writeatt([name '.h5'], '/REM', 'frame', time);                      
    h5create([name '.h5'], '/BS/name', size(eNodeBS), 'Datatype', 'string');                
    h5create([name '.h5'], '/BS/position', size(report_BS.position), 'Datatype', 'uint8');
    h5create([name '.h5'], '/BS/NCellID', size(eNodeBS), 'Datatype', 'uint8');           
    h5create([name '.h5'], '/BS/freq_band', size(eNodeBS), 'Datatype', 'uint8');          
    h5create([name '.h5'], '/BS/UE_RNTI', size(report_BS.UE_RNTI), 'Datatype', 'uint8');	
    h5create([name '.h5'], '/BS/UE_UL_RB', size(report_BS.UE_UL_RB), 'Datatype', 'uint8');	
    h5create([name '.h5'], '/BS/UE_DL_RB', size(report_BS.UE_DL_RB), 'Datatype', 'uint8');	
    h5write([name '.h5'], '/BS/name', report_BS.name);                                   
    h5write([name '.h5'], '/BS/position', report_BS.position);                           
    h5write([name '.h5'], '/BS/NCellID', report_BS.NCellID);                             
    h5write([name '.h5'], '/BS/freq_band', report_BS.freq_band);                        
    h5write([name '.h5'], '/BS/UE_RNTI', report_BS.UE_RNTI);                            
    h5write([name '.h5'], '/BS/UE_UL_RB', report_BS.UE_UL_RB);                         
    h5write([name '.h5'], '/BS/UE_DL_RB', report_BS.UE_DL_RB);                          
    h5create([name '.h5'], '/UE/name', number_UE, 'Datatype', 'string');         
    h5create([name '.h5'], '/UE/position', [2 number_UE], 'Datatype', 'uint8');   
    h5create([name '.h5'], '/UE/NCellID', number_UE, 'Datatype', 'uint8');       
    h5create([name '.h5'], '/UE/freq_band', number_UE, 'Datatype', 'uint8');    
    h5create([name '.h5'], '/UE/RNTI', number_UE, 'Datatype', 'uint8');         
    h5create([name '.h5'], '/UE/maxPower', number_UE, 'Datatype', 'single');      
    h5create([name '.h5'], '/UE/RB', size(report_UE.RB), 'Datatype', 'uint8');  
    h5create([name '.h5'], '/UE/status', number_UE, 'Datatype', 'uint8');         
    h5create([name '.h5'], '/UE/base', size(report_UE.base), 'Datatype', 'uint8');	
    h5write([name '.h5'], '/UE/name', report_UE.name);                            
    h5write([name '.h5'], '/UE/position', report_UE.position);                  
    h5write([name '.h5'], '/UE/NCellID', report_UE.NCellID);                   
    h5write([name '.h5'], '/UE/freq_band', report_UE.freq_band);                 
    h5write([name '.h5'], '/UE/RNTI', report_UE.RNTI);                         
    h5write([name '.h5'], '/UE/maxPower', report_UE.maxPower);                
    h5write([name '.h5'], '/UE/RB', report_UE.RB);                            
    h5write([name '.h5'], '/UE/status', report_UE.status);                      
    h5write([name '.h5'], '/UE/base', report_UE.base);                        
    zip(name, [name '.h5']);                                              
    delete([name '.h5']);
    info = dir([name '.zip']);                                     
    size_f = info.bytes / 1024 / 1024;                               
    time_ = toc;                                                         
    
end