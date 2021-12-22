function  time_ = ChangeStatusUE(frame)

    global flag_gen_rem;
    global UE;
    
    tic
    for num_ue = 1:size(UE, 2)                          
        status = false;                                 
        a = find(UE{num_ue}.dataTransfer(:,1) >= frame,1);
        if ((isempty(a) == 0))                          
            if (a == 1) || (frame == UE{num_ue}.dataTransfer(a, 1))
                if (frame >= UE{num_ue}.dataTransfer(a, 1) && (frame <= (UE{num_ue}.dataTransfer(a,1) + (UE{num_ue}.dataTransfer(a, 2)))))
                    status = true;
                end
            else
                if (frame >= UE{num_ue}.dataTransfer(a-1, 1) && (frame <= (UE{num_ue}.dataTransfer(a-1,1) + (UE{num_ue}.dataTransfer(a-1, 2)))))
                    status = true;
                end               
            end
        end
        if (UE{num_ue}.status ~= status)
            UE{num_ue}.status = status;
            flag_gen_rem = true;
        end
    end
    time_ = toc;
    
end