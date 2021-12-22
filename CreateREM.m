function REM = CreateREM()

    global original;
    global REM_gridStep;
    global REM_gridSize;
    
    REM = struct;
    REM.gridStep = REM_gridStep;
    REM.gridSize = REM_gridSize;
    REM.grid{REM.gridSize(1), REM.gridSize(2)} = [];
    [REM.grid{:}] = deal(original);     
    
end