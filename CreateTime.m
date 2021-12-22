function CreateTime(days, day_of_week)

    global all_time;
    global week;
    
    all_time = days * 8640000;                                    
    week = zeros(2, days);                                        
    for i = 1:days 
        if (day_of_week == 8)
            day_of_week = 1;
        end
        week(1, i) = day_of_week;
        if (day_of_week >= 6)
            week(2, i) = 0;
        else
            week(2, i) = 1;
        end
        day_of_week = day_of_week + 1;
    end
    
end