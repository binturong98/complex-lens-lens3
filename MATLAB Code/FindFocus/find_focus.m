%this file reads in an image file and converts it into a grey scale image
%and calls the function 
%differentiate1() which passes back a value of image sharpness for an
%image 

function y = find_focus(imageStart, imageStop , index, filter,iteration) 
filepath1 = ....; %set your customised file path here
filepath2 = ....; %set your customised file path here 

%read in images and find out how many images are within the image series
filepath = 'filepath1'; %Set filepath here
imagestemp = dir('filepath2'); %Set filepath here
allImages = imagestemp(1:(end-2)); %cuts first two goste images if necessary
numberOfimages = length(allImages);

% find interactively the area of interest
currentimage = strcat(filepath,'compute/',allImages(index).name);
I = imread(currentimage); %read in the desired image for cropping
H = rgb2gray(I);  % convert to grey scale image

F1 = figure();
[y,x,B,rect] = imcrop(H); % user chooses cropping area

%evaluate all images
result = [];

length(allImages)

for k = 1:(numberOfimages-1)
   k
   allImages(k).name
   
    currentimage = strcat('compute/',allImages(k).name)
    A = imread(currentimage); %read in the desired image for cropping  
    B = rgb2gray(A); %convert to gray scale image
    C = imcrop(y,x,B,rect); %crop image
    D = filter2(filter, C); % filter image (shut noise)
    processedImages(k).croppedImages = C; %cropped images
    processedImages(k).filteredImage = D; %filtered cropped images
    
    % makes all values positive and converts them back to uint8 format 
    % after filtering (which can cause values to become negative and
    % changes the format to double)
    if ((min(min(D))) < 0)
       minimum = min(min(D));
       E = D - minimum;
    else
        E = D;
    end
    F = E;%uint8(E); %convert back to uint8 format. 
          %Is only for debugging so the image can be displayed if needed 
    
    contrast(k) = differentiate1(F); 
end
result.contrast = contrast;
result.imagenames = allImages;

outputfile = strcat('processedImages',(num2str(iteration)),'.mat');
save(outputfile,'allImages','processedImages','contrast');  % function form

y = result;
%close all;
end

