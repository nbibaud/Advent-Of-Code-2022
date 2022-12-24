% Import data:

fileID = fopen('input5.txt');
input = fscanf(fileID, '%c');
input = string(input);
fclose(fileID);


% parse the boxes nicely :)

    % cut after boxes:
boxes = split(input," 1   2");
    % Separate into lines:
boxes = string(splitlines(boxes{1}));
    % 9x1 string array, each string representing order of boxes in row:
boxes = string(char(boxes)');
boxes = strtrim(boxes(2:4:size(boxes)));