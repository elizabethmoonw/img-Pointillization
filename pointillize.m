function [colr, gray] = pointillize(A,n,t,ani)
% "Pointillize" an image.
% A:  3-d uint8 array of color image data
% n:  Block size, i.e., each block contains n*n pixels (n rows by n cols).
%     n is a positive integer value.
% t:  Grayness threshold below which a block will be presented in color; at
%     or above t a block will be presented in gray.  0<=t<=1.
% ani:  a 0-1 scalar.  1=animate drawing; 0=draw still graphic.
% Crop array A such that its number of rows and number of columns of pixels
%   are each a multiple of n and the "middle part" of the image is kept.
% Type double arrays colr and gray store RGB and gray intensities, each in
%   the range of 0 to 1.
% gray is an nrb-by-ncb array of type double values storing the average 
%   gray intensity of each block of pixels, where nrb and ncb are the 
%   number of blocks in the row and column dimensions, respectively.
% colr is an nrb-by-ncb-by-3 array of type double values:
%   colr(:,:,1) store the average red intensity of each block
%   colr(:,:,2) store the average green intensity of each block
%   colr(:,:,3) store the average blue intensity of each block
% The program should halt execution with an appropriate error message if 
%   the parameter values result in either of these cases:
%   - the number of blocks in either or both dimensions is <10
%   - ani is 1 and the number of blocks in either or both dimensions is >80

close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Write your code below %%%%

% Crop the image so number of rows and columns are divisible by n
nr = floor(size(A,1)) - rem(size(A,1),n);
nc = floor(size(A,2)) - rem(size(A,2),n);

% Check if the number of blocks in either dimension is problematic
nbr = nr/n;
nbc = nc/n;

% Display error messages if appropriate
if nbr < 10 || nbc < 10
    error(['The number of blocks in either dimension is < 10. Try a',...
        'smaller value of n.'])
elseif nbr > 80 || nbc > 80
    if ani == 1
        error(['Cannot animate when the number of blocks in either',...
            'dimension is > 80. Try a larger value of n.'])
    end
end

% Centering the cropping of the image
nr1 = 1 + floor((size(A,1) - nr)/2);
nr2 = (nr1 - 1) + nr;
nc1 = 1 + floor((size(A,2) - nc)/2);
nc2 = (nc1 - 1) + nc;

% Save the cropped image to a matrix
A_crop = A(nr1:nr2,nc1:nc2,:);

% Average the block of pixels
for i = 1:(nr/n)
    for j = 1:(nc/n)
        A_avg(i,j,1) = mean(mean(A_crop(1+(i-1)*n:i*n,1+(j-1)*n:j*n,1)));
        A_avg(i,j,2) = mean(mean(A_crop(1+(i-1)*n:i*n,1+(j-1)*n:j*n,2)));
        A_avg(i,j,3) = mean(mean(A_crop(1+(i-1)*n:i*n,1+(j-1)*n:j*n,3)));
        
        A_gray(i,j) = mean(A_avg(i,j,:));
    end
end

% Normalize color values
colr = A_avg/255;

% Normalize gray values
gray = A_gray/255;


%%%% Write your code above %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Animate dots or make a still figure
if ani
    animateDots(colr,gray,t)
else
    drawDots(colr,gray,t)
end