Precisamos organizar algumas coisas... algumas muitas coisas antes de continuar o desenvolvimento.

### Coisas gerais, ambos os fluxos
Basicamente organizar o fonte inteiro além de aplicar algumas padronizações porque misericórdia cada um fez o código de um jeito diferente, mas assim... muito diferente. Então:
**Geral**
- Padronizar o desenvolvimento, estamos com muitas formas diferentes de codificação, desde o padrão IA até "Random bullshit go".
	- Colocar tudo em português
- Fazer a navegação da barra inferior de maneira mais inteligente. Gostei da forma como o Bruno fez, mas a lista das views me preocupa um pouco em questão de reutilização de código e de deixar pontas em vários lugares. Vejamos se não seria mais interessante passar essa lógica para o `routes.dart` e fazer alguns enums ou objetos que vão armazenar quais os dados de tela para cada fluxo, semelhante ao `EDadosVeiculo` no Talão, por exemplo.
- Adicionar validação do tipo de conta ao fazer login e redirecionar para o fluxo correto. Também será necessário criar uma propriedade estática na tela principal (splash) para podermos identificar se estamos no fluxo do cliente ou do mercado.
- Padronizar a nomenclatura das pastas e classes entre as duas telas de home.
**Tela de login e registro**
- Está com diferença na cor dos pop-ups de alerta
- Se eu clicar em encerrar sessão e voltar, ele volta logado auhasuhsauh -> implementar o controle de sessão.
	- Fazer o controle de login no local, mas manda a auditoria que o usuário fez login, porque tem que estar registrado

### Fluxo Mercado
**Tela de inserção e edição de produtos**
- Bloquear os campos de preço e quantidade para somente números
- Adicionar um botão de retorno no topo da página
- Alguma forma de inserir os dois tipos de preço (dinheiro ou ponto)
- Padronizar o placeholder dos campos de input das telas de inserção e edição. Eu acho que as modificações que o João fez para ajustar os campos na tela de login já resolvem... mas é bom dar uma verificada.
- A tela ficou meio esquisitinha, não...? Não do que fizeram, mas o design logo no começo parecia meio fora do padrão.
**Tela de configuração**
- Clicar em "cancelar" está sempre indo pra tela de login. Tem que identificar qual das duas telas chamaram ela.
**Tela home do mercado:**
- A imagem nos cards tem que ficar centralizadas, mas o texto tem que ficar na esquerda (a imagem também está na esquerda)
- Deixar os cards padronizados, ou seja, o texto tem que estar fixo e na borda inferior do card
- Remover o espaço excessivo em baixo dos produtos
**Tela de config e home do mercado**
- Se eu estiver na tela de config e clicar no botão de voltar ele volta pra home, mas a barra inferior não marca corretamente o ícone "Home"

### Fluxo Cliente
**Tela Home**
- Quando tivermos mais estrutura, adicionar o valor da promoção e o valor normal riscado
**Tela de loja**
- Será melhor decidir o que faremos com o carrossel: se vai ter as mesmas promoções ou se irá mostrar as categorias pro cara escolher filtrar por elas
- Deixar o texto dos filtros rápidos ("Mais vendidos", etc.) centralizado no espaço entre a borda e a seta
- A barra de separação do preço em dinheiro e de ponto está muito pra baixo

---
## Padronizações
### routes.dart
- Todas as rotas em português e se tiver mais de uma palavra, separar por hífen `-`.
- Os nomes das variáveis também deverão estar em português, mas em camel case.
- Manter organizado a separação das rotas entre fluxo do cliente e do mercado.

