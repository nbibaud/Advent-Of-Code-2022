% Import data:

fileID = fopen('input4.txt');
input = textscan(fileID, '%s');
input = string(input{1});
fclose(fileID);

% Convert to numeric matrix with 4 columns:

sections = split(input, [",","-"]);
sections = str2double(sections);

% Determine if one range contains the other:

inclusions = 0;

for n = 1:size(sections,1)
    if sections(n,2)-sections(n,1) > sections(n,4)-sections(n,3)
        if sections(n,3)>=sections(n,1) && sections(n,4)<=sections(n,2)
            inclusions = inclusions+1;
        end
    end
     if sections(n,2)-sections(n,1) < sections(n,4)-sections(n,3)
        if sections(n,3)<=sections(n,1) && sections(n,4)>=sections(n,2)
            inclusions = inclusions+1;
        end
     end
     if sections(n,2)-sections(n,1) == sections(n,4)-sections(n,3)
        if sections(n,3)==sections(n,1)
            inclusions = inclusions+1;
        end
     end
end

solution = inclusions