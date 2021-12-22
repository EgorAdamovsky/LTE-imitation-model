function DrawREM()

    global eNodeBS;
    global UE;
    global REM_gridSize;
    
    REM_grid = zeros(REM_gridSize);
    n = size(eNodeBS);
    n = n(2);
    for i = 1:REM_gridSize(1)
        for j = 1:REM_gridSize(2)
            for k = 1:n
                if (i == eNodeBS{k}.position(1) && j == eNodeBS{k}.position(2))
                    REM_grid(i, j) = 2;
                end
            end
        end
    end
    n = size(UE);
    n = n(2);
    for i = 1:REM_gridSize(1)
        for j = 1:REM_gridSize(2)
            for k = 1:n
                if (i == UE{1, k}.position(1) && j == UE{1, k}.position(2))
                    REM_grid(i, j) = -1;
                end
            end
        end
    end
    figure()
        imagesc(REM_grid)
        title('Карта REM')
        xlabel('x')
        ylabel('y')
        grid on
        colormap(gray)
        
end