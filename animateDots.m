function animateDots(colr, gray, t)

figure
axis equal off
set(gcf,'color',[1 1 1]) % white figure window background
hold on

for i = 1:size(colr,1)  
    for j = 1:size(colr,2)
        if (gray(i,j) >= t) % Dot's gray val is at least threshold 
            c = [gray(i,j), gray(i,j), gray(i,j)];
            DrawDiskNoBorder(j,size(colr,1)-i,(1-gray(i,j))/2,c);
        else % Less than threshold
            DrawDiskNoBorder(j,size(colr,1)-i,(1-gray(i,j))/2,colr(i,j,:))
        end
        xlim([0 size(colr,2)]) % Scale 
        ylim([0 size(colr,1)])
    end
    pause(0.01) % Pauses after plots create "animation"
end
