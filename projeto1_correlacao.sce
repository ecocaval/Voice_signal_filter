/*
    Projeto 1 - Érico A. B. Cavalcanti 19150070 - UFSC
    EEL7522-06202 (20222) - Prof. Joceli Mayer
    --------------------------------------------------
    Correlação de sinais
*/
clear; clc;

// original audio file path
audio_path = "C:\Users\ecoca\OneDrive\Área de Trabalho\DIGITAL\digital_signals_processing_-master\project_1\audio_original_projeto1.wav";

// extracts the audio and creates auxiliary variables
[x, Fs, bits] = wavread(audio_path);
N = size(x(1,:)); 
number_of_samples = N(2); // in this case there is 273496 (54700 samples per second)

// extracting a middle segment of the audio
segmented_audio = x(1, 109400 : 164100);

// correlation between signals usign scilab native function "xcorr", 
// the original audio was used as reference for the correlation
[c, lagindex] = xcorr(x(1,:), segmented_audio);
plot(lagindex, c);
