img = imread('pratica3_tur.gif');
tamImg = size(img);
novaImg = uint8(zeros(tamImg(1,1),tamImg(1,2)));
qtdComponentes = -1;
%novaImg = boundary_fill(img, novaImg, 1, 1, 60, 255);

for linha = 2:tamImg(1,1)-1
    for coluna = 2:tamImg(1,2)-1
        novaImg = boundary_fill(img, novaImg, 2, 2, 60, 255);
    end
end
 
imshow(novaImg);


function novaImg = boundary_fill(img, novaImg, linha, coluna, boundary_color, fill_color)
    current_color = img(linha,coluna);

    if (current_color ~= boundary_color || current_color ~= fill_color)
        novaImg(linha,coluna) = fill_color;
        novaImg = boundary_fill(img, novaImg, linha+1, coluna,   boundary_color, fill_color); 
        novaImg = boundary_fill(img, novaImg, linha-1, coluna,   boundary_color, fill_color);
        novaImg = boundary_fill(img, novaImg, linha,   coluna+1, boundary_color, fill_color);
        novaImg = boundary_fill(img, novaImg, linha,   coluna-1, boundary_color, fill_color);
    end
end