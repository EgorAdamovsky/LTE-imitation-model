function XY = RandomCoords()

    global REM_gridSize;

    X = randi(REM_gridSize(1));
    Y = randi(REM_gridSize(2));
    XY = [X Y];

end