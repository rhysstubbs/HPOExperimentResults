% This script reads all average scores from the results

fname = "all_results.json";
fid = fopen(fname);
raw = fread(fid, inf); 
str = char(raw'); 
fclose(fid); 
json = jsondecode(str);

for s = 1:30 
   
    sample = json(s).generations;
    %disp(sample);
    for g = 0:100
        
       key = "x"+g;
       disp(key);
       generation = sample.(key);
       disp(generation);
    end
end