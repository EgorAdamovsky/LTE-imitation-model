function CreateMoveUE(draw)

    global all_time;
    global number_UE;
    global REM_gridSize;
    global stepik;
    global UE;

    days = uint16(all_time / 8640000);                                
    part_8h = 2880000;                                                
    part_12h = 3 * part_8h / 2;                                     
    part_24h = 3 * part_8h;                                           
    for i = 1:number_UE
        UE{i} = CreateUE(i, RandomCoords(), 0, i, 23);                  
        ta = stepik * randi([0 (part_12h / stepik)]);                     
        tb = stepik * randi([(ta / stepik) (part_24h / stepik)]);       
        scenario = ChoiseMoveScenario();                               
        if (scenario == 'courier')                                       
            UE{i}.work_days = Work2to2();                               
            UE{i}.move_type = 'courier';                              
        end
        for j = 1:days                                                 
            UE{i}.trajectory{j} = CreateDayMove(scenario, i, j, ta, tb);
        end
    end
    for i = 1:number_UE
        full_move = [];
        for j = 1:days
            full_move = [full_move; UE{i}.trajectory{j}];
        end
        UE{i}.trajectory = full_move;
    end
    if (draw)
        figure()
        for i = 1:number_UE
            subplot(3, 10, i)
            plot3(UE{i}.trajectory(:, 2), UE{i}.trajectory(:, 3), UE{i}.trajectory(:, 1) / 100 / 3600 / 24, '.')
            axis([1 REM_gridSize(1) 1 REM_gridSize(2) 0 days])
            title('Move: ' + UE{i}.name)
            xlabel('X, cell')
            ylabel('Y, cell')
            zlabel('Время, дней')
            view(0, 0)
            grid on
        end
    end

end