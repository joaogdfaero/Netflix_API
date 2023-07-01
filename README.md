# Netflix_API
Este projeto consiste em uma API capaz de receber e retornar dados em CSV com informações sobre filmes e séries da Netflix.

## Requisitos

● A leitura do arquivo .csv deve ser através de um endpoint diferente da listagem de títulos;

● Ordenar pelo ano de lançamento;

● Filtrar os registros por ano de lançamento, gênero, país*;

● Garantir que não haja duplicidade de registros;

## Dependências

- Ruby
- Rails 


## API no Heroku
● 

## Documentação da API

● link: https://documenter.getpostman.com/view/24543977/2s93zCXzWV 


## Setup

1. `git clone https://github.com/leoalmeidasa/Netflix_API.git`
2. `cd Netflix_API`
3. `rake db:create db:migrate db:seed`
4. `rails s`
5. Abrir o link http://localhost:3000
