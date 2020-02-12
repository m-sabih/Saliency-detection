function [H]=luminous_contrast_map(img)
    I=imread(img);
    img=rgb2gray(I);
    img = mat2gray(img);
    I=mean2(img)
    sz = size(img);
    n=2;
    b=zeros(1,1);
    H = zeros(sz(1),sz(2));
    H = padarray(img,[3,3]);
    img = padarray(img,[2,2]);
    for r = 3:sz(1)
        for c = 3:sz(2)
            row=1;
            for k=-2:2
                col=1;
                for l=-2:2
                    b(row,col)=img(r+k,c+l);
                    col=col+1;
                end
                row=row+1;
            end        
            tsum=sum(sum(b));
            I2=(1/5)*tsum;
            H(r,c)= (abs(I-I2))^n;
       end
    end
   % subplot(1,2,1)
   % imshow(img)
   % subplot(1,2,2)
   % imshow(H)
    %size(H)
    %size(img)
    H;
end