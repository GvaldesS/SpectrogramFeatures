%% Create Synthetic Image
% Create a grayscale image that contains some distinct regions.

I = propsSynthesizeImage;
imshow(I)
title('Synthetic Image')

%% Create a Binary Image
% Segment the grayscale image by creating a binary image containing the 
% objects in the image.

BW = I > 0;
imshow(BW)
title('Binary Image')

%% Calculate Object Properties Using Pixel Values of Grayscale Image
% Use regionprops to calculate both the centroid and weighted centroid of 
% objects in the image.

s = regionprops(BW, I, {'Centroid','WeightedCentroid'});

imshow(I)
title('Weighted (red) and Unweighted (blue) Centroids');
hold on
numObj = numel(s);
for k = 1 : numObj
    plot(s(k).WeightedCentroid(1), s(k).WeightedCentroid(2), 'r*');
    plot(s(k).Centroid(1), s(k).Centroid(2), 'bo');
end
hold off

%% Calculate Custom Pixel Value-Based Properties
% The 'PixelValues' property returns a vector containing the grayscale 
% values of pixels in a region. Example, calculate the std of each region.

s = regionprops(BW, I, {'Centroid','PixelValues','BoundingBox'});
imshow(I);
title('Standard Deviation of Regions');
hold on
for k = 1 : numObj
    s(k).StandardDeviation = std(double(s(k).PixelValues));
    text(s(k).Centroid(1),s(k).Centroid(2), ...
        sprintf('%2.1f', s(k).StandardDeviation), ...
        'EdgeColor','b','Color','r');
end
hold off


sStd = [s.StandardDeviation];
lowStd = find(sStd > 50);

imshow(I);
title('Objects Having Standard Deviation < 50');
hold on;
for k = 1 : length(lowStd)
    rectangle('Position', s(lowStd(k)).BoundingBox, ...
        'EdgeColor','y');
end
hold off;