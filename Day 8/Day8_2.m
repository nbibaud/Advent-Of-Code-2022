% % Import data:
% 
% fileID = fopen('input8.txt');
% input = fscanf(fileID, '%c');
% fclose(fileID);
% 
% 
% % Format as numeric matrix:
% treeGrid = char(splitlines(input))-'0';


%---------------------------------------------------------------------------


% Create matrices of zeros of same size as tree grid:
checkHorizontal = zeros(size(treeGrid));
checkVertical = zeros(size(treeGrid));

% Find distance you can see from each tree horizontally and vertically:
for row = 2:(size(treeGrid,1)-1)
    checkHorizontal(row,:) = treeView(treeGrid(row,:),checkHorizontal(row,:));
end

for column = 2:(size(treeGrid,2)-1)
    checkVertical(:,column) = treeView(treeGrid(:,column),checkVertical(:,column));
end

% Find number of visible trees overall:
solution = max(max(checkVertical .* checkHorizontal))


%-----FUNCTIONS----------------------------------



% Function to find visible trees along a line:

function [checkOut] = treeView(line, checkIn)

% Looking in one direction (left):
checkOut1 = checkIn;
maxTreeHeight = line(1);
    
    for n = 2:numel(line)
        % If tree is taller than the previous, set value to that of previous tree plus one
        if line(n) > line(n-1)
           checkOut1(n) = checkOut1(n-1) + 1;
        end
        if line(n) > maxTreeHeight
            i = n;
            checkOut1(n) = checkOut1(i) + checkOut1(n-1);
            maxTreeHeight = line(n);
        end
        if line(n) <= line(n-1)
            checkOut1(n) = 1;
        end
    end

% From the other direction:
line = flip(line);
maxTreeHeight = line(1);
checkOut2 = checkIn;

   for n = 2:numel(line)
        % If tree is taller than the previous, set value to that of previous tree plus one
        if line(n) > line(n-1)
           checkOut2(n) = checkOut2(n-1) + 1;
        end
        if line(n) > maxTreeHeight
            i = n;
            checkOut2(n) = checkOut2(i) + checkOut2(n-1);
            maxTreeHeight = line(n);
        end
        if line(n) <= line(n-1)
            checkOut2(n) = 1;
        end
   end

   checkOut = checkOut1 .* flip(checkOut2); 
end