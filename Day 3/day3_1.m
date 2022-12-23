% Import data:

fileID = fopen('input3.txt');
input = textscan(fileID, '%s');
input = char(input{1});
fclose(fileID);


% Split up into bag contents and compartments:

for n = 1:size(input,1)
    bagContents = strtrim(input(n,:));
    compSize = numel(bagContents)/2;
    comp1 = bagContents(1:compSize);
    comp2 = bagContents((compSize+1):numel(bagContents));

    % Find common items:

    commonItem = intersect(comp2,comp1);

    % Find prioity by converting to ascii code:

    ascii = double(commonItem);
    if ascii > 96 && ascii < 123
        priority(n) = ascii-96
    end
    if ascii > 64 && ascii < 91
        priority(n) = ascii-38
    end
end

% Sum priorities:

Solution = sum(priority)