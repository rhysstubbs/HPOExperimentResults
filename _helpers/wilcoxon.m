fname1 = "VanillaResults/30_average_solutions.json";
fname2 = "OptimiseActivationFunction/30_average_solutions.json";

if exist(fname1, 'file') == 2 && exist(fname2, 'file') == 2
    fid1 = fopen(fname1);
    raw1 = fread(fid1, inf); 
    str1 = char(raw1'); 
    fclose(fid1); 
    x = jsondecode(str1);
    
    fid2 = fopen(fname2);
    raw2 = fread(fid2, inf); 
    str2 = char(raw2'); 
    fclose(fid2); 
    y = jsondecode(str2);
end

[p,h,stats] = signrank(x,y,'method','exact');
    
 disp("p-value: "+p);
 disp("hypothessis: "+h);
 disp(stats);
 
 % h = 0 = no significant difference