function rec = CreateDayTransfer(scenario, who, day, ta, tb, tc, td)

    global UE;
    global all_time;
    global stepik;
    
    rec = double([]);                                                       
    offset = double((double(day) - 1) * 8640000);                          
    if (scenario == 'human')                                           
        if (UE{who}.work_days(day) == 1)                   
            time = double(0);                                      
            while (true)
                next_jump = stepik * randi([18 180]);                   
                time = time + next_jump;                              
                if (time > all_time)                                    
                    break;                                           
                end
                if (time >= ta && time <= tb)                           
                    dur = stepik * randi([1 17]);                     
                    new_rec = [offset + time dur];                     
                    rec = double([rec; new_rec]);                      
                end
            end
        end
        if (UE{who}.work_days(day) == 0)                               
            time = double(0);                                           
            while (true)
                next_jump = stepik * randi([180 720]);                
                time = time + next_jump;                                 
                if (time > all_time)                                    
                    break;                                           
                end
                if (time >= tc && time <= td)                           
                    dur = stepik * randi([1 17]);                     
                    new_rec = [offset + time dur];                    
                    rec = double([rec; new_rec]);                    
                end
            end
        end
    end

end