img='1.jpg';
H1=luminous_contrast_map(img);
H2=directional_coherence_contrast(img);
S=H1.*H2;
S = imgaussfilt(S,2);
S = uint8(255 * S);
subplot(2,2,1)
imshow(img)
subplot(2,2,2)
imshow(H1)
subplot(2,2,3)
imshow(H2)
subplot(2,2,4)
imshow(S)