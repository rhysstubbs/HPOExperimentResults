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

fname1 = "OptimiseActivationFunction/avgs.json";

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

%__________________________________________________________________________
%_______ Set chart options ________________________________________________
grid on
grid minor
xlabel('Generation') ;
ylabel('Fitness score');
legend({'Default', 'Neuron AF optimisation'},'Location','southeast');