function bigArea = select_big_areas(red_part,AreaSize)

I = red_part(:,:,1);

%% Create a Binary Image
BW = I > 0;

%% Calculate Custom Pixel Value-Based Properties
s = regionprops(BW, I, {'Centroid','PixelValues','BoundingBox','Area'});

sArea = [s.Area];
bigArea = find(sArea > AreaSize);

figure
imshow(red_part);
title(['Regions Having Areas < ',num2str(AreaSize), ' pixels']);
hold on;

for k = 1 : length(bigArea)
    rectangle('Position', s(bigArea(k)).BoundingBox, ...
        'EdgeColor','y');
end
hold off;

end
