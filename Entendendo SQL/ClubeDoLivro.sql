# Comando para criar Schema no MySQL.
Create Schema Clube_Do_Livro;

# Como criar tabelas ?
Create Table LIVROS(
	Id_Livro Int Not Null,
    Nome_Livro Varchar(100) Not Null,
    Autoria Varchar(100) Not Null,
    Editora Varchar(100) Not Null,
    Categoria Varchar(100) Not Null,
    Preco Decimal(5,2) Not Null,
    
    #Declarando a PK da tabela
    Primary Key (Id_Livro)
);

# Tabela Estoque
Create Table ESTOQUE(
	Id_Livro Int Not Null,
    Qtd_Estoque Int Not Null,
    
	#Declarando a PK da tabela
	Primary Key (Id_Livro)
);

# Tabela Vendas
Create Table VENDAS(
	Id_Pedido Int Not Null,
    Id_Vendedor Int Not Null,
    Id_Livro Int Not Null,
    Qtd_Vendida Int Not Null,
    Data_Venda Date Not Null,
    
    #Declarando a PK da tabela
	Primary Key (Id_Pedido, Id_Vendedor)
);

# Tabela Vendedores
Create Table VENDEDORES(
	Id_Vendedor Int Not Null,
    Nome_Vendedor Varchar(255) Not Null,
    
	#Declarando a PK da tabela
	Primary Key (Id_Vendedor)
);

#---------------------------------------------------------------------

# Declarando a FK entre as tabelas Livros e Estoque
Alter Table ESTOQUE Add Constraint CE_ESTOQUE_LIVROS
Foreign Key (Id_Livro) 
References LIVROS (Id_Livro)
On Delete No Action
On Update No Action;

#---------------------------------------------------------------------

# Declarando a FK entre as tabelas Livros e Vendas
Alter Table VENDAS Add Constraint CE_VENDAS_LIVROS
Foreign Key (Id_Livro)
References LIVROS (Id_Livro)
On Delete No Action
On Update No Action;

#---------------------------------------------------------------------

# Declarando a FK entre as tabelas Vendas e Vendedores
Alter Table VENDAS Add Constraint CE_VENDAS_VENDEDORES
Foreign Key (Id_Vendedor) 
References VENDEDORES (Id_Vendedor)
On Delete No Action
On Update No Action;

#---------------------------------------------------------------------

# Comando para desativar os Relacionamentos e a FK (Foreign Key)
Set Foreign_Key_Checks = 0;

#---------------------------------------------------------------------

# Inserindo dados na Tabela Livros
Insert Into Livros Values(
	1, 
    "Percy Jackson e o Ladrão de Raios", 
    "Rick Riordan",
    "Intrínseca",
    "Aventura",
    34.65 
    # No SQL seguimos o padrão da língua inglesa, no caso de decimal se usa o ponto.
);

# Eu Posso inserir várias linhas em um único Insert
Insert Into Livros Values
	(2, "A Volta ao Mundo em 80 Dias", "Júlio Verne", "Principais", "Aventura", 21.99),
    (3, "O Cortiço", "Aloísio de Azevedo", "Panda Books", "Romance", 47.8),
    (4, "Dom Casmurro", "Machado de Assis", "Via Leitura", "Romance", 48),
    (5, "Memórias Póstumas de Brás Cubas", "Machado de Assis", "Antofágica", "Romance", 49.9),
    (6, "Quincas Borba", "Machado de Assis", "L&PM Editores", "Romance", 48.5),
    (7, "Ícaro", "Gabriel Pedrosa", "Ateliê", "Poesia", 36),
    (8, "Os Lusíadas", "Luís Vaz de Camões", "Montecristo", "Poesia", 18.79),
    (9, "Outros Jeitos de Usar a Boca", "Rupi Kaur", "Planeta", "Poesia", 34.8),
    (10, "Eu sou Malala", "Malala Yousafzai", "Companhia das Letras", "Biografia", 25.9),
    (11, "Minha História", "Michelle Obama", "Objetiva", "Biografia", 57.9);

# Agora vamos popular a tabela Vendedores
Insert Into Vendedores Values
	(1, "Paula Rabelo"),
    (2, "Juliana Macedo"),
    (3, "Roberto Barros"),
    (4, "Barbara Jales");
    
# Populando a Tabela Vendas
Insert Into Vendas Values
	(1, 3, 7, 1, "2020-11-02"),
    (2, 4, 8, 2, "2020-11-02"),
    (3, 4, 4, 3, "2020-11-02"),
    (4, 1, 7, 1, "2020-11-03"),
    (5, 1, 6, 3, "2020-11-03"),
    (6, 1, 9, 2, "2020-11-04"),
    (7, 4, 1, 3, "2020-11-04"),
    (8, 1, 5, 2, "2020-11-05"),
    (9, 1, 2, 1, "2020-11-05"),
    (10, 3, 8, 2, "2020-11-11"),
    (11, 1, 1, 4, "2020-11-11"),
    (12, 2, 10, 10, "2020-11-11"),
    (13, 1, 12, 5, "2020-11-18"),
    (14, 2, 4, 1, "2020-11-25"),
    (15, 3, 13, 2, "2021-01-05"),
    (16, 4, 13, 1, "2021-01-05"),
    (17, 4, 4, 3, "2021-01-06"),
    (18, 2, 12, 2, "2021-01-06");

# Populando a Tabela Estoque
Insert Into Estoque Values
	(1, 7),
    (2, 10),
    (3, 2),
    (8, 4),
    (10, 5),
    (11, 3),
    (12, 3);
    
#---------------------------------------------------------------------

