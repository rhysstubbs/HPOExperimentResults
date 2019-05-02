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
% --- Modifiy Runtime Activation Function ----
% --------------------------------------------

fname2 = "OptimiseNetworkTopology/avgs.json";

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


%__________________________________________________________________________
%_______ Set chart options ________________________________________________
grid on
grid minor
xlabel('Generation') ;
ylabel('Fitness score');
legend({'Vanilla','RTNTO'},'Location','southeast');
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];