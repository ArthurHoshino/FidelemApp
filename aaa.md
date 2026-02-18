Alterações:

- Cores
	Agora existe uma classe pra armazenar as cores (import 'package:fidelem_app/core/tema/tema.dart'( 
    voce importa esse tema.dart e usa Cor.preto, Cor.vermelho, etc. Se n tiver a cor q vc precisa,
    acessa esse arquivo e add la

- Classes
    Agora as classes estão mais ou menos em portugues q vai ser o padrao

- Views 
    estão mais simples e foram quebrados em blocos menores. agr tem a view e a pasta componentes

- Models
    apenas a pagina de loja e carrinho (cliente( estao com models. falta adicionar nas homes, edit produto, add produto,

- ViewModels
    apenas a pagina de loja e carrinho (cliente( estao com viewmodels. falta adicionar nas homes, edit produto, add produto,

- Testes
    existe uns arquivos de teste (import 'package:fidelem_app/core/data/test/...'( pra usar por agora

- Pastas
    agora ta organizado desse jeito ai:

    lib
    - core
      - assets
        - logo
        - teste
      - data
      - tema
      - widgets
        - teste
      - modules
        - app
        - auth
          - login
          - redefinir_senha
          - registro
        - cliente
          - carrinho
          - comuns
          - home
          - loja_pontos
        - config
        - mercado
          - home
          - inventario

- Base View
    a base view agora ta separado em 2 tipos, a de cliente e a de mercado. a diferença é basicamente as rotas e icones. obs 
    a pagina de home do mercado ta um pouco diferente pq ela tem um botao para ir para a pagina de add item, pra syncar isso
    com a bottom nav bar da base view eu só passei a func pra classe da home de mercado, por isso q ta diferente.

- Cliente / Carrinho 
    foi separado em models viewmodels e view. agr tem 4 pastas, uma de view outra de model, viewmodel e componentes. a view foi separada em card e grid

- Cliente / Home
    como tinha um componente q a loja usava tbm, criei uma pasta chamada
    lib/core/modules/cliente/comuns onde tem o fid_banner(o carrossel(. agora na pasta de componentes dessa pagina, tem o card e o grid.
    o card cria 1 card e o grid coloca eles numa grid ![emoji](https://media.tenor.com/dvCEkNAX81UAAAAj/crazy-smiley-tongue-out-emoji.gif).

- Cliente / Loja
    foi separado em models viewmodels e view. a view foi separada em filtros, card e grid

- Mercado / Home
    a view foi dividida em componentes menores, agora o botao de add foi syncado com a base view.

- Mercado / Add ou Edit produto
    na parte de mercado tinha a parte do fernando q era de add e edit. ainda tem as duas paginas, mas juntei em um arquivo só 
    pra conseguir acessar as views agora vc usa isso daq:

    AddEditView(isEditing: false),
    AddEditView(isEditing: true),

    isEditing: false => pra adicionar produtos
    isEditing: true => pra editar produtos

    como tinha mta repetição e a view tava gigante, a view virou 3 arquivos. a propria view, add_edit_card e add_edit_imagens.
    os controladores tao só existindo ainda.
