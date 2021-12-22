function  time_ = MoveUE(time)

    global flag_move;
    global UE;
    
    tic;
    kol_eu = size(UE, 2);
    flag = false;
    for num_ue = 1:kol_eu                                       
        k = find(UE{num_ue}.trajectory(:,1) == time);             
        if (isempty(k) == 0)                                       
            UE{num_ue}.position = UE{num_ue}.trajectory(k, 2:3);	
            flag = true;
        end
    end
    flag_move = flag_move | (flag);
    time_ = toc;
    
end