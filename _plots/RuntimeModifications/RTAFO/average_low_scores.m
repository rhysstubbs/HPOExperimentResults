% --------------------------------------------
% ------------ Vanilla Unmodified ------------
% --------------------------------------------

fname = "VanillaResults/lows.json";

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
% --- Modifiy Runtime Activation Funciton ----
% --------------------------------------------

fname3 = "OptimiseActivationFunction/lows.json";

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
legend({'Vanilla','RTAFO'},'Location','southeast');
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];