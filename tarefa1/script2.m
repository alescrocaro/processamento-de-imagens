G = rand(100,100,3);
G(85, :,:) = 0;
G(:,54,:) = 255;
imshow(G);