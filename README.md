# Desenvolvendo REST / RESTful APIs com Ruby on Rails

Aprenda a criar uma aplicação completa com Ruby on Rails API-only.

* Criar uma aplicação completa com Ruby on Rails API-only.
* Conhecer o Active Model Serializer.
* Usar a especificação JSON:API em toda a aplicação desenvolvida.
* Fazer Paginação com Rails API.
* Versionar uma aplicação Rails API.
* Fazer autenticação com Token, JWT e Devise.
* Usar Cache para as aplicações Rails API.
* Conhecer sobre Rack Middleware.
* Usar TDD no desenvolvimento de uma aplicação Rails API.

URL do curso -> [Desenvolvendo REST / RESTful APIs com Ruby on Rails](https://www.udemy.com/course/rubyonrails-api/)

## :computer: Linguagens Usadas
<div>
    <img alt='Ruby Logo' height='60' width='50' src='https://raw.githubusercontent.com/get-icon/geticon/fc0f660daee147afb4a56c64e12bde6486b73e39/icons/ruby.svg' />&nbsp;
    <img alt='Rails Logo' height='60' width='50' src='https://raw.githubusercontent.com/get-icon/geticon/fc0f660daee147afb4a56c64e12bde6486b73e39/icons/rails.svg' />&nbsp;
</div>

> Explicação do Código de cada capítulo dentro dos commits.

***

## 01 - Introdução ao Rails / API-only

### 01 - New Entity | Migration | Create and Execute Tasks
* Criar uma entidade digitando `rails g scaffold ENTITY ATTRIBUTES`.
* Rodar o projeto com `rails s`.
* Realizar uma ***migration*** com `rails db:migrate`.
* Listar todas as **tarefas** com `rails -T`.
* Gerar uma tarefa com `rails g task TASK_NAME`.
* Rodar uma tarefa com `rails TASK_NAME`.

### 02 - Status Code | Response Parameters
* Setar o ***Status Code*** de uma resposta de uma requisição **HTTP**.
* Configurar o projeto para ser compilado toda vez que haver mudança no código com `config.file_watcher = ActiveSupport::FileUpdateChecker`.
* Setar parâmetros para a resposta da requisição:
    * `root: true`: Enviar o tipo do objeto.
    * `only: [:name, :email]`: Enviar somente *X* atributos.
    * `except: [:name, :email]`: Enviar exceto *X* atributos.
* Adicionar atributos extras com:
```ruby
render json: @contacts.attributes.merge({ author: "Jackson" })
```
* Adicionar métodos:
```ruby
render json: @contacts, methods: :author
```
* Redefinir a exibição **JSON** com
```ruby
class X
    def as_json
        ...
    end
end
```

### 03 - Migration | Object References
* Gerar um objeto que é referenciado em outro objeto com `rails g scaffold Kind description:string`.
* Criar uma ***migration*** com `rails g migration add_kind_to_contact kind:references`, onde o `kind:references` diz que vai ser criado um novo atributo que referencia outro objeto.
> IMPORTANTE! É necessário primeiro criar o objeto no qual vai ser referenciado, e só depois criar uma migration referenciando o objeto.
* Resetar o banco com o comando `rails db:drop db:create db:migrate dev:setup`.
> No Windows, é necessário executar o "db:drop" como "db:drop:_unsafe".
* Realizar a associação na classe que vai referênciar outro objeto.

### 04 - JSON Response Formats
* Formatar **JSON** no corpo do *response*.

### 05 - Create "Contact" without an Kind and Allow "null" Values
* Deixar um objeto de dependência através do **JSON** no **POST** opcional.
* Permitir valores **nulos** excluindo o parâmetro `null: false` no *db/schema.rb*.
* Permitir outros parâmetros adicionando no arquivo de *controller* da classe.

### 06 - Locale e I18n
* Definir o ***Locale*** da aplicação.
* Listar atributos de acordo com o ***Locale*** do **I18n**.

### 07 - Association has_many
* Criar um nova entidade sem rota de API com `rails g model ENTITY ATTRIBUTES ATTRIBUTE:references`.
* Criação da nova classe ***`Phone`***.
* Associar um `Contact` em um `Phone`.

### 08 - Accept Parameters with I18n
* Fazer a impressão dos valores **JSON** informando parâmetros e usando métodos com relação ao **I18n** que sobrescrevem o **JSON**.

### 09 - Nested Attributes with has_many and CRUD
* CRUD de uma entidade com objetos aninhados.
* `_destroy`.
* *pry-rails* para facilitar na leitura pelo console.

### 10 - Address Creation & CRUD with has_one
* Criação do ***`Address`***.
* Não permitir a criação de um novo dado atrelado à um objeto com `update_only: true`.

***

## 02 - Active Model Serializers

### 01 - Routes of the Relationships
* Requisições só serem aceitas caso o retorno seja do tipo **JSON**.
* Achar o `Kind` através de um `Contact`.
* Criação de relacionamentos e rotas do `belongs_to`.
* Criação de relacionamentos e rotas do `has_many`.
* Criação de relacionamentos e rotas do `has_one`.

### 02 - Routes of the Address (has_one)
* Criação de rotas para o `Address`.

### 03 - Routes of Phones (has_many)


***

## 03 - HTTP Authentication

### 01 - Digest Authentication

### 02 - Token Authentication

### 03 - JWT in Rails
* Criar um *controller* com `rails g controller auths`.
* Codificar/Decodificar os dados de uma requisição com **JWT**.

### 04 - Device Token Auth
* Primeiro registrar o user com uma requisição **POST** na URL: *http://localhost:3000/auth* enviando como corpo da requisição:
```json
{
    "email": "volax@gmail.com",
    "password": "12345678",
    "password_confirmation": "12345678"
}
```
* Depois logar com uma requisição **POST** na URL: *http://localhost:3000/auth/sign_in* enviando como corpo da requisição:
```json
{
    "email": "volax@gmail.com",
    "password": "12345678"
}
```
* Nos *Headers* da resposta, vai aparecer *access-token*, *client* e *uid*, ao solicitar uma requisição, essas variáveis devem estar no *Headers* da requisição que está sendo feito para validação do usuário.

## :black_nib: Licença
[Unlicense](https://unlicense.org)