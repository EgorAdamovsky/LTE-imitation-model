function time_ = Reconn_simp()

    global UE;
    global eNodeBS;
    global flag_gen_rem;
    
    tic
    kol_ue = size(UE, 2);               
    for num_ue = 1:kol_ue                   
        out = near_base(num_ue);             
        switch out
            case -1
                disconnect_ue(num_ue, UE{num_ue}.NCellID);
                flag_gen_rem = true;
            case 0
                continue
            otherwise
                disconnect_ue(num_ue, UE{num_ue}.NCellID);
                connect_ue(num_ue, eNodeBS{out}.NCellID);       
                flag_gen_rem = true;
        end
    end
    time_ = toc;
    
end