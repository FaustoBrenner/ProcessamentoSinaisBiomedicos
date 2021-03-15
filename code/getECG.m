function [ECG, x] = getECG(Name)
    matName = strcat(Name, '.mat');                                         % Carrega arquivos do paciente
    infoName = strcat(Name, '.info');
    load(matName);
    info = fopen(infoName,'rt');
    
    fgetl(info);                                                            % Recupera a informação do intervalo de amostragem a partir do arquivo .info
    fgetl(info);
    fgetl(info);
    [freq] = sscanf(fgetl(info), "Sampling frequency: %f Hz  Sampling interval: %f sec");
    interval = freq(2);
    fgetl(info);

    for i = 1:size(val, 1)                                                  % Recupera as informações dos dados descrita no arquivo .info
        [row(i), signal(i), gain(i), base(i), units(i)]=strread(fgetl(info),'%d%s%f%f%s','delimiter','\t'); 
    end

    fclose(info);
    val(val==-32768) = NaN;

    for i = 1:size(val, 1)                                                  % Normaliza os valores, subtraindo a referência e dividindo pelo ganho
        val(i, :) = (val(i, :) - base(i)) / gain(i);
    end

    x = (1:size(val, 2)) * interval;
    ECG = val(2,:);
end
