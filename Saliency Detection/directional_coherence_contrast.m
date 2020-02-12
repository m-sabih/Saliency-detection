function [H]=directional_coherence_contrast(img)
    I=imread(img);
    img=rgb2gray(I);
    img = mat2gray(img);

    sz = size(img);
    b1=zeros(1,1);
    b2=zeros(1,1);
    H = zeros(sz(1),sz(2));
    H = padarray(img,[3,3]);
    img = padarray(img,[3,3]);
    %gradient work
    [rows, cols] = size(img);
    maskSize = max([rows, cols]); 
        DoG = difference_of_gaussian_kernels(maskSize);
        Ix = conv2(img, DoG.Gx,'same');
        Iy = conv2(img, DoG.Gy,'same');
    for r = 4:sz(1)
        for c = 4:sz(2)
            row=1;
            for k=-3:3
                col=1;
                for l=-3:3
                    b1(row,col)=Ix(r+k,c+l); %neighbourhood of gradient in x direction
                    b2(row,col)=Iy(r+k,c+l); %neighbourhood of gradient in y direction
                    col=col+1;
                end
                row=row+1;
            end
            IxSquare=b1.^2;
            IySquare=b2.^2;
            IxSum=sum(sum(IxSquare)); %sum of Ix squares of neighbourhood
            IySum=sum(sum(IySquare)); %sum of Iy squares of neighbourhood
            IxIy=b1.*b2;
            IxIySum=sum(sum(IxIy)); %sum of Ix multiply Iy
            structureTensor=[IxSum IxIySum;IxIySum IySum];
            V = svd(structureTensor);
            lembda1=V(1,1);
            lembda2=V(2,1);
            DC=(lembda1-lembda2)^2;
            H(r,c)= (abs(DC));
       end
    end
    %subplot(1,2,1)
    %imshow(img);
    %subplot(1,2,2)
    %imshow(H);
    H;
end