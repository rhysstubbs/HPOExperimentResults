% JSON Merge Script

files = [];

for c = 0:30-1
   fname = c+".json";
   disp(fname);
   fid = fopen(fname);
   raw = fread(fid,inf); 
   str = char(raw'); 
   fclose(fid); 
   val = jsondecode(str);
   files = [files val];
end

jsonFiles = jsonencode(files);
fname = "OptimiseActivationFunction.json";

newFid = fopen(fname, 'w');
fwrite(fid, jsonFiles, 'char');
fclose(newFid);

disp("Done! "+fname);