### Tela Home
#### Primeiro ponto: existência de duas tela Home
Como existem duas, os arquivos vão ter que refletir isso. Vão existir páginas que vão ser específicas para cada uma delas, mas outras que poderão ser acessadas por ambos os fluxos (configurações, por exemplo). Nesse caso precisamos de um controle para onde a tela será redirecionada quando clicar em "voltar" ou coisa do tipo. Eu penso em criar os arquivos de ambos com o mesmo nome `home_view.dart`, mas o que vai diferenciar é o caminho, então teríamos
- `home/cliente/home_view.dart`
- `home/mercado/home_view.dart`
Eu acredito que dê para montar o caminho para os arquivos de maneira "dinâmica" e assim poderemos acessar ambos os arquivos trocando apenas em qual pasta ele via acessar.
#### Segundo: código de IA e padronização do projeto (de novo)
A estrutura de código montada para a tela home do fluxo de mercado não possui um componente criado para o nosso sistema, componentes de input que poderiam ter sido reutilizados foram "criados do zero", o que não havia nenhuma necessidade. Em resumo, a tela home do mercado vai precisar ser refeita, talvez não completamente do zero, mas boa parte.

Além disso, temos nomes de variáveis em inglês e variáveis de cor para colocar na tela. Criar uma variável de cor em uma página específica mata a reutilização e sendo que é uma cor que deverá ser utilizada por todo o sistema para seguir uma padronização. Com isso, será necessário criar uma classe para armazenar as cores padrões do sistema para que seja utilizado sempre que necessário e não tenha que instanciar em cada lugar.

Foi também criada uma classe `_Badge` para o que, eu acredito, ser o ícone do botão "Filtar" ou algo assim. Voltamos na questão de componentização e padronização do sistema, pois estamos criando uma classe (componente) em um lugar, tornando-o exclusivo daquela tela, entretanto é algo que poderia ser utilizado em outras tela, por exemplo a tela de loja que também tem um botão para filtro.

#### Home cliente
(Esperando anotações do Bruno)

### Tela de inserção/edição dos produtos
Estamos com duas telas essencialmente iguais, sendo a diferença entre as duas é que uma tem dados já preenchidos e a outra não, foram o título da página e tals. Eu quero que seja feita uma `view` só com uma lógica identificando a diferença entre as duas telas e trocando títulos e tals.

Sobre a inserção automática das informações de produtos será deixado em stand-by **por enquanto** e vamos focar nela quando for feito também a tela de estatísticas (essa vai sair, com certeza).

Quero também melhorar o design da tela, porque meu amigo tá bem fora da identidade do aplicativo (a tela de config também).

Bloquear o teclado para apenas numérico na inserção dos valores do produto.

### Tela de configuração
Passar a utilizar o nome do mercado que vier do banco de dados. Eu acredito que isso será feito após a sincronia para o banco local, eu não acho que será interessante ficar consultando a API toda vez que abrir a tela de configuração.

Mesma questão de nomes de variáveis em inglês e definição de cores dentro da página ao invés de uma classe geral que pode ser importada em qualquer lugar.

Eu acho que é menos um problema aqui, mas seria interessante transformar cada opção da tela de configuração em um componente. Não é necessário, mas seria legal com um exercício (e porque eu acho que quero implementar parâmetros, mais detalhes a frente).

### Tela de carrinho
Nomes em inglês... 😠
E tem alguns métodos de atualização de quantidade e valores que deveria estar na `viewmodel`.

A separação das páginas de forma de pagamento e sucesso no pagamento me parece certo, mas aqui temos outra questão que abre possibilidade para uso de parâmetros que são as opções de pagamento.

Gostei da criação de componentes e como são itens específicos para o fluxo de pagamento eu acho que podemos deixar aqui. A menos que sejam componentes que tenham algo parecido em algum outro lugar no sistema, nesse caso passamos para a `core` e parametrizamos o resto do conteúdo dentro do componente.

### Login, registro e redefinição de senha
- Componentizar o messanger de erro que aparece.
- Adicionar lógica de verificação de tipo de conta e não deixar o "voltar" do Android voltar para a tela de configuração depois de clicar em "sair".
Esse controle de login eu quero fazer localmente mesmo, criando um registro local ou um arquivo mesmo com informação de data de login. Se ele estiver vencido, não será possível fazer o login automático e tals.
