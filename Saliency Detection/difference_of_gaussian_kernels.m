function DoG = difference_of_gaussian_kernels(maskSize)

    gmap = double(fspecial('gaussian', maskSize));
   
    gLeft  = [gmap, zeros(maskSize,1)];
    gRight = [zeros(maskSize,1), gmap];
    gDiff = gLeft-gRight;
    DoG.Gx = gDiff(:,1:maskSize);

    gTop    = [gmap; zeros(1,maskSize)];
    gBottom = [zeros(1,maskSize); gmap];
    gDiff = gTop-gBottom;
    DoG.Gy = gDiff(1:maskSize,:);
    
    DoG.Gx2 = conv2(DoG.Gx,DoG.Gx,'same');
    DoG.Gy2 = conv2(DoG.Gy,DoG.Gy,'same');
    DoG.Gxy = conv2(DoG.Gx,DoG.Gy,'same');
    
    DoG.Gx3 = conv2(DoG.Gx2,DoG.Gx,'same');
    DoG.Gx2y = conv2(DoG.Gx2,DoG.Gy,'same');
    DoG.Gxy2 = conv2(DoG.Gx,DoG.Gy2,'same');
    DoG.Gy3 = conv2(DoG.Gy2,DoG.Gy,'same');
    
    DoG.Gx4 = conv2(DoG.Gx3,DoG.Gx,'same');
    DoG.Gx3y = conv2(DoG.Gx3,DoG.Gy,'same');
    DoG.Gx2y2 = conv2(DoG.Gx2,DoG.Gy2,'same');
    DoG.Gxy3 = conv2(DoG.Gx,DoG.Gy3,'same');
    DoG.Gy4 = conv2(DoG.Gy3,DoG.Gy,'same');
end









