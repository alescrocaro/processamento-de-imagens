img = imread('pratica2.jpg');

sizeImg = size(img);

%duas próximas linhas definem qual será o fator para criar a nova imagem%
linhaNovaImg = sizeImg(1,1)*10;
colunaNovaImg = sizeImg(1,2)*10;

novaImg = uint8(zeros(round(linhaNovaImg),round(colunaNovaImg)));

for coluna = 1:colunaNovaImg
    for linha = 1:linhaNovaImg
        coordLinha = ceil(linha*sizeImg(1,1)/linhaNovaImg);
        coordColuna = ceil(coluna*sizeImg(1,2)/colunaNovaImg);
        
        novaImg(linha,coluna) = img(coordLinha, coordColuna);
    end
end

imshow(novaImg);
