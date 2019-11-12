# FTL079-Digital_Image_Processing

Projetos desenvolvidos em MATLAB para a disciplina de Processamento Digital de Imagens da UFAM, ministrada pela Professora Drª Marly Fernandes Costa. Os projetos tem objetivo de fixar os conceitos, fundamentos e campo de aplicação da área de processamento digital de imagens, além de possuir implementações das principais técnicas de processamento digital de imagens tais como ferramentas de filtragem, de análise, de segmentação e de realce de imagens em escala de cinza e de imagens true color, nos domínios espaciais e da frequência. 
## Getting Started

Cada projeto está principalmente relacionado com alguns conceitos apresentados no livro Digital Image Processing de Rafael C. Gonzales e Richard E. Woods e na sala de aula.

```
[1] GONZALEZ, Rafael C. et al. Digital image processing [M]. Publishing house of electronics industry, v. 141, n. 7, 2002.
```
### Prerequisites

Para testar os scripts e funções, a máquina deve possuir o sofwtare de desenvolvimeto MATLAB.

### Project#1

Objetivo: familiarizar com o MATLAB. Em particular, é feito:leitura, exibição e gravação (armazenamento) de imagens. No script é feito os seguinte passos:

- [X] Obtenção do tamanho (M,N) de uma imagem fornecida;
- [X] obtenção do valor médio das intensidades do nível de cinza;
- [X] Obtenção do valor do número de bits utilizado para armazenar cada pixel;
- [X] Obtenção da taxa de compressão se a mesma estiver comprimida;
- [X] Exibição da imagem em uma janela;

### Project#2

Objetivo: Gerar funções em matalb que extraia os valores de intensidade do pixel de imagens em escala de cinza.
Assim foi desenvolvido as funções:
- [X] Que retorna a intensidade do pixel, f(r,c), dado a posisão r e c
> v = pixVal4e(f,r,c)
- [X] Que retorna as coordenadas, r e c, e a intensidade do pixel, v, após o click do mouse sobre a imagem exibida em uma janela. 
> [r,c,v]=cursorValues4e(f)

Também foi implementado um script para testar as funções.

### Project#3

Objetivo: Verificar os efeitos da variação (redução) do número de níveis de intensidade em uma imagem digital.
Desta forma foi desenvolvido um script que reduzia o número de intensidades de uma imagem em escala de cinza de 256 para 2 em potências inteiras de 2, enquanto a resolução da imagem era constante.
```
Foi usado o imshow() com [] para ajustar a faixa dinâmica da imagem
```

### Project#4

Objetivo: Escrever uma função *g=imagescaling(f,cx,cy)*, onde f é uma imagem em escala de cinza e cx e cy são fatores de escala positivos ao longo das direções x (vertical) e y (horizontal), respectivamente. 
Foi feito um script-função para fazer o escalonamento (resize) de imagens. Como teste, foi redimensionado a imagem girl.tif para metade.

### Project#5

Objetivo: Gerar o histograma de uma imagem em escala de cinza de 256 níveis.
A função, *imageHist4e(f,mode)*, recebe dois parâmetros que é a matriz da imagem, f, e o modo do histograma, se é normalizado ou não-normalizado.

### Project#6

Objetivo: Implementar uma função, *histEqual4e(f)*, de equalização de imagens, com intuito de melhorar o contraste da imagem com uma melhor distribuição dos pixels.
Analisando os resultados dos testes concluímos que os resultados foram satisfatórios, como equalização é apenas uma ferramenta para aumento do contraste nenhuma intensidade foi criada no processo, também os histogramas obtidos não perfeitamente uniformes. Contudo o resultado permitiu notar significativos detalhes, demonstrando que essa técnica é útil para o realce do contraste

### Project#7

Objetivo: Escrever uma função *g=imagePad4e(f,r,c,padtype)*, para preenchimento de imagem, f, com r linhas acima e abaixo da imagem e c colunas à esquerda e à direita. Se padtype = 'zeros', ou for omitido do argumento, a função implementa zero padding. Se padtype = 'replicar', ela replica o preenchimento.

### Project#8

Objetivo: Desenvolver uma função *g=twodSFilter(f,w)*, para executar a filtragem espacial 2-D de imagens, f e kernel, w. Essa função usa preenchimento de replicação por padrão. Também , por padrão, re-escala a entrada no intervalo [0,1].
A implementação foi testada com um filtro passa-baixo (filtro espacial médio) para reduzir as intensas variações de intensidade com w = 3X3, 11x11 e 21x21, aplicando-se na imagem testpattern1024.tif.

