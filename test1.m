clear
clc
close all

%% Read the file
% Read input image, which is an image of an spectrogram.

he = imread('Spec01.png');
imshow(he), title('SEI ETMX Spectrogram');
text(size(he,2),size(he,1)+15,...
     'Image courtesy of LIGO Summary Pages', ...
     'FontSize',10,'HorizontalAlignment','right');
 
a = select_red(he);

figure
imshow(a), title('Red Noisy Parts of Spectrogram');