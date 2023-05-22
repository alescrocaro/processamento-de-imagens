% 1 e 2

a = imread("pratica10_vish.png" );
figure, imshow(a);
b = padarray(a, size(a), "post");
c = im2double(b);
%fft2 retorna a transformada de fourier 2d
d = fft2(c);
%faz o shift usando zeros no array da transformada, ou seja, centraliza as
%frequencias baixas do espectro
d = fftshift(d);
%figura 1 eh o espectro, que resulta do shift no fft
figure(1);
imshow(uint8(abs(d)));
imwrite(uint8(abs(d)), 'img.png');

% 5

%cria matriz de zeros do tamanho de b
h = zeros(size(b));
%n e m recebem os tamanhos horizontal e vertical da imagem
[n, m] = size(b);
%os fors abaixo vão 'percorrer' a imagem e calcular a gaussiana de cada 
%ponto dela, resultando em um espectro filtrado pela gaussiana
for i = 1:n
    for j = 1:m
        h(i,j) = H(i,j,size(b),50);
    end
end

figure(2);
imshow(im2uint8(h));


% 6

%Multiplica todas as posições da transformada de fourier pelas da gaussiana
%exemplo: pos1 x pos1 , pos2 x pos2 ...
g = d.*h;


%7

%como foi feito usando logaritmo natural da img, é revertido o processo
%inverte o shift
g = ifftshift(g);
%inverto a transformada
at = ifft2(g);
%retorna valor absoluto do resultado
at = abs(at);
%x e y recebem os tamanhos horizontal e vertical da imagem
[x, y] = size(a);
atc = at(1:x,1:y);
figure(3);
imshow(im2uint8(atc));


% 8 

%Os comandos abaixo são para visualizar a transformada como uma superfície 
%tridimensional
tx = linspace (1, size(d, 1), size(d, 1))';
ty = linspace (1, size(d, 2), size(d, 2))';
figure(4)
mesh(tx, ty, log(1+abs(d))');


% 9

%Que tipo de filtro foi aplicado na imagem? Como o parâmetro d0 da função 
%H afeta o resultado?

    %foi aplicado gaussiana
    %Quanto maior o valor de d0, mais nítida é a imagem.


%10

%Agora abra a imagem "pratica10_vish.png”. Como eliminar (reduzir) o 
%quadriculado?
%Descreva uma possível solução. Como implementá-la?

    %encontrar um espectro adequado, que remova os quadriculados, fazer uma
    %mascara

a = imread("pratica10_vish.png" );
figure, imshow(a);
b = padarray(a, size(a), "post");
c = im2double(b);
d = fft2(c);
d = fftshift(d);
mask1 = imread("espectroarrumado.png" );
mask1 = im2double(mask1);
g = d.*mask1;
g = ifftshift(g);
at = ifft2(g);
at = abs(at);
[x, y] = size(a);
atc = at(1:x,1:y);
figure(5)
imshow(im2uint8(atc))




%funções


% 3

%A função abaixo calcula a distância euclidiana do ponto (u,v) até o 
%centro da imagem de tamanho s.
function res = D(u,v,s)
    res = sqrt((u-s(1)/2)^2+(v-s(2)/2)^2);
end


% 4

%A função abaixo calcula a Gaussiana em um ponto específico da imagem. 
%Parametros: 'u' e 'v' se referem a um ponto, s é o tamanho da imagem e
%d0 é o desvio padrão da gaussiana
function res = H(u,v,s,d0)
    res = exp(-((D(u,v,s))^2/(2*d0^2)));
end
