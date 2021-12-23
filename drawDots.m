function drawDots(colr, gray, t)
% Draw nrb*ncb dots (disks) where nrb and ncb are the number of rows and 
%   number of columns in matrix gray.  
% gray:  type double array of size nrb-by-ncb representing gray values.
%   E.g., gray(r,c) is the gray value of the row r column c dot, which can
%   be drawn centered at xy coordinates (c,-r).
% colr:  type double array of size nrb-by-ncb-by-3 representing RGB values.
%   E.g., colr(r,c,1) is the red intensity of the row r column c dot, which
%   can be drawn centered at xy coordinates (c,-r).
% t:  Grayness threshold, 0<=t<=1.  A dot whose gray value is at least t is 
%   drawn in its its gray value; otherwise the dot is drawn in color as 
%   indicated in the array colr.
% A dot's diameter is inversely proportional to its gray value--if a dot's
%   gray value is 0 then its diameter is 1; if a dot's gray value is 1 then
%   its diameter is 0.
% The background color of the figure is white.

figure
axis equal off
set(gcf,'color',[1 1 1]) % white figure window background
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Write your code below %%%%

% Draw the pointilized picture
for i = 1:size(colr,1)
    for j = 1:size(colr,2)
        if (gray(i,j) >= t) % Dot's gray val is at least threshold
            c = [gray(i,j), gray(i,j), gray(i,j)];
            DrawDiskNoBorder(j,size(colr,1)-i,(1-gray(i,j))/2,c);
            hold on
        else % Less than threshold
            DrawDiskNoBorder(j,size(colr,1)-i,(1-gray(i,j))/2,colr(i,j,:))
            hold on
        end
    end
end

%%%% Write your code above %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


hold off
