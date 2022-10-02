/*
    Projeto 1 - Érico A. B. Cavalcanti 19150070 - UFSC
    EEL7522-06202 (20222) - Prof. Joceli Mayer
    --------------------------------------------------
    Realizar Filtragem de média móvel com:
    M = 50 ; M = 100 ; M = 1000 ;  
    y[n] = 1/M (Σx[n-k]) -> limits from somatory k = 0 to k = M-1
*/
clear; clc;

// array used to store M 
M = [50, 100, 1000];
total_M_values = size(M)(2);

// original audio file path
audio_path = "C:\Users\ecoca\OneDrive\Área de Trabalho\DIGITAL\digital_signals_processing_-master\project_1\audio_original_projeto1.wav";

// extracts the audio and creates auxiliary variables
[x, Fs, bits] = wavread(audio_path);
N = size(x(1,:)); 
number_of_samples = N(2);

// filter start
for i = 1 : total_M_values
    for z = 1 : M(i) //initial samples
        y(i,z) = x(1,z);
    end    
    for j = M(i) + 1 : number_of_samples
        y(i,j) = 0; // cleans memory
        for k = 0 : M(i) - 1 // this for loop will act like the somatory in the formula
            y(i,j) = y(i,j) + (1/M(i))*(x(1,j-k)) // "Filtragem de média móvel" general formula
        end
    end
end

// variables used in normalization
signal_maximum = max(y);
signal_minimum = min(y);
normalix = max(abs(signal_maximum), abs(signal_minimum));

for i = 1 : total_M_values
    for j = 1 : number_of_samples
        y(i,j) = y(i,j)/normalix;
    end    
    wavwrite(y(i,:), Fs, bits, "C:\Users\ecoca\OneDrive\Área de Trabalho\DIGITAL\digital_signals_processing_-master\project_1\audio" + string(i) + "_M_" + string(M(i)) + ".wav");
end



