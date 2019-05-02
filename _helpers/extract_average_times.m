fname = "VanillaResults/VanillaResults_combined.json";

if exist(fname, 'file') == 2
    fid = fopen(fname);
    raw = fread(fid, inf); 
    str = char(raw'); 
    fclose(fid); 
    data = jsondecode(str);
end
    
totalTimes = zeros(1,30);

for i = 1:30
    
    sample = data(i).generations;
    totalTime = zeros(1,100);
    
   for j = 1:100 
              
       key = "x"+j;
       generation = sample.(key);
       totalTime(1,j) = generation.totalTimes;  
   end
   
   totalTimes(1,i) = sum(totalTime, 'all');
   
end


valuesAtGeneration = zeros(100,30);
for j = 1:30
    for i = 1:100
        valuesAtGeneration(i,j) = json(j,i);
    end
end

json = jsonencode(totalTimes);
jsonName = "totalTimes.json";
jsonFid = fopen(jsonName, 'w');
fwrite(fid, json, 'char');
fclose(jsonFid);
