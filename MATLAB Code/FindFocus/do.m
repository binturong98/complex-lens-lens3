% this program allows to find the sharpest image within an image series.
% it uses a method that is described in readme.doc
% The function calls the function find_focus() which passes back
% a measure of image sharpness for each image within an image series. 
%
% Variables:
%   howMany: how often an image series will be evaluated
%   start: ID number of the first image within the image series
%   stop: ID number of the last image within the image series
%   object: output file name
%   filterNumber: 1 for filter_24(), 0 for filter_12()
%   imageNumber: number within the image series of the image that will be
%              used to crop the area of interest.

function y = do()

%assign values of global variables to local variables
%after that, only local variables are used
global FILTER END BEGINN NUMBOFEVAL IMAGENUMBER OUTPUTFILENAME;

filterNumber = FILTER;  
stop = END; 
start = BEGINN;
howMany = NUMBOFEVAL;
imageNumber = IMAGENUMBER;
object = OUTPUTFILENAME;

% choose filter
filter = [];

if filterNumber > 0
    filter = filter_24();
else
    filter = filter_12();
end

% evaluate all images of the image series as many times as desired
all = [];
temp = [];

for y = 1:howMany 
    'hallo'% prints out hallo, so help seeing it work
    temp = find_focus(start, stop ,imageNumber,filter,y);
    allcontr(:,y) = temp.contrast;  
end

% create output file name that holds the result
xlswrite((strcat(object,'.csv')),allcontr);
fileID = fopen('test2.txt','w');
fprintf(fileID,temp.imagenames.name);

%clear all
%close all
end
