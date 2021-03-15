function [x,fs,ecg,resp] = get5min(Name, start, plt)
%   input:
%       Name - nome usado para identificar paciente
%       start - ponto inicial dos 5 min selecionados (em segs)
%       plt - bool para escolher se vai plotar ou nao os gráficos
%   output: 
%       x - vetor de 1 a 300 (5 min em segundos)
%       ecg - vetor com dados de ecg do paciente dentro do intervalo
%       solicitado
%       resp -vetor com dados de respiração do paciente dentro do intervalo
%       solicitado

    switch nargin
        case 2
            plt = true;
        case 1                                                              % Valores padrao das variaveis de entrada, caso nao informadas
            plt = true;
            start = 1;
    end

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
    fs = freq(1);

    for i = 1:size(val, 1)                                                  % Recupera as informações dos dados descrita no arquivo .info
        [row(i), signal(i), gain(i), base(i), units(i)]=strread(fgetl(info),'%d%s%f%f%s','delimiter','\t'); 
    end

    fclose(info);
    val(val==-32768) = NaN;

    for i = 1:size(val, 1)                                                  % Normaliza os valores, subtraindo a referência e dividindo pelo ganho
        val(i, :) = (val(i, :) - base(i)) / gain(i);
    end


    n = fix(5*60/interval);                 % numero de amostras em 5 min
    s = start/interval;                     % index do momento inicial dos 5 min escolhido (em segs)
    x = (s:n+s) * interval-start;           % seleciona n amostras dentro dos nossos dados
    resp = val(1,s:n+s);      
    ecg = val(2,s:n+s);
    
    if (plt)
        subplot(2,1,1);
        plot(x',resp','b');
        xlabel('Time (sec)');
        ylabel('mV');
        title('RESP');

        subplot(2,1,2); 
        plot(x',ecg','r');
        xlabel('Time (sec)');
        ylabel('mV');
        title('ECG');
    end
end
