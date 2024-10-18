% this function evaluates the image sharpness of a single image. Explained in the readme.docx file 

function y = differentiate1(B)

% convert format of the grayscale values of the image to double
I = double(B);
[rows_I, columns_I] = size(I);

%fist differentiation
first_H = []; %horizontal
first_V = []; %vertical
first_D_I = []; %diagonal I
first_D_II = []; %diagonal II

for y = 1:(rows_I - 1)
    result = 0;
    
    for x = 1:(columns_I - 1)
        %horizontal differentiation
        first_H(y,x) = abs(double(I(y,x)) - double(I(y,(x+1))));
        %vertical differentiation
        first_V(y,x) = abs(double(I(y,x)) - double(I((y+1),x)));
        %diagonal I
        first_D_I(y,x) = abs(double(I(y,x)) - double(I((y+1),(x+1))));
        
    end
    for x = 2:columns_I
        %diagonal II
        first_D_II(y,(x-1)) = abs(double(I(y,x)) - double(I((y+1),(x-1))));
        
    end
end

%second differentiation, sums the differences as a total
total_W = 0;
[rows,columns] = size(first_H);

second_H = [];
second_V = [];
second_D_I = [];
second_D_II = [];

for y = 1:(rows - 1)
    for x = 1:(columns - 1)
          %horizontal differentiation
          second_H(y,x) = abs(first_H(y,x) - first_H(y,(x+1)));
          %vertical differentiation
          second_V(y,x) = abs(first_V(y,x) - first_V((y+1),x));
          %diagonal I
          second_D_I(y,x) = abs(first_D_I(y,x) - first_D_I((y+1),(x+1)));
          
    end
    for x = 2:columns
          %diagonal II        
          second_D_II(y,(x-1)) = abs(first_D_II(y,x) - first_D_II((y+1),(x-1)));
          
    end  
end

%sum second differentiations
total = [];
total = (second_H + second_V + second_D_I + second_D_II);

%sum all values within the matrix total
[rows_t,columns_t] = size(total);
total_result = 0;

for y = 1:rows_t
    for x = 1:columns_t
        total_result = total_result + total(y,x);
    end
end

%calculate average
total_result = total_result/(rows_t * columns_t);

y = total_result;
end