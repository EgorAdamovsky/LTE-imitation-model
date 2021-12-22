function rec = CreateDayMove(scenario, who, day, ta, tb)

    global UE;
    global all_time;
    global stepik;
    
    rec = double([]);                                                       
    offset = double((double(day) - 1) * 8640000);                           
    if (scenario == 'courier')                                              
        start_pos = double(UE{who}.position);
        start_rec = [offset start_pos(1) start_pos(2)];
    	rec(1, :) = start_rec;                                              
        if (UE{who}.work_days(day) == 1)                                    
            time = double(0);                                               
            while (true)
                next_jump = stepik * randi([30 120]);                     	
                time = time + next_jump;                                 	
                if (time > all_time)                                      	
                    break;                                               	
                end
                if (time >= ta && time <= tb)                             	
                    x = MakeDeltaPosition(rec, 1);                        	
                    y = MakeDeltaPosition(rec, 2);                        	
                    new_rec = [offset + time x y];                        	
                    rec = double([rec; new_rec]);                         	
                end
            end
        end
    end

end