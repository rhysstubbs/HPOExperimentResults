
fname = "OptimiseNetworkTopology/lows.json";

if exist(fname, 'file') == 2
    fid = fopen(fname);
    raw = fread(fid, inf); 
    str = char(raw'); 
    fclose(fid); 
    json = jsondecode(str);
    
    fittestAgents = zeros(1,30);
    
    for i = 1:30
        fittestAgents(1,i) = json(i, end);
    end
    
    fittestAgentsJSON = jsonencode(fittestAgents);
    fname = "30_worst_solutions.json";

    fid = fopen(fname, 'w');
    fwrite(fid, fittestAgentsJSON, 'char');
    fclose(fid);

    
end