% Terefa 1 - Processamento de Sinais Biol�gicos
% Grupo 7:
%   - Fausto Emrich Brenner
%   - Nat�lia Backhaus Pereira
%   - Lucas Ferreira Lima
%
%   Codigo executado utilizando nossa pr�pria fun��o 'get5min', inclu�da no
%   arquivo enviado

name_young = "f2y04m";          % Determina o nome de identifica�ao de cada 
name_old = "f2o04m";            % um dos pacientes

figure
get5min(name_old);              % Recupera 5 min dos dados do paciente idoso
suptitle('Old Pacient')         % e plota em sua propria figure

figure
get5min(name_old);              % Recupera 5 min dos dados do paciente jovem
suptitle('Young Pacient')       % e plota em sua propria figure