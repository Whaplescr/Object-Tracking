function [] = toGreenies(image1, image2)
    % get passed the matching indicies from match.m and compare the locs at
    % those locations and plot a line that shows how far the matching points 
    % moved from the first frame to the second.
    [im1, des1, loc1] = sift(image1);
    [im2, des2, loc2] = sift(image2);
    
    fi = sfigure(1); imshow(image2);hold on;
    % Credit for sfigure or surpressed figure command goes to 
    % Daniel Eaton at 
    % http://www.mathworks.com/matlabcentral/fileexchange/8919--smart--silent-figure/content/sfigure.m
    %First check for each descriptor in 2 exists in 1

    
    distRatio = 0.6;   

    % For each descriptor in the first image, select its match to second image.
    des2t = des2';                          % Precompute matrix transpose
    for i = 1 : size(des1,1)
       dotprods = des1(i,:) * des2t;        % Computes vector of dot products
       [vals,indx] = sort(acos(dotprods));  % Take inverse cosine and sort results

       % Check if nearest neighbor has angle less than distRatio times 2nd.
       if (vals(1) < distRatio * vals(2))
          match(i) = indx(1);
       else
          match(i) = 0;
       end
    end
    
    for i = 1: size(des1,1)
        if (match(i) > 0)
        %Just made the lines visible and smaller.
        mat = match(i);
        loc2x = loc2(mat,1);
        loc2y = loc2(mat,2);
        loc1x = loc1(i,1);
        loc1y = loc1(i,2);
            if((loc2x == loc1x) && (loc2y == loc1y))
                scatter(loc1y, loc1x, 'Marker','*','LineWidth',1.5);
            else
                line([loc2y loc1y],[loc2x,loc1x],'LineWidth',2,'Color',[.1,.9,.1]);
            end
        end
    end
    filename = [image1(1:14) 'Motion' image1(14:end-4) '_lines.png'];
    print(fi,'-dpng',filename) % Save the image with our shiney new sift features on it
  hold off;
end
    

                  

