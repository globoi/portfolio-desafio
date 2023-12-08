
# Começando o Desafio Globo

Definindo as melhores práticas de desenvolvimento com `Vanilla JS`, `HTML5` e `CSS`.
Não serão utilizados frameworks para explorar meu potencial de adaptação em equipes diversas.

Como estou bem acostumado com `TypeScript` pode ser que o utilize no projeto.

# Estruturando o Aplicativo

1. Header
2. Main (Matéria em Foco)
3. Section (Lista de Matérias)
4. Aside (Agrupador de Notícias)
5. Footer

# Criando um WebComponent para a Section de Lista de Matérias

Decidi criar um WebComponent pra encapsular tudo que fosse responsável por essa secção, assim tornando o componente um
microserviço.

Encapsulei os estilos usando um `Shadow DOM` para testar algumas coisas tendo em vista que foi a primeira vez que fiz
um `WebComponent` mais complexo, anteriormente havia trabalhado com `WebComponents` mais como `CustomElements` na plataforma
**WIX**.