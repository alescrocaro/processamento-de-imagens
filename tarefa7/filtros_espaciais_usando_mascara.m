% 1. A imagem utilizada nesta prática será “pratica7.png”
img = imread("pratica7.png");
img = img(:,:,2);


% 2. Crie um filtro 5x5 (filtro de média ou box filter)
f = ones(5) * 1/25;


% 3. Agora aplique o filtro a imagem
img_com_filtro_5x5 = filter2(f, img);
img_com_filtro_5x5 = uint8(img_com_filtro_5x5);

figure(1);
imshow(img);
figure(2);
imshow(img_com_filtro_5x5);


% 4. Como ficou a borda da imagem depois de aplicado o filtro. Porquê?
%   
%   R: A borda da imagem foi escurecida, pois o filtro aplicado tenta
%      suavizar a imagem (como pode ser visto na figura 2), mas ao tentar
%      suavizar as bordas, utiliza os 'pixels fora da imagem', que na 
%      verdade não existem.
 

% 5. Agora vamos aplicar um filtro 9x9, mas antes vamos inserir pixels nas
% bordas. Para isso, determine os valores de x e y no comando abaixo:
% mpad = padarray(m, [x y], "symmetric");

img_pad = padarray(img, [4 4], "symmetric");


% 6. Vamos usar um filtro um pouco mais elaborado para suavizar a imagem. 
% Vamos usar a distribuição Gaussiana 2D (ou distribuição normal). Uma 
% propriedade que a torna útil é que sua integração de menos infinito a 
% mais infinito é um. Para criar a máscara com os pesos da gaussiana 
% podemos usar (com variância igual a 2):
f_gauss = fspecial("gaussian", 9, 2);


% 7. Agora aplique este filtro na imagem.
img_com_filtro_gauss_9x9 = filter2(f_gauss, img_pad, "valid");
img_com_filtro_gauss_9x9 = uint8(img_com_filtro_gauss_9x9);

figure(3);
imshow(img_com_filtro_gauss_9x9);


% 8. Qual a diferença entre as duas imagens filtradas?
% 
% R: A imagem com o filtro gaussiano (figura 3) ficou um pouco mais suave, 
% com um blur melhor, além de não possuir uma borda preta, como na imagem 
% com filtro 5x5 (figura 2).


% 9. Agora use a função imfilter() do pacote image para as mesmas operações
img_media_imfilter = imfilter(img, f, 'replicate', 'conv');

figure(4);
imshow(img_media_imfilter);


img_gauss_imfilter = imfilter(img, f_gauss, 'replicate', 'conv');

figure(5);
imshow(img_gauss_imfilter);




