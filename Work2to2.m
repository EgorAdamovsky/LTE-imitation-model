function my_work = Work2to2()

    global week;
    
    my_work = zeros(1, size(week, 2));                           
    first_day = randi(4);                                             
    for i = 1:length(my_work)
        if (first_day == 1 || first_day == 2)
            my_work(i) = 1;
        end
        if (first_day == 3 || first_day == 4)
            my_work(i) = 0;
        end
        first_day = first_day + 1;
        if (first_day == 5)
            first_day = 1;
        end
    end

end