
# Começando o Desafio Globo

Definindo as melhores práticas de desenvolvimento com `Vanilla JS`, `HTML5` e `CSS`.
Não serão utilizados frameworks para explorar meu potencial de adaptação em equipes diversas.

Como estou bem acostumado com `TypeScript` pode ser que o utilize no projeto.

(UPDATE): Decidi utilizar `Vanilla JS` + `JSDoc` para tipagem e deixar o projeto mais vanilla possível.

# Estruturando o Aplicativo

1. Header
2. Main (Matéria em Foco)
3. Section (Lista de Matérias)
4. Aside (Agrupador de Notícias)
5. Footer

# Criando um WebComponent para a Section de Lista de Matérias

Decidi criar um WebComponent pra encapsular tudo que fosse responsável por essa secção, assim tornando o componente um
**micro-frontend**.

Encapsulei os estilos usando um `Shadow DOM` para testar algumas coisas tendo em vista que foi a primeira vez que fiz
um `WebComponent` mais complexo, anteriormente havia trabalhado com `WebComponents` mais como `CustomElements` na plataforma
**WIX**.

# Adicionando as propagandas

Nada muito complexo, apenas usando o index para jogar uma propaganda à cada `8` notícias, o ideal era criar em endpoint para fornecer essas propagandas de forma dinâmica, simulando a contratação de espaço publicitário na página principal. Por enquanto somente um placeholder foi colocado.

# Criando um Modal para os vídeos

Criei um modal utilizando `dialog` que já inclui acessibilidade e backdrop para maior facilidade.

Existe uma função no `WebComponent` que usa o modal do `document` pra poder exibir fora no componente.

Ao fechar o modal ele para o vídeo que estiver em execução, talvez seja necessário pegar todos os vídeos da página principal e fazer um loop para pausar todos, pra evitar que qualquer outro possa estar em execução em segundo plano.

# Desenvolvimento da página principal

Decidi utilizar a forma mais simples de desenvolvimento Vanilla, apenas pegando os elementos e os modificando de acordo com a necessidade.

Criei na API um endpoint para pegar 3 notícias, simulando pegar as 3 notícias mais lidas no momento, algo interessante para colocar na seção principal.

# Criação de conteúdos relacionados

Aqui o ideal