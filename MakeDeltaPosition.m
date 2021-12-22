function result = MakeDeltaPosition(trajectory, z)

    global REM_gridSize;

    while (1)
        delta = round((2 * rand(1)) - 1);                         
        prev = trajectory(size(trajectory, 1), z + 1);           
        if (prev + delta >= 1 && prev + delta <= REM_gridSize(z)) 	
            break;                                           
        end
    end
    result = prev + delta;
    
end