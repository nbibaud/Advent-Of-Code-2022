% Import data:

fileID = fopen('input8.txt');
input = fscanf(fileID, '%c');
fclose(fileID);


% Format as numeric matrix:
treeGrid = char(splitlines(input))-'0';


%---------------------------------------------------------------------------


% Create matrices of zeros of same size as tree grid:
distanceHorizontal = zeros(size(treeGrid));
distanceVertical = zeros(size(treeGrid));

% Find distance you can see from each tree horizontally and vertically:
for row = 2:(size(treeGrid,1)-1)
    distanceHorizontal(row,:) = treeView(treeGrid(row,:),distanceHorizontal(row,:));
end

for column = 2:(size(treeGrid,2)-1)
    distanceVertical(:,column) = treeView(treeGrid(:,column),distanceVertical(:,column));
end

% Find highest scenic score:

solution = max(max(distanceVertical .* distanceHorizontal))


%-----FUNCTIONS----------------------------------



% Function to find visible trees along a line:

function [distance] = treeView(line, distanceIn)

% Looking in one direction:
distance1 = distanceIn;
    
    for n = 2:numel(line)
        view = line(1:n-1);

        % Find distance to closest tree that is higher or same height, or
        % to edge if there is no higher tree present:

        if sum(view >= line(n)) == 0
            distance1(n) = n-1;
        else
            i = find(view >= line(n));
            distance1(n) = min(n-i);
        end
    end

% From the other direction:
line = flip(line);
distance2 = distanceIn;

   for n = 2:numel(line)
        view = line(1:n-1);

        % Find distance to closest tree that is higher or same height, or
        % to edge if there is no higher tree present:

        if sum(view >= line(n)) == 0
            distance2(n) = n-1;
        else
            i = find(view >= line(n));
            distance2(n) = min(n-i);
        end
    end

   distance = distance1 .* flip(distance2); 

end