img = imread('pratica4.png');

pontos = [0 0; 10 10; 100 50; 220 90; 255 255];
[nPontos, lixo] = size(pontos);

for i = 1:nPontos-1
    A = [pontos(i, 1) 1; pontos(i+1, 1) 1];   
    B = [pontos(i, 2); pontos(i+1, 2)];
    c = A \ B;
    C = 0 : 255;
    D(pontos(i, 1)+1 : pontos(i+1, 1)+1) = C(pontos(i, 1)+1 : pontos(i+1, 1)+1).*c(1)+c(2);
    D(D < 0) = 0;
    D(D > 255) = 255; 
end


novaImg = D(img+1);
novaImg = novaImg/255;
figure(1);
plot(D);

figure(2);
imshow(novaImg);
