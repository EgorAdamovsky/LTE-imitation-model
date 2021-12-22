function UE = CreateUE(number, position, band, RNTI, maxPower)

    UE = struct;
    UE.name = "Abonent #" + num2str(number);
    UE.position = position;
    UE.NCellID = 0;
    UE.freq_band = band; 
    UE.RNTI = RNTI;
    UE.maxPower = maxPower;
    UE.RB = [];
    UE.status = false;
    UE.trajectory = {};
    UE.base = {};
    UE.dataTransfer = [];
    UE.move_type = '';
    UE.work_days = [];
    
end