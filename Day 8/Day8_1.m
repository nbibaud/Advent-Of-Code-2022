% Import data:

fileID = fopen('input8.txt');
input = fscanf(fileID, '%c');
fclose(fileID);


% Format as numeric matrix:
treeGrid = char(splitlines(input))-'0';


%---------------------------------------------------------------------------


% Create logical matrix: 1 if trees can be seen, 0 if not:
check = zeros(99);

% Find visible trees in each row and column:
for row = 1:size(treeGrid,1)
    check(row,:) = treeCount(treeGrid(row,:),check(row,:));
end

for column = 1:size(treeGrid,2)
    check(:,column) = treeCount(treeGrid(:,column),check(:,column));
end

% Find number of visible trees overall:
solution = nnz(check)


%-----FUNCTIONS----------------------------------



% Function to find visible trees along a line:

function [checkOut] = treeCount(line, checkIn)

    [~,i] = max(line);
    checkOut = checkIn;

% From one direction:
    if line(1) == 0 
        maxTreeHeight = 0;
    else
        checkOut(1) = 1;
        maxTreeHeight = line(1);
    end
    
    for n = 2:i
        if line(n) > maxTreeHeight
           maxTreeHeight = line(n);
           checkOut(n) = 1;
        end
    end

% From the other direction:
line = flip(line);
checkOut = flip(checkOut);
       if line(1) == 0 
        maxTreeHeight = 0;
    else
        checkOut(1) = 1;
        maxTreeHeight = line(1);
    end
    
    for n = 2:i
        if line(n) > maxTreeHeight
           maxTreeHeight = line(n);
           checkOut(n) = 1;
        end
    end
   checkOut = flip(checkOut); 
end