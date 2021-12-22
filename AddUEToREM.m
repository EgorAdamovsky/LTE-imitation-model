function time_ = AddUEToREM(time)
    
    global eNodeBS;
    global UE;
    global original;
    global Freq_UL;
    
    tic
    kol_ue = size(UE, 2);
    nuli = int8(zeros(size(original, 1), size(original, 2)));
    for num_ue = 1:kol_ue
        UE{num_ue}.remSimp = nuli;
        if (size(UE{num_ue}.RB,2) == 0)
            continue
        end
        if (UE{num_ue}.status == true)
          RB = UE{num_ue}.RB;
        else
          RB = UE{num_ue}.RB(1);  
        end
        [~, txGrid, ~] = UE_signal(time, UE{num_ue}.RNTI, UE{num_ue}.NCellID, RB);
        a = abs(txGrid);
        buf = 2 * (a > 0.5 & a <= 1) + (3 * (a > 1));
        UE{num_ue}.remSimp(Freq_UL(UE{num_ue}.freq_band, 2):Freq_UL(UE{num_ue}.freq_band, 2) + 299, :) = buf;
    end
    time_ = toc;
   
end