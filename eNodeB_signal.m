function [signal, txGrid, rmc_out] = eNodeB_signal(time, NCellID, RB)

    rmc = lteRMCDL('R.6'); 
    rmc.NCellID = NCellID;  
    rmc.TotSubframes = 10;     
    rmc.PDSCH.RNTI = 61;        
    rmc.NFrame = time;        
    if (isempty(RB))
      RB = 0;
    end
    rmc.PDSCH.PRBSet = RB;
    rmc.NDLRB = 25;
    [signal, txGrid, rmc_out] = lteRMCDLTool(rmc,[1;0;0;1]);
    
end