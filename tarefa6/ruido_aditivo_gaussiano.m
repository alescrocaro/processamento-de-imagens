img = imread("pratica6.png");
img = im2double(img);
imgSize = size(img);
novaImg = zeros(imgSize);
quantidade = 1;

figure(1);
imshow(img);

for i = 1:quantidade
    novaImg = novaImg + imnoise(img,'gaussian', 0, 0.25);
end

novaImg = novaImg/quantidade;

figure(2)
imshow(novaImg);

figure(3)
imhist(img)
figure(4)
imhist(novaImg)

imgOriginal = imhist(img) / (imgSize(1) * imgSize(2));
imgComRuido = imhist(novaImg) / (imgSize(1) * imgSize(2));

diferenca = sum(abs(imgOriginal-imgComRuido));
diferenca