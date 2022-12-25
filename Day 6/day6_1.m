% Import data:

fileID = fopen('input6.txt');
input = fscanf(fileID, '%c');
fclose(fileID);

% Scan along data stream and stop after marker appears:
n = 0;
marker = 0;
while marker == 0
    n = n+1;
    characters = input(n:n+3);
    if length(characters) == length(unique(characters))
        marker = 1;
    end
end

% Find solution:
solution = n+3