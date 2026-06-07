# FidelemApp

## Aplicativo mobile de fidelidade de clientes destinado a mercados. Desenvolvido para projeto de extensão.

### 💡 Objetivo e motivação do projeto
Este projeto surgiu com o objetivo de auxiliar pequenas e médias empresas que trabalham com compra e venda de mercadorias e gostariam de implementar um sistema de fidelização do cliente, oferecendo métodos de pagamento mais flexíveis e sistema de pontos ao realizar compras, o famoso cashback 💵.

### 🔨 Tecnologias utilizadas
* Dart
* Flutter

### ⚙️ Como executar

#### 1. Instalar as dependências
Clone o repositório para a sua pasta desejada, acesse-a e instale as dependências do projeto:
```shell
flutter pub get
```

#### 2. Configurar as variáveis de ambiente
O projeto utiliza configuração baseada em ambientes por meio do recurso `--dart-define-from-file`.
Na pasta `environments`, você encontrará modelos de arquivos para desenvolvimento e produção. Antes de rodar o projeto, você deve criar os arquivos `.json` correspondentes a partir dos templates `.example`:

```shell
cp environments/development.json.example environments/development.json
cp environments/production.json.example environments/production.json
```

Se desejar, abra os novos arquivos `development.json` e `production.json` criados e ajuste o campo `API_BASE_URL` com as suas URLs correspondentes.

#### 3. Verificar o dispositivo conectado
Caso utilize o seu próprio dispositivo físico ou um emulador, verifique se ele foi reconhecido pelo Flutter:
```shell
flutter devices
```

Seu dispositivo deve constar na listagem de saída. Caso precise especificar o dispositivo durante a execução, utilize o identificador dele (por exemplo, `SM A546E` ou seu respectivo `ID_CELULAR`).

#### 4. Executar o aplicativo

Você pode executar o projeto em modo de desenvolvimento ou de produção:

* **Modo de Desenvolvimento:**
  Utiliza as configurações de `environments/development.json` (aponta para a API local por padrão):
  ```shell
  flutter run --dart-define-from-file=environments/development.json
  ```
  *(Se possuir mais de um dispositivo conectado, especifique usando o parâmetro `-d ID_CELULAR`)*

* **Modo de Produção:**
  Utiliza as configurações de `environments/production.json` (aponta para a API de produção por padrão):
  ```shell
  flutter run --dart-define-from-file=environments/production.json
  ```

---

### 📦 Como compilar uma versão release

Para gerar a build final de distribuição do aplicativo utilizando as configurações do ambiente de produção, use o comando correspondente à plataforma desejada:

* **Android (APK):**
  ```shell
  flutter build apk --release --dart-define-from-file=environments/production.json
  ```

* **Android (App Bundle - recomendado para publicação na Google Play Store):**
  ```shell
  flutter build appbundle --release --dart-define-from-file=environments/production.json
  ```

* **iOS:**
  ```shell
  flutter build ipa --release --dart-define-from-file=environments/production.json
  ```

* **Web:**
  ```shell
  flutter build web --release --dart-define-from-file=environments/production.json
  ```

---

### 🛠️ Configuração da IDE (Opcional)

Para facilitar a execução direta pela sua IDE preferida sem precisar digitar os argumentos no terminal:

#### VS Code
Crie ou edite o arquivo `.vscode/launch.json` na raiz do projeto com a seguinte estrutura:
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "FidelemApp (Dev)",
      "request": "launch",
      "type": "dart",
      "program": "lib/main.dart",
      "args": [
        "--dart-define-from-file=environments/development.json"
      ]
    },
    {
      "name": "FidelemApp (Prod)",
      "request": "launch",
      "type": "dart",
      "program": "lib/main.dart",
      "args": [
        "--dart-define-from-file=environments/production.json"
      ]
    }
  ]
}
```

#### Android Studio
1. Acesse **Run** > **Edit Configurations...**
2. Crie ou edite uma configuração de execução do Flutter.
3. No campo **Additional run args**, insira:
   `--dart-define-from-file=environments/development.json` (ou `production.json` para produção).
4. Clique em **Apply** e execute diretamente pelos botões de Run/Debug da IDE.

### 🧑‍💻 Integrantes
* [Arthur Osaka Hoshino](https://github.com/ArthurHoshino)
* [Bruno Koji Nakao](https://github.com/brunokojota)
* [Fernando Manso Isaac](https://github.com/Fernando-MI)
* [Guilherme Silva Piantamar](https://github.com/gpiantamar)
* [João Henrique Guimarães da Silva](https://github.com/joao591)
* [Nikolas Dalton Perassoli Varella](https://github.com/Nikolas-Dalton)
