# Desafio-Senior

# Para rodar as partes ativas do desafio:

1º: Peço que baixe o arquivo .sql da primeira pasta e rode no MySQL para criação do banco de dados.

2º: Para utilizar o importador (segunda pasta), abra através de um servidor local (pode-se utilizar o Xampp, porém, é necessário colocar os arquivos da pasta "importador_senior" dentro da pasta "htdocs" do Xampp). 

3º: Acesse a URL "localhost/importador_senior/". A tela vai permitir que você selecione um arquivo CSV da sua máquina (há um arquivo de teste na terceira pasta do repositório, ou dentro da pasta "csv" dentro do próprio importador).

4º: Ao selecionar e clicar em importar, o sistema vai pegar as informações do CSV e inserir dentro da tabela PRODUTOS no MySQL.


# Alguns comentários e observações:

- O banco de dados foi feito no MySQL, na pasta "1 - Modelagem do banco de dado" terá o arquivo .sql para criação do banco de dados, e caso surgir a curiosidade, uma imagem do MER utilizado pra fazer o banco (foi feito o MER, e utilizado a opção "Forward Engineer" do MySQL, e alterado algumas informações do script manualmente).
- Para criação do CSV de testes, foi utilizado o site https://extendsclass.com/csv-generator.html. Tentei usar o Mockaroo, mas há um limite de 1000 linhas. 
- O código do importador não é original, foi pego o molde pronto e alterado conforme as necessidades do desafio.
- Realizei algumas adaptações nas tabelas sugeridas no desafio. Na pasta do desafio dos índices esclareço um pouco mais sobre isso.
