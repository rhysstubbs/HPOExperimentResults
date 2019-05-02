% --------------------------------------------
% ------------ Vanilla Unmodified ------------
% --------------------------------------------

fname = "VanillaResults/highs.json";

if exist(fname, 'file') == 2
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

    for i = 1:100
       for j = 1:30

           highValForGen = json(j,i);
           valuesAtGeneration(i,j) = highValForGen;

       end
    end

    for k = 1:100
            yData(1,k) = sum(valuesAtGeneration(k,:)) / 100;
    end

    plot(xData, yData);
end

% --------------------------------------------
% -------- Modifiy Nodes Initial Bias --------
% --------------------------------------------

fname1 = "InitialNodeBiasMod/highs.json";

if exist(fname1, 'file') == 2
    fid1 = fopen(fname1);
    raw1 = fread(fid1, inf); 
    str1 = char(raw1'); 
    fclose(fid1); 
    json1 = jsondecode(str1);

    yData1 = zeros(1,100);

    valuesAtGeneration1 = zeros(100,30);

    for ii = 1:100
       for jj = 1:30

           highValForGen = json1(jj,ii);
           valuesAtGeneration1(ii,jj) = highValForGen;

       end
    end

    for kk = 1:100
            yData1(1,kk) = sum(valuesAtGeneration1(kk,:)) / 100;
    end

    hold on 
    plot(xData, yData1);
    hold off
end

% --------------------------------------------
% --------- Modifiy Network Topology ---------
% --------------------------------------------

fname2 = "InitialNetworkTopologyMod/highs.json";

if exist(fname2, 'file') == 2
    fid2 = fopen(fname2);
    raw2 = fread(fid2, inf); 
    str2 = char(raw2'); 
    fclose(fid2); 
    json2 = jsondecode(str2);

    yData2 = zeros(1,100);

    valuesAtGeneration2 = zeros(100,30);

    for ii = 1:100
       for jj = 1:30

           highValForGen = json2(jj,ii);
           valuesAtGeneration2(ii,jj) = highValForGen;

       end
    end

    for kk = 1:100
            yData2(1,kk) = sum(valuesAtGeneration2(kk,:)) / 100;
    end

    hold on
    plot(xData, yData2);
    hold off
end

% --------------------------------------------
% --- Modifiy Initial Activation Funciton ----
% --------------------------------------------

fname3 = "InitialNodeAFMod/highs.json";

if exist(fname3, 'file') == 2
    fid3 = fopen(fname3);
    raw3 = fread(fid3, inf); 
    str3 = char(raw3'); 
    fclose(fid3); 
    json3 = jsondecode(str3);

    yData3 = zeros(1,100);

    valuesAtGeneration3 = zeros(100,30);

    for ii = 1:100
       for jj = 1:30

           highValForGen = json3(jj,ii);
           valuesAtGeneration3(ii,jj) = highValForGen;

       end
    end

    for kk = 1:100
        yData3(1,kk) = sum(valuesAtGeneration3(kk,:)) / 100;
    end

    hold on
    plot(xData, yData3);
    hold off
end

%__________________________________________________________________________
%_______ Set chart options ________________________________________________
grid on
grid minor
xlabel('Generation') ;
ylabel('Fitness score');
legend({'Vanilla','INBM','INTM','INAFM'},'Location','southeast');
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];