G = rand(100,100,3);
G(1:28,85:100,1) = 255;
G(1:28,85:100,2:3) = 0;
imshow(G);