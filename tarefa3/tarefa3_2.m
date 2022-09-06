img = imread('pratica3_reg.gif');
tamImg = size(img);
pixelVisitado = false(size(img));
novaImg = uint8(zeros(tamImg(1,1),tamImg(1,2)));
label = 255;
qtdComponentes = -1;

for linha = 1:tamImg(1,1)
    for coluna = 1:tamImg(1,2)
        %marca pixel como visitado
        if img(linha,coluna) == 0
            pixelVisitado(linha,coluna) = true;

        %se pixel ja foi visitado, faz nada
        elseif pixelVisitado(linha,coluna)
            continue;
     
        else
            %inicia pilha com localização atual
            pilha = [linha coluna];

            while ~isempty(pilha)
                %desempilha
                pos = pilha(1,:);
                pilha(1,:) = [];
                
                %se pixel visitado, faz nada
                if pixelVisitado(pos(1),pos(2))
                    continue;
                end
                
                %marca posicao como visitada
                pixelVisitado(pos(1),pos(2)) = true;
                novaImg(pos(1),pos(2)) = label;
                
                %4-conectada
                pos_y = [pos(2)-1; pos(2)+1; pos(2); pos(2)];
                pos_x = [pos(1); pos(1); pos(1)-1; pos(1)+1];
                
                %8-conectada
                %[pos_y, pos_x] = meshgrid(pos(2)-1:pos(2)+1, pos(1)-1:pos(1)+1);
                %pos_y = pos_y(:);
                %pos_x = pos_x(:);

                %lida com posicoes fora de 'alcance'
                out_of_bounds = pos_x < 1 | pos_x > rows | pos_y < 1 | pos_y > tamImg(1,2);
                pos_y(out_of_bounds) = [];
                pos_x(out_of_bounds) = [];

                %se livra das pos 0
                is_1 = img(sub2ind([tamImg(1,1) tamImg(1,2)], pos_x, pos_y));
                pos_y(~is_1) = [];
                pos_x(~is_1) = [];
                
                %coloca posicoes restantes a pilha
                pilha = [pilha; [pos_x pos_y]];
            end

        %regiao explorada completamente
        novaImg(linha, coluna) = label;
        label = label - 30;
        qtdComponentes = qtdComponentes + 1;
        end
    end
end   

imshow(novaImg);
qtdComponentes
