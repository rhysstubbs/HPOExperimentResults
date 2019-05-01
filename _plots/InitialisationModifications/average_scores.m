% --------------------------------------------
% ------------ Vanilla Unmodified ------------
% --------------------------------------------

fname = "VanillaResults/avgs.json";

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
    for j = 1:30
        for i = 1:100
           valuesAtGeneration(i,j) = json(j,i);
       end
    end

    for k = 1:100
        for l = 1:30
            yData(1,k) = sum(valuesAtGeneration(k,:)) / 100;
        end
    end

    plot(xData, yData);
end

% --------------------------------------------
% -------- Modifiy Nodes Initial Bias --------
% --------------------------------------------

fname2 = "InitialNodeBiasMod/avgs.json";

if exist(fname2, 'file') == 2
    fid2 = fopen(fname2);
    raw2 = fread(fid2, inf); 
    str2 = char(raw2'); 
    fclose(fid2); 
    json2 = jsondecode(str2);

    yData2 = zeros(1,100);

    valuesAtGeneration2 = zeros(100,30);
    for j = 1:30
        for i = 1:100
           valuesAtGeneration2(i,j) = json2(j,i);
       end
    end

    for k = 1:100
        for l = 1:30
            yData2(1,k) = sum(valuesAtGeneration2(k,:)) / 100;
        end
    end

    hold on
    plot(xData, yData2);
    hold off
end

% --------------------------------------------
% --------- Modifiy Network Topology ---------
% --------------------------------------------

fname3 = "InitialNetworkTopologyMod/avgs.json";

if exist(fname3, 'file') == 2
    fid3 = fopen(fname3);
    raw3 = fread(fid3, inf); 
    str3 = char(raw3'); 
    fclose(fid3); 
    json3 = jsondecode(str3);

    yData3 = zeros(1,100);

    valuesAtGeneration3 = zeros(100,30);
    for j = 1:30
        for i = 1:100
           valuesAtGeneration3(i,j) = json3(j,i);
       end
    end

    for k = 1:100
        for l = 1:30
            yData3(1,k) = sum(valuesAtGeneration3(k,:)) / 100;
        end
    end

    hold on
    plot(xData, yData3);
    hold off
end

% --------------------------------------------
% --- Modifiy Initial Activation Funciton ----
% --------------------------------------------

fname4 = "InitialNodeAFMod/avgs.json";

if exist(fname4, 'file') == 2
    fid4 = fopen(fname4);
    raw4 = fread(fid4, inf); 
    str4 = char(raw4'); 
    fclose(fid4); 
    json4 = jsondecode(str4);

    yData4 = zeros(1,100);

    valuesAtGeneration4 = zeros(100,30);
    for j = 1:30
        for i = 1:100
           valuesAtGeneration4(i,j) = json4(j,i);
       end
    end

    for k = 1:100
        yData4(1,k) = sum(valuesAtGeneration4(k,:)) / 100;
    end

    hold on
    plot(xData, yData4);
    hold off
end

%__________________________________________________________________________
%_______ Set chart options ________________________________________________
grid on
grid minor
xlabel('Generation') ;
ylabel('Fitness score');
legend({'Default initialisation','Bias initialisation','Network topology initialisation','Neuron AF initialisation'},'Location','southeast');