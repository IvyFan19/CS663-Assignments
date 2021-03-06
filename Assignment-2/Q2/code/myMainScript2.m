%% MyMainScript

tic;
load('../data/honeyCombReal_Noisy.mat');
noise_image = imgCorrupt;
input = im2double(imread('../data/honeyCombReal.png'));
%input, std_space, std_intensity
output = myBilateralFiltering(input,9,0.33 );
distance = sum(sum( ((output - input).^2)  ));
distance = sqrt(distance);
%imshow([mat2gray(input), mat2gray(output), mat2gray(noise_image)]);
%imshow(spatial_mask);
title('Input, Noisy Image and Bilateral Filtered Image')
daspect ([1 1 1]);  
axis tight;  
colorbar

% bestDistance=17045913600;
% best_std_space=1;
% best_std_intensity=1;
% fileID = fopen('hyperp2.txt', 'a');
% fprintf(fileID, '--------------------------------------------------\n');
% std_space_values = linspace(1,256,256) ;
% std_intensity_values =0.01;%linspace(0,1,10);
% for i= std_space_values %insert the range of std_space
%     for j=std_intensity_values  %insert the range of std_intensity
%         output = myBilateralFiltering2(noise_image, i, j);
%         distance = sum(sum( ((output - input).^2)  ));
%         if (distance < bestDistance)
%             best_std_space = i;
%             best_std_intensity = j;
%             bestDistance = distance;
%             
%             fprintf(fileID,'%f, %f, %f\n',i,j,distance);
%             
%         end
%     end
% end
% fclose(fileID);


toc;
