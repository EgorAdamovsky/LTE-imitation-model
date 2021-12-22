function DeleteAllFiles(what)

    files = dir(['*.' what]);
    for i = 1:length(files)
    	delete(files(i).name);
    end
    
end