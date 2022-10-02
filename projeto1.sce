/*
    Projeto 1 - Érico A. B. Cavalcanti 19150070 - UFSC
    EEL7522-06202 (20222) - Prof. Joceli Mayer
    --------------------------------------------------
    Realizar Filtragem com esquecimento usando:
    α = 0,98; α = 0,5; α = −0,98; α = −0,5 
*/
clear; clc;

// different alphas used in filter
alphas = [0.98, 0.5, -0.98, -0.5];

// original audio file path
audio_path = "C:\Users\ecoca\OneDrive\Área de Trabalho\DIGITAL\digital_signals_processing_-master\project_1\audio_original_projeto1.wav";

// extracts the audio and creates auxiliary variables
[x, Fs, bits] = wavread(audio_path);
N = size(x(1,:)); 
number_of_samples = N(2);

// different audio creation
for j = 1 : 4 // will be responsible for the alpha variation
    y(j,1) = x(1,1);
    for i = 2 : number_of_samples // will be responsible for the sample variation
        y(j,i) = alphas(j)*y(j,i-1) + x(1,i); // "Filtro de esquecimento" general formula     
    end
end

// variables used in normalization
signal_maximum = max(y);
signal_minimum = min(y);
normalix = max(abs(signal_maximum), abs(signal_minimum));

for j = 1 : 4 // will be responsible for the alpha variation
    for i = 1 : number_of_samples // will be responsible for the sample variation
        y(j,i) = y(j,i)/normalix;
    end
    wavwrite(y(j,:), Fs, bits, "C:\Users\ecoca\OneDrive\Área de Trabalho\DIGITAL\digital_signals_processing_-master\project_1\audio" + string(j) + "_alpha_" + string(alphas(j)) + ".wav");
end
