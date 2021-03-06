clear
clc
close all

%% Read the file
% Read input image, which is an image of an spectrogram.

he = imread('Spec04.png');
imshow(he), title('SEI ETMX Spectrogram');
text(size(he,2),size(he,1)+15,...
     'Image courtesy of LIGO Summary Pages', ...
     'FontSize',10,'HorizontalAlignment','right');
 
%% Select Red Part
red_part = select_red(he);

%% Select Big Areas
bigArea = select_big_areas(red_part,200);

% figure
% imshow(red_part), title('Red Noisy Regions of Spectrogram');
