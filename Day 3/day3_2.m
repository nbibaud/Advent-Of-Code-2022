% Import data:

fileID = fopen('input3.txt');
input = textscan(fileID, '%s');
input = char(input{1});
fclose(fileID);


% Split up into bag contents and compartments:

for n = 1:3:size(input,1)
    bagContents1 = strtrim(input(n,:));
    bagContents2 = strtrim(input(n+1,:));
    bagContents3 = strtrim(input(n+2,:));

    % Find common items:

    commonItem = intersect(intersect(bagContents1,bagContents2),bagContents3);

    % Find prioity by converting to ascii code:

    ascii = double(commonItem);
    if ascii > 96 && ascii < 123
        priority((n+2)/3) = ascii-96
    end
    if ascii > 64 && ascii < 91
        priority((n+2)/3) = ascii-38
    end
end

% Sum priorities:

Solution = sum(priority)