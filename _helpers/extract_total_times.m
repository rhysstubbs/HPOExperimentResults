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

% for k = 1:30
%     disp(totalTimes(1,k) / 1000.0 / 60);
% end


avg = mean(totalTimes(1,:)) / 1000.0 / 60;
disp(avg);

% json = jsonencode(totalTimes);
% jsonName = "totalTimes.json";
% jsonFid = fopen(jsonName, 'w');
% fwrite(fid, json, 'char');
% fclose(jsonFid);
