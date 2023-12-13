# Começando o Desafio Globo

Definindo as melhores práticas de desenvolvimento com `Vanilla JS`, `HTML5` e `CSS`.
Não serão utilizados frameworks para explorar meu potencial de adaptação em equipes diversas.

Como estou bem acostumado com `TypeScript` pode ser que o utilize no projeto.

(UPDATE): Decidi utilizar `Vanilla JS` + `JSDoc` para tipagem e deixar o projeto mais vanilla possível.

## Estruturando o Aplicativo

1. Header
2. Main (Matéria em Foco)
3. Section (Lista de Matérias)
4. Aside (Agrupador de Notícias)
5. Footer

### Criando um WebComponent para a Section de Lista de Matérias

Decidi criar um WebComponent pra encapsular tudo que fosse responsável por essa secção, assim tornando o componente um
**micro-frontend**.

Encapsulei os estilos usando um `Shadow DOM` para testar algumas coisas tendo em vista que foi a primeira vez que fiz
um `WebComponent` mais complexo, anteriormente havia trabalhado com `WebComponents` mais como `CustomElements` na plataforma
**WIX**.

### Adicionando a publicidade

Nada muito complexo, apenas usando o index para jogar uma propaganda à cada `8` notícias, o ideal era criar em endpoint para fornecer essas propagandas de forma dinâmica, simulando a contratação de espaço publicitário na página principal. Por enquanto somente um placeholder foi colocado.

### Criando um Modal para os vídeos

Criei um modal utilizando `dialog` que já inclui acessibilidade e backdrop para maior facilidade.

Existe uma função no `WebComponent` que usa o modal do `document` pra poder exibir fora no componente.

Ao fechar o modal ele para o vídeo que estiver em execução, talvez seja necessário pegar todos os vídeos da página principal e fazer um loop para pausar todos, pra evitar que qualquer outro possa estar em execução em segundo plano.

### Desenvolvimento da página principal

Decidi utilizar a forma mais simples de desenvolvimento Vanilla, apenas pegando os elementos e os modificando de acordo com a necessidade.

Criei na API um endpoint para pegar 3 notícias, simulando pegar as 3 notícias mais lidas no momento, algo interessante para colocar na seção principal.

### Criação de conteúdos relacionados

Resolvi fazer um novo fetch para a API no intuito de simular uma busca por notícias relacionadas, utilizei o mesmo endpoint das top 3 notícias de forma randômica. São 3 fetchs no total, um das 3 matérias do top, 1 do component `news-list` e 1 dos conteúdos relacionados.

### Finalizando com Responsividade Mobile.

Adicionei apenas uma `media query`, que é que tem no site G1 hoje, fiquei satisfeito com o resultado da responsividade, embora eu ainda pudesse melhorar de forma considerável.

### Agradecimentos

Agradeço à todos a oportunidade de participação no desafio, que foi não foi só um desafio técnico, mas também um desafio físico de mental, uma semana difícil, onde todos os trabalhos acumularam, mas por sorte, hoje dia 09/12 foi feriado em minha cidade, e resolvi fazê-lo nesse tempo livre, em torno de 8h.

# Guia de instalação

Primeiramente, na pasta `Api`, instale o servidor utilizando o seguinte comando:

`yarn ou npm install`

Depois é só executá-lo com o comando:

`yarn start ou npm run start`

Posteriormente, basta instalar o servidor `http-server` utilizando o seguinte comando:

`yarn ou npm install`

Depois basta rodá-lo com o comando:

`yarn dev`


# O que faria se tivesse mais tempo?

- Melhorar e testar tratamento de erros, principalmente os fetchs da API.
- Fazer testes unitários, principalmente no componente `<news-list />`
- DRY (alguns códigos podem ser abstraídos para funções mais genéricas e puras)
- Adicionar loading states para os componentes.
- Melhoraria o código de inserção de publicidade, fazendo a API já retornar a posição da publicidade, movendo a da regra de negócios para a API, facilitando a modificação simples sem mexer no front.
- Melhorar o loading de imagens, pra otimizar performance.
