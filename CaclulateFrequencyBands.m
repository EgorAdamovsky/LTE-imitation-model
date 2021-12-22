function [Freq_band, original] = CaclulateFrequencyBands(down, up, step)

    low = down;                             
    high = up;                              
    Freq_band = int32(zeros(1, 2002));      
    j = 1;                                  
    for i = low:step:low + 5000 * 3         
        Freq_band(j) = i;                   
        j = j + 1;                          
    end
    for i = high:step:high + 5000 * 3       
        Freq_band(j) = i;                   
        j = j + 1;                          
    end
    original(j - 1, 140) = 0;             
    original = single(complex(original));
    
end