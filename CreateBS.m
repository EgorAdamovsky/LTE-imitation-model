function eNodeBS = CreateBS(number, position, band)

    eNodeBS = struct;
    eNodeBS.name = "Station #" + num2str(number);
    eNodeBS.position = position;
    eNodeBS.NCellID = number;
    eNodeBS.freq_band = band; 
    eNodeBS.UE_RNTI = [];
    eNodeBS.UE_UL_RB = [];
    eNodeBS.UE_DL_RB = {};
    
end

