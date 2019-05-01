% This script reads all average scores from the results

fname = "InitialNodeAFMod(3003)_ALL.json";
fid = fopen(fname);
raw = fread(fid, inf); 
str = char(raw'); 
fclose(fid); 
json = jsondecode(str);

avgs = cell(1,30);
highs = cell(1,30);
lows = cell(1,30);

for s = 1:30
    
    sample = json(s).generations;
    
    avg = zeros(1,100);
    high = zeros(1,100);
    low =zeros(1,100);
    
    for g = 1:100
       key = "x"+g;
       generation = sample.(key);
       
       disp(s+" "+g);
       avg(g) = generation.averageScore;  
       high(g) = generation.fittestScore;
       low(g) = generation.unfittestScore;
    end
    
    avgs(s) = mat2cell(avg,1,100);
    highs(s) = mat2cell(high,1,100);
    lows(s) = mat2cell(low,1,100);
    
end

avgsJSON = jsonencode(avgs);
avgsName = "avgs.json";

highsJSON = jsonencode(highs);
highsName = "highs.json";

lowsJSON = jsonencode(lows);
lowsName = "lows.json";

newAvgsFid = fopen(avgsName, 'w');
fwrite(fid, avgsJSON, 'char');
fclose(newAvgsFid);

newHighsFid = fopen(highsName, 'w');
fwrite(fid, highsJSON, 'char');
fclose(newHighsFid);

newLowsFid = fopen(lowsName, 'w');
fwrite(fid, lowsJSON, 'char');
fclose(newLowsFid);