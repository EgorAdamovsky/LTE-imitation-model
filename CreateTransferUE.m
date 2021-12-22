function CreateTransferUE(draw)

    global all_time;
    global number_UE;
    global REM_gridSize;
    global stepik;
    global UE;
    
    days = uint16(all_time / 8640000);                                 
    part_8h = 2880000;                                                
    part_12h = 2 * part_8h / 3;                                       
    part_24h = 3 * part_8h;                                             
    for i = 1:number_UE
        ta = stepik * randi([1 (part_12h / stepik)]);                    
        tb = stepik * randi([(ta / stepik) (part_24h / stepik)]);        
        tc = stepik * randi([1 (part_12h / stepik)]);                    
        td = stepik * randi([(tc / stepik) (part_24h / stepik)]);       
        scenario = ChoiseTransferScenario();                          
        for j = 1:days                                             
            UE{i}.dataTransfer{j} = CreateDayTransfer(scenario, i, j, ta, tb, tc, td);
        end
    end
    for i = 1:number_UE
        full_trans = [];
        for j = 1:days
            full_trans = [full_trans; UE{i}.dataTransfer{j}];
        end
        UE{i}.dataTransfer = full_trans;
    end
    if (draw)
        figure()
        for i = 1:number_UE
            subplot(10, 3, i)
            t = double(UE{i}.dataTransfer(:,1) / 8640000);
            d = double(UE{i}.dataTransfer(:,2) / 6000);
            stem(t, d, '.')
            title('Transfer: ' + UE{i}.name)
            xlabel('Время, дней')
            ylabel('T, мин')
            grid on
        end
    end
    
end