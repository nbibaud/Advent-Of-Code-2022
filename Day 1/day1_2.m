% Load puzzle input with blank lines as 0:

fileID = fopen('input1-1.txt');
input = textscan(fileID, '%d', 'Delimiter','\n');
fclose(fileID);
input = cell2mat(input);

% Sum each clump of values before a blank line:

m = 1;
sums(m) = 0;

for n = 1:numel(input)
    if input(n) > 0
        currentSum = sums(m);
        sums(m) = currentSum + input(n);
    else
        m = m+1;
        sums(m) = 0;
    end
end

% Find maximum 3 amounts of calories held and total these:
top3 = maxk(sums,3);
solution = sum(top3)
