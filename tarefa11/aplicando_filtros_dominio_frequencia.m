a = imread("pratica11.png");
figure(1);
imshow(a);

b = padarray(a, size(a), "post");
c = im2double(b);
d = fft2(c);
d = fftshift(d);
figure(2);
imshow(uint8(abs(d)));
imwrite(uint8(abs(d)), 'espectro1.png');

h = imread("espectro1_arrumado.png");
h = im2double(h);
g = d.*h;

g = ifftshift(g);
at = ifft2(g);
at = abs(at);
[x, y] = size(a);
atc = at(1:x,1:y);

figure(3)
imshow(im2uint8(atc));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%555

a = imread("pratica11_c.png");
figure(4);
imshow(a);

b = padarray(a, size(a), "post");
c = im2double(b);
d = fft2(c);
d = fftshift(d);
figure(5);
imshow(uint8(abs(d)));
imwrite(uint8(abs(d)), 'espectro2.png');

h = imread("espectro2_arrumado3.png");
h = im2double(h);
g = d.*h;

g = ifftshift(g);
at = ifft2(g);
at = abs(at);
[x, y] = size(a);
atc = at(1:x,1:y);

figure(6)
imshow(im2uint8(atc));