% Import data:

fileID = fopen('input4.txt');
input = textscan(fileID, '%s');
input = string(input{1});
fclose(fileID);

% Convert to numeric matrix with 4 columns:

sections = split(input, [",","-"]);
sections = str2double(sections);

% Determine if ranges overlap:

numberOverlaps = 0;

for n = 1:size(sections,1)
    range1 = [sections(n,1):sections(n,2)];
    range2 = [sections(n,3):sections(n,4)];
    overlapValues = intersect(range1,range2);

    overlap = ~isempty(overlapValues);
    numberOverlaps = numberOverlaps+overlap;
end
   
solution = numberOverlaps