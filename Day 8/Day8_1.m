% Import data:

fileID = fopen('input8.txt');
input = fscanf(fileID, '%c');
fclose(fileID);


% Format as numeric matrix:
treeGrid = char(splitlines(input))-'0';


% Find number of visible trees in each row and column:
for row = 1:size(treeGrid,1)
    TreesRow(row) = treeCount(treeGrid(row,:));
end

for column = 1:size(treeGrid,2)
    TreesColumn(column) = treeCount(treeGrid(:,column));
end

% Find number of visible trees overall:
solution = sum(TreesColumn) + sum(TreesRow)


%-------------FUNCTIONS--------------------------------------------------



% Function to count how many visible trees along a line:

function [visibleTrees] = treeCount(line)

    [~,i] = max(line);

% From one direction:
    if line(1) == 0
        visibleTrees1 = 0;
        maxTreeHeight = 0;
    else
        visibleTrees1 = 1;
        maxTreeHeight = line(1);
    end
    
    for n = 2:i
        if line(n) > maxTreeHeight
            visibleTrees1 = visibleTrees1+1;
            maxTreeHeight = line(n);
        end
    end

% From the other direction:
line = flip(line);
    if line(1) == 0
        visibleTrees2 = 0;
        maxTreeHeight = 0;
    else
        visibleTrees2 = 1;
        maxTreeHeight = line(1);
    end
    
    for n = 2:i
        if line(n) > maxTreeHeight
            visibleTrees2 = visibleTrees2+1;
            maxTreeHeight = line(n);
        end
    end

    visibleTrees = visibleTrees1 + visibleTrees2;

% if max value only appears once in row, visibleTrees will be 1 too high, so adjust:
    if sum(line==max(line)) == 1
        visibleTrees = visibleTrees-1;
    end
    
end
