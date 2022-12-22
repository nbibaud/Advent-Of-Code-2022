% Import data:

fileID = fopen('input2-1.txt');
input = textscan(fileID, '%c');
fclose(fileID);
input = cell2mat(input);

player1 = string(input(1:2:end));
player2 = string(input(2:2:end));

% Calculate round score:

match = append(player1,player2);

matches = ["AX" "AY" "AZ"; "BX" "BY" "BZ"; "CX" "CY" "CZ"];
matchScore = [0 3 6; 0 3 6; 0 3 6];
shapeScore = [3 1 2; 1 2 3; 2 3 1];

for n = 1:numel(match)
    i = find(matches==match(n));
    roundPoints(n) = matchScore(i) + shapeScore(i);
end

solution = sum(roundPoints)