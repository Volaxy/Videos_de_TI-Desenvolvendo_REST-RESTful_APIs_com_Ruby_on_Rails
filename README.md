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
    <img alt='HTML Logo' height='60' width='50' src='https://raw.githubusercontent.com/get-icon/geticon/fc0f660daee147afb4a56c64e12bde6486b73e39/icons/ruby.svg' />&nbsp;
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

## :black_nib: Licença
[Unlicense](https://unlicense.org)