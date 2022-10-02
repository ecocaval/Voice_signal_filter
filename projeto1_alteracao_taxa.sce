/*
    Projeto 1 - Érico A. B. Cavalcanti 19150070 - UFSC
    EEL7522-06202 (20222) - Prof. Joceli Mayer
    --------------------------------------------------
    Alteração da taxa
*/
clear; clc;

// original audio file path
audio_path = "C:\Users\ecoca\OneDrive\Área de Trabalho\DIGITAL\digital_signals_processing_-master\project_1\audio_original_projeto1.wav";

// extracts the audio and creates auxiliary variables
[x, Fs, bits] = wavread(audio_path);
N = size(x(1,:)); 
number_of_samples = N(2); // in this case there is 273496 (54700 samples per second)

// increasing the original audio rate
for i = 1 : number_of_samples
        doubled_rate_audio(2*i-1) = x(1,i);
        doubled_rate_audio(2*i) = 0;     
end

// variables used in normalization
signal_maximum = max(doubled_rate_audio);
signal_minimum = min(doubled_rate_audio);
normalix = max(abs(signal_maximum), abs(signal_minimum));

// normalization of double_rate_audio
for i = 1 : 2*number_of_samples
        doubled_rate_audio(i) = doubled_rate_audio(i)/normalix;     
end
wavwrite(doubled_rate_audio, "C:\Users\ecoca\OneDrive\Área de Trabalho\DIGITAL\digital_signals_processing_-master\project_1\audio_taxa_dobrada.wav");

// deacreasing the original audio rate
for i = 1 : floor(number_of_samples/2)        
        half_rate_audio(i) = x(1,2*i);
end

// variables used in normalization
signal_maximum = max(half_rate_audio);
signal_minimum = min(half_rate_audio);
normalix = max(abs(signal_maximum), abs(signal_minimum));

// normalization of half_rate_audio
for i = 1 : floor(number_of_samples/2)
        half_rate_audio(i) = half_rate_audio(i)/normalix;     
end
wavwrite(half_rate_audio, "C:\Users\ecoca\OneDrive\Área de Trabalho\DIGITAL\digital_signals_processing_-master\project_1\audio_taxa_pela_metade.wav");
