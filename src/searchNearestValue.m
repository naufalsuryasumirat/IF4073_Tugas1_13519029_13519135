function index = searchNearestValue(value, list)
% SEARCHNEARESTVALUE
% Example:                  index = searchNearestValue(1.75, [1 2 4 5]);

    listSize = size(list, 2);
    index = 0;

    for i = 1:listSize
        if value > list(i)
            index = i;
        else
            break
        end
    end

    if index < listSize
        if index == 0
            index = 1;
        elseif list(index + 1) - value < value - list(index)
            index = index + 1;
        end
    end
end