function rem_simp = REM_gen(r_x, r_y,eNodeBS,UE)

    eNodeBS_max = size(eNodeBS, 2);                 	
    UE_max = size(UE, 2);                           
    rem(2002, 140) = int8(0);
    F(2002, 140) = int8(0);                        
    kol = eNodeBS_max + UE_max;
    for i = 1:kol                                    
         if (i <= eNodeBS_max)                      
              x = eNodeBS{i}.position(2);             
              y = eNodeBS{i}.position(1);             
              buf = eNodeBS{i}.remSimp;                
         else                                        	
              x = UE{i - eNodeBS_max}.position(2);  
              y = UE{i - eNodeBS_max}.position(1);  
              buf = UE{i - eNodeBS_max}.remSimp;     
         end
         dist = 250 * (((x - r_x)^2 + (y - r_y)^2)^0.5);
         if (dist > 1500)
             buf = F;
         elseif (dist > 1250)
            buf = int8(buf > 0);
         end
         rem = max(rem,buf);
    end 
    rem_simp = rem;
    
end