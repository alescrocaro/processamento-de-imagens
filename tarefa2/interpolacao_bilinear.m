img=imread('pratica2.jpg');

sizeImg = size(img);

linhaNovaImg = sizeImg(1,1)*10;
colunaNovaImg = sizeImg(1,2)*10;

%fator novo%
fatorLinha = size(img,1)/linhaNovaImg;
fatorColuna = size(img,2)/colunaNovaImg;

saida=zeros([linhaNovaImg,colunaNovaImg]);

for linha = 1:linhaNovaImg
    for coluna = 1:colunaNovaImg
        fCoordColuna = floor(fatorColuna * coluna);
        if(fCoordColuna < 1)
            fCoordColuna = 1;
        end
        fCoordLinha = floor(fatorLinha * linha);
        if(fCoordLinha < 1)
            fCoordLinha = 1;
        end
        cCoordColuna = ceil(fatorColuna * coluna);
        cCoordLinha = ceil(fatorLinha * linha);
        
        x_fator = (fatorColuna * coluna) - fCoordColuna;
        y_fator = (fatorLinha * linha) - fCoordLinha;
        
        p1 = img(fCoordLinha, fCoordColuna);
        p2 = img(fCoordLinha, cCoordColuna);
        p3 = img(cCoordLinha, fCoordColuna);
        p4 = img(cCoordLinha, cCoordColuna);
      
        pixel = p1 * (1 - x_fator) * (1 - y_fator) + p2 * x_fator * (1 - y_fator) + p3 * y_fator * (1 - x_fator) + p4 * x_fator * y_fator;
        
        saida(linha,coluna) = pixel;
    end
end


saida = uint8(saida);
  
imshow(saida);