### Project#9

Objetivo: Ler uma imagem (polymercell.tiff) e implementar qualquer um dos métodos de segmentação aprendidos em sala para extrair os limites das maiores “bolhas” da imagem.
Foi escolhido desenvolver o operador de Prewitt, as bordas das duas maiores bolhas foram extraídas satisfatoriamente mas a o método poderia ter sido outro como o operador Sobel que aplica uma suavização inicial.

### Project#10

Objetivo: Realizar os procedimentos abaixo:
1. Escrever uma função *g = globalThresh(f, detT)* que implementa a segmentação via limiar global apresentada na turma. A imagem de entrada deve ser dimensionado automatica- mente para o intervalo [0,1]. Use ∆T = 0, 01 como padrão para este parâmetro. 
2. Ler a imagem rice-shaded.tif e limiarize-a usando globalThresh com seu configurações padrão. Explique as razões de quaisquer erros. 
3. Expicar se existem outros valores de ∆T além do padrão que foi usado em (2) que poderia potencialmente melhorar o resultado de (2).

Analisando os resultados pelas imagens de teste e respondendo quesito 3 sobre o valor de ∆T concluo que não há necessidade de outros valores se o valor for um pouco maior o ruı́do detectado é maior, contudo se diminuirmos o valor alguns objetos começaram a não ser detectado. Se o valor se aproxima de zero o tempo de convergência é muito longo, uma forma para melhorar a extração dos objetos seria usar uma outra técnica de estimação do limiar inicial e de atualização do limiar que é via média dos grupos com intensidade 0 ou 1.

### Project#11
Objetivo: Escrever uma função *g=colorSpaceConv(f, 'método')* que converte a imagem colorida f no modelo designado pelo método, que é uma sequência com os valores possíveis: 'rgb2cmy', 'cmy2rgb', 'rgb2cmyk' e cmyk2rgb;
Após os testes e analisando os resultados pelas imagens a principal diferença é apresentada nas funções com o método 'cmy2rgb' e 'cmyk2rgb'. A imagem aplicada são bem semelhantes, o retorno delas é bem visível a diferença no centro do girassol, na CMYK os detalhes pretos são mais visíveis enquanto que na CMY são um pouco azulados. 

### Project#12
Objetivo: Converter entre espaços de cores RGH e HSI
1. Escrever uma função *rgb2hsi* para converter imagens RGB em HSI 
2. Escrever uma função *hsi2rgb* para converter imagens HSI em RGB

### Project#13
Objetivo: Nesse projeto é feito uma filtragem no domínio da frequência para realçar os detalhes finos, como as bordas dos ossos. Dois processos são implementados em MATLAB, o primeiro com um filtro gaussiano e o segundo com um filtro passa-alta de enfase.

### Seminários

A equipe dos seminários foi formada pelos alunos:
- Dimerson Lucas Oliveira Coelho
- Pedro Henrique Dos Santos Iunes
- Jerônimo Ximenes do Prado Neto
- Pedro Victor Dos Santos Matias (me)

#### Seminário 1 
Os tópicos do seminário foram: *Processamento morfológico em imagens binárias*
Para cada tópico havia sido acordado implementar os operadores, foram publicados todos, contudo **somente os tópicos marcados tiveram suas implementações que foram testadas e validadas.**

[ ]. A transformada hit or miss
[ ]. Preenchimento de buracos
**[X]. Extração de components conexos (apresentado e códigos desenvolvidos por mim)**
[ ]. Afinamento →
[ ]. Esqueletos
[ ]. Poda →
**[X]. Reconstrução geodésica (apresentado e códigos desenvolvidos por mim):
   [X] Dilatação geodésica
   [X] Erosão geodésica**






#### Seminário 2: 
Os tópicos do seminário foram: *Morfologia matemática em escala de cinza*
[ ] Erosão e dilatação -> Abertura e fechamento
[ ]. Algoritmos morfológicos básicos
**[X]. Reconstrução morfológica em níveis de cinza (apresentado e códigos desenvolvidos por mim):
  [X] Reconstrução morfológica por dilatação
  [X] Reconstrução morfológica por erosão
  [X] Abertura por reconstrução
  [X] Fechamento por reconstrução**

