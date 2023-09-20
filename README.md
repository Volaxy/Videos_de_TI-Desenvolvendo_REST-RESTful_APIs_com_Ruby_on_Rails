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

### 10 - Address Creation
* Criação do ***`Address`***.

## :black_nib: Licença
[Unlicense](https://unlicense.org)