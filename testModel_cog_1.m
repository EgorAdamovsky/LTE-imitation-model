close all; clc; clear all;
warning('off');
DeleteAllFiles('zip');
DeleteAllFiles('h5');

global REM_gridstep;                                                  
global REM_gridSize;                                                 
global KOL_RB;                                                        
global Freq_DL;                                                       
global Freq_UL;                                                         
global original;                                                          
global UE;                                                                
global number_UE;                                                      
global eNodeBS;                                                        
global flag_gen_rem;                                                   
global flag_move;                                                      
global all_time;                                                       
global week;                                                            
global stepik;                                                       

name = 'Model_1';                                                      
CreateTime(30, 1);                                                      
stepik = 1000;                                                         
number_UE = 30;                                                            
UE = {};
eNodeBS = {};
KOL_RB = 25;
REM_gridstep = 250;
REM_gridSize = [20 20];
Freq_DL = [1820000, 1002; 1825010, 1336; 1830005, 1669];                        	
Freq_UL = [1720000, 1; 1725010, 335; 1730005, 668];                              	
[Freq_band, original] = CaclulateFrequencyBands(1720000, 1820000, 15);    
attenuation = CalculateAttenuation(Freq_band, true);                       

REM = CreateREM();                                                                                             	
CreateAllBS();                                                          
CreateAllUE_new(false, true);                                           
DrawREM();                                                                    

tStart = tic;                                                     
persent = 0;                                                            
for time = 0:stepik:all_time
    flag_move = false;
    t1 = MoveUE(time);          
    flag_gen_rem = false;
    if (flag_move == true)
        t2 = Reconn_simp();
    else
        t2 = 0;
    end
    t3 = ChangeStatusUE(time);	
    if (flag_gen_rem == true)  
            t4 = AddBSToREM(time);        
            t5 = AddUEToREM(time);
            [Simp_REM, t6] = GenerateSimpREM(true);
            [size_f, t7] = SaveSimpREM_HDF5(Simp_REM, time, name);
            Survey(time, t1, t2, t3, t4, t5, t6, t7, size_f);
            Report(time, tStart);
    end 
end
tEnd = toc(tStart);                                                 
disp(['Время моделирования: ' num2str(tEnd) ' сек'])                    