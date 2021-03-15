
fn_o = 'C:\Users\faust\Pessoal\2020-2\ProcessamentoSinaisBiomedicos\data\f2o04m'; 
fn_y = 'C:\Users\faust\Pessoal\2020-2\ProcessamentoSinaisBiomedicos\data\f2y04m';

[x,fs,ecg,resp] = get5min(fn_o);
ecg = ecg';

save('C:\Users\faust\Pessoal\2020-2\ProcessamentoSinaisBiomedicos\data\ecg_o.mat', 'ecg', 'fs');

[x,fs,ecg,resp] = get5min(fn_y);
ecg = ecg';
save('C:\Users\faust\Pessoal\2020-2\ProcessamentoSinaisBiomedicos\data\ecg_y.mat', 'ecg', 'fs');