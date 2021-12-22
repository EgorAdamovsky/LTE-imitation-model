function [Full_REM, time_] = GenerateSimpREM(draw)

    global REM_gridSize;
    global eNodeBS;
    global UE;
    
    tic
    Full_REM{REM_gridSize(1), REM_gridSize(2)} = []; 
    kol = REM_gridSize(1) * REM_gridSize(2);
    parfor i = 1:kol
        x = fix((i - 1) / REM_gridSize(1)) + 1;
        y = mod((i - 1), REM_gridSize(2)) + 1;
        Full_REM{i} = REM_gen(x, y, eNodeBS, UE);  
    end 
    p = zeros(REM_gridSize(1), REM_gridSize(2));
    if (draw == true)
        for i = 1:size(Full_REM, 1)
            for j = 1:size(Full_REM, 2)
                temp = Full_REM{i, j};
                temp = max(temp');
                temp = find(temp == 0);
                p(i, j) = length(temp) / 2002;
            end
        end
        figure()
        imagesc(p')
        colormap(gray)
    end
    time_ = toc;
    
end