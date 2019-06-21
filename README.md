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

Objetivo: 

### Project#5

Objetivo: 

### Project#6

Objetivo: 

### Project#7

Objetivo: 

### Project#8

Objetivo: 
