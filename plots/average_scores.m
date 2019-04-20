fname = "NEAT/avgs.json";
fid = fopen(fname);
raw = fread(fid, inf); 
str = char(raw'); 
fclose(fid); 
json = jsondecode(str);

xData = zeros(1,100);
for i = 1:100
   xData(i) = i; 
end

yData = zeros(1,100);

valuesAtGeneration = zeros(100,30);
for j = 1:30
    for i = 1:100
       valuesAtGeneration(i,j) = json(j,i);
   end
end

for k = 1:100
    for l = 1:30
        yData(k) = mean(valuesAtGeneration(k), 2);
    end
end

scatter(xData, yData);
