% Terefa 1 - Processamento de Sinais Biológicos
% Grupo 7:
%   - Fausto Emrich Brenner
%   - Natália Backhaus Pereira
%   - Lucas Ferreira Lima
%
%   Codigo executado utilizando nossa própria função 'get5min', incluída no
%   arquivo enviado

name_young = "f2y04m";          % Determina o nome de identificaçao de cada 
name_old = "f2o04m";            % um dos pacientes

figure
get5min(name_old);              % Recupera 5 min dos dados do paciente idoso
suptitle('Old Pacient')         % e plota em sua propria figure

figure
get5min(name_old);              % Recupera 5 min dos dados do paciente jovem
suptitle('Young Pacient')       % e plota em sua propria figure