function Report(time, tStart)

    global all_time;

    persent = (time / all_time) * 100;
    ost = 100 - persent;
    disp('====')
    disp(['Моделирование: ' num2str(persent) '% | ' num2str(uint64(toc(tStart))) ' сек | ' num2str(time) ' кадр.'])
    disp(['Прогноз оставшегося времени: ~' num2str(ost * toc(tStart) / persent / 3600) ' ч'])
    disp('====')
    disp(' ')
    
end