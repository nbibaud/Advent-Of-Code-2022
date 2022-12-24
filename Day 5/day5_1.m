% Import data:

fileID = fopen('input5.txt');
input = fscanf(fileID, '%c');
fclose(fileID);


% parse the boxes nicely :)

    % extract data for box stacks:
boxes = extractBefore(string(input)," 1   2");
    % Separate into lines:
boxes = string(splitlines(boxes));
    % 9x1 string array, each string representing order of boxes in row:
boxes = string(char(boxes)');
boxes = strtrim(boxes(2:4:size(boxes)));

% parse the instructions nicely :)

    % extract instructions data:
instructions = extractAfter(string(input),"move");
instructions = erase(instructions, ["move ", "from ", "to "]);
    % rearrange into numeric matrix of 3 columns:
instructions = char(splitlines(instructions));
instructions = str2num(instructions);


% rearrange boxes based on instructions:
for n = 1:size(instructions,1)

    move = instructions(n,1);
    from = instructions(n,2);
    to = instructions(n,3);

    fromStack = char(boxes(from));
    toStack = boxes(to);

    for m = 1:move
        toStack = strcat(string(fromStack(1)),toStack);
        fromStack = fromStack(2:end);
    end

    boxes(from) = string(fromStack);
    boxes(to) = string(toStack);

end

% Top crate of each stack:
boxes = char(boxes);
solution = (boxes(:,1))'    