# Sim, é possível inserir dados fora de ordem, mas você precisa colocar a ordem 
# das colunas antes do VALUES.

Insert Into Livros
(Categoria, Autoria, Nome_Livro, Editora, Id_Livro, Preco) 
Values
	("Biografia", "Anne Frank", "O Diário de Anne Frank", "Pé da Letra", "12", "34.90");

#---------------------------------------------------------------------

# Comando para excluir tabela
# Drop Table Tabela

#---------------------------------------------------------------------

# Ativar Restrições
Set Foreign_Key_Checks = 1;

#---------------------------------------------------------------------

# Comando para selecionar a tabela toda
Select * from Livros;


# Comando para selecionar uma coluna em específicp
Select Nome_Livro, Preco from Livros;

# Selecionando uma coluna com apelido
Select Autoria as "Autor do Livro" from Livros;

#---------------------------------------------------------------------

# Filtros no SQL

# Um exemplo de filtro básico
Select * From Livros
Where Categoria = "Biografia";

# 1. Uma tabela com os romances que custam menos de R$ 48,00
Select * From Livros
Where Categoria = "Romance" And Preco < 48;

# 2. Todas as Poesias que não seja de Camões ou de Pedrosa.
Select * From Livros
Where Categoria = "Poesia" And Not(Autoria = "Luís Vaz de Camões" OR Autoria = "Gabriel Pedrosa");

# 3. Biografia que não seja a da mulher do Obama.
Select * from Livros
Where Categoria = "Biografia" And Not(Autoria = "Michelle Obama");

# Usando o LIKE
Select * from Livros
Where Nome_Livro Like "a%";

Select Autoria as "Autores" from Livros
Where Autoria Like "M%";

#---------------------------------------------------------------------

# Seleção Distinta

# Comando DISTINCT
Select * from Vendas;

Select Distinct Id_Livro from Vendas;

# Livros que o Vendedor de id n° 1 vendeu, com os códigos dos livros em ordem.
Select Distinct Id_Livro from Vendas
Where Id_Vendedor = 1
Order By Id_Livro;

#---------------------------------------------------------------------

# Apagar linha de coluna se usa o DELETE.

# O livro Os Lusíadas não está sendo vendido, temos que removê-lo.
Delete From Livros Where Id_Livro = 8;

# Os livros estão com 10% de desconto, temos que fazer essa atualização.
Update Livros Set Preco = 0.9 * Preco;

#---------------------------------------------------------------------

# Remover Safe Update
Set Sql_Safe_Updates = 0;

#---------------------------------------------------------------------

# Unindo Tabelas
# Filtro usando duas tabelas

Select Vendas.Id_Vendedor, Vendedores.Nome_Vendedor, Vendas.Qtd_Vendida
From Vendas, Vendedores
Where Vendas.Id_Vendedor = Vendedores.Id_Vendedor;
# O código acima traz nomes repetidos dos vendedores devido a quantidade de pedidos

# Temos que fazer uma query que mostra a quantidade total de pedidos por vendedor.
Select Vendas.Id_Vendedor, Vendedores.Nome_Vendedor, Sum(Vendas.Qtd_Vendida) As "Qtd_Total_Vendas"
From Vendas, Vendedores
Where Vendas.Id_Vendedor = Vendedores.Id_Vendedor
Group By Vendas.Id_Vendedor;
# Nessa Query conseguimos fazer a quantidade total de vendas por vendedor, isso por que
# conseguimos agrupar os id dos vendedores para que a query funcinonasse.

Select Livros.Nome_Livro, Vendas.Qtd_Vendida
From Livros, Vendas
Where Livros.Id_Livro = Vendas.Id_Livro;


Select Livros.Nome_Livro, Sum(Vendas.Qtd_Vendida)
From Livros, Vendas
Where Livros.Id_Livro = Vendas.Id_Livro
Group By Livros.Id_Livro;

# Vamos escrever as mesmas queries usando o Inner Join, não vai mudar nada no resultado.
Select Livros.Nome_Livro, Sum(Vendas.Qtd_Vendida) As "Quantidade Total Vendida"
From Livros Inner Join Vendas
On Livros.Id_Livro = Vendas.Id_Livro
Group By Livros.Id_Livro;

Select Vendas.Id_Vendedor, Vendedores.Nome_Vendedor, Sum(Vendas.Qtd_Vendida) As "Qtd_Total_Vendas"
From Vendas Inner Join Vendedores
On Vendas.Id_Vendedor = Vendedores.Id_Vendedor
Group By Vendas.Id_Vendedor;

# -----------------------------------------------------------------------------------------------

# Funções de Agregação

Select Max(Qtd_Vendida) from Vendas;

Select Livros.Nome_Livro, Max(Qtd_Vendida)
From Livros Inner Join Vendas
On Livros.Id_Livro = Vendas.Id_Livro
Group By Livros.Id_Livro;

Select Max(Qtd_Vendida) from Vendas
Group By Id_Vendedor;

#-----------------------------------------------------------------------------------------------

# Right e Left Join

# Será que todos os livros da nossa base de dados foram vendidos ?

# Left Join
Select Livros.Nome_Livro, Vendas.Qtd_Vendida
From Livros Left Join Vendas
On Livros.Id_Livro = Vendas.Id_Livro;
#Where Vendas.Id_Livro Is Null;

# Right Join
Select Vendas.Id_Livro, Livros.Nome_Livro, Vendas.Qtd_Vendida
From Livros Right Join Vendas
On Livros.Id_Livro = Vendas.Id_Livro;
#Where Nome_Livro is Null;
