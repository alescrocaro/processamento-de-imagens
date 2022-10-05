%1. A imagem utilizada nesta prática será "pratica8.png”.
img = imread("pratica8.png");
img = im2double(img);

figure(1);
imshow(img);


%2. O objetivo é aplicar Laplace, unsharp mask, highboost filtering e Sobel 
%   à imagem para realçar algumas de suas características. Os procedimentos 
%   a serem seguidos são os mesmos adotados na "prática 007". Os valores 
%   das máscaras podem ser obtidos na "aula 8 - Realce de imagens no 
%   domínio do espaço Parte V ".

c = 1;
f_laplace = [0 -c 0; -c 4*c+1 -c; 0 -c 0];
img_laplace = imfilter(img, f_laplace, 'replicate', 'conv');

figure(2);
imshow(img_laplace);


f_gauss = fspecial("gaussian", 9, 2);
img_unsharp_mask = 2*img - imfilter(img, f_gauss, 'replicate', 'conv');

figure(3);
imshow(img_unsharp_mask);


k = 7;
img_highboost = k * (img - imfilter(img, f_gauss, 'replicate', 'conv')) + img;

figure(4);
imshow(img_highboost);


f_sobel_1 = [-1 0 1; -2 0 2; -1 0 1];
img_1_sobel = imfilter(img, f_sobel_1, 'replicate', 'conv');
f_sobel_2 = [-1 -2 -1; 0 0 0; 1 2 1];
img_2_sobel = imfilter(img, f_sobel_2, 'replicate', 'conv');
s = 0.3;
img_final_sobel = img + s * (img_1_sobel + img_2_sobel);
figure(5);
imshow(img_final_sobel);


%3. O que deve ser feito na máscara de Laplace para que seja possível 
%   controlar a intensidade do realce com uma única passada do filtro? Crie 
%   uma função que receba como parâmetro uma variável c, no intervalo 
%   [0,1], que represente a intensidade do realce na imagem final.
%
%   R: A máscara deve implementar uma matriz, tal como a da variável
%      f_laplace com auxílio da constante c que determinará o a intensidade
%      do realce, que passará por todas as posições da matriz da imagem
%      original e obter a nova imagem com o filtro aplicado.
%      O filtro de laplace desenvolvido acima já implementa os requisitos
%      pedidos.
%
