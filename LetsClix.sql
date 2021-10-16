--Enunciado
--Projeto
--Vamos prover um banco para uma grande plataforma de streaming, grandiosa LetsClix As tabelas serão:

--Tabela de relacionamentos

--| Tabela             | Coluna            | Tabela Referenciada | Coluna Referenciada |
--| ------------------ | ----------------- | ------------------- | ------------------- |
--| Elenco             | id\_papel         | Papel\_Elenco       | id                  |
--| Historico\_Usuario | id\_video         | Video               | id                  |
--| Historico\_Usuario | id\_usuario       | Usuario             | id                  |
--| Plano\_usuario     | id\_plano         | PlanoAssinatura     | id                  |
--| Plano\_usuario     | id\_usuario       | Usuario             | id                  |
--| PlanoAssinatura    | id\_regiao        | Regiao              | id                  |
--| Usuario            | id\_Regiao        | Regiao              | id                  |
--| Video              | id\_publisher     | Publisher           | id                  |
--| Video              | id\_genero        | Genero              | id                  |
--| Video              | id\_classificacao | Classificacao       | id                  |
--| Video\_Elenco      | id\_elenco        | Elenco              | id                  |
--| Video\_Elenco      | id\_video         | Video               | id                  |
--Informações sobre as tabelas:

--Regiao - Regiao do usuario/plano, imagine que poderia ser para aplicar restrições, por enquanto temos Norte,Nordeste, Centro-Oeste,Sudeste,Sul

--Classificacao - Classificacao etaria do video

--Genero - Genero do filme

--Publisher - Empresa responsavel pelo video

--Elenco - Atores/Diretores dos filmes

--Papel_Elenco - Possíveis papéis da equipe dentro de um filme, por enquanto temos: Diretor, Ator/Atriz

--Video_Elenco - Associacao entre filme e atores/diretores

--Historico_Usuario - Historico dos videos assistidos por cada usuario - o campo qtdSegundosAssistidos só é preenchido em caso de parada do video, se o usuario assistiu todo o video deixar esse campo nulo

--Video - Cada video disponivel na nossa plataforma

--Usuario - Cadastro de usuario

--PlanoAssinatura - Os possiveis planos disponiveis na plataforma

--Plano_Usuario - Associacao do plano x usuario

--Dados a serem populados

--Plano_usuario - 50 registros (ok)
--Publisher - 10 registros (ok)
--Papel_Elenco - 2 registros (ok)
--Elenco - 50 registros (ok)
--Genero - 10 registros (ok)
--Classificacao - 5 registros (ok)
--Video - 100 registros (ok)
--Video_Elenco - 250 registros (ok)
--Historico_Usuario - 500 registros (ok)
--Regiao - 5 registros (ok)
--Usuario - 50 registros (ok)
--PlanoAssinatura - 5 registros (ok)


--Relatórios
--Foi solicitado para você, dev, gerar diversas consultas para análise da plataforma, você só deve fazer a parte do select, a parte de aplicação será outra equipe.

--create database LetsClix

use LetsClix

--Plano_usuario
--id int identity(1,1)
--id_plano int
--id_usuario int
--dt_validade datetime
create table Plano_usuario
(
	  id int identity(1,1)
	, id_plano int
	, id_usuario int
	, dt_validade datetime
	 CONSTRAINT PK_Plano_usuario PRIMARY KEY (id) 
)

--Publisher
--id int identity(1,1)
--nome varchar (200)
--cnpj varchar (14)
--dt_ini_contrato datetime
--dt_fim_contrato datetime
create table Publisher
(
	id int identity(1,1)
	, nome varchar(200)
	, cnpj varchar(14)
	, dt_ini_contrato datetime
	, dt_fim_contrato datetime
	CONSTRAINT PK_Publisher PRIMARY KEY (id) 
)

--Papel_Elenco
--id int identity(1,1)
--cd_papel varchar (50)
--Elenco
--id int identity(1,1)
--nome varchar (200)
--id_papel int
--link_foto varchar (300)
create table Papel_Elenco
(
	id int identity(1,1)
	, cd_papel varchar(50)
	CONSTRAINT PK_Papel_Elenco PRIMARY KEY (id) 

)

--Elenco
--id int identity(1,1)
--nome varchar (200)
--id_papel int
--link_foto varchar (300)
create table Elenco
(
	id int identity(1,1)
	, nome varchar(200)
	, id_papel int
	, link_foto varchar(50)	
	CONSTRAINT PK_Elenco PRIMARY KEY (id) 
)

--Genero
--id int identity(1,1)
--nome varchar (50)
--Classificacao
--id int identity(1,1)
--idade_minima int
create table Genero
(
	id int identity(1,1)
	, nome varchar(50)
	CONSTRAINT PK_Genero PRIMARY KEY (id) 
)

--Classificacao
--id int identity(1,1)
--idade_minima int
create table Classificacao
(
	id int identity(1,1)
	, idade_minima int
	CONSTRAINT PK_Classificacao PRIMARY KEY (id) 	
)

--Video
--id int identity(1,1)
--id_publisher int
--id_classificacao int
--id_genero int
--nome varchar (200)
--sinopse varchar (300)
--dt_lancamento datetime
--duracao_segundos int
create table Video
(
	 id int identity(1,1)
	,id_publisher int
	,id_classificacao int
	,id_genero int
	,nome varchar(200)
	,sinopse varchar(max)
	,dt_lancamento datetime
	,duracao_segundos int
	CONSTRAINT PK_Video PRIMARY KEY (id) 
)

--Video_Elenco
--id int identity(1,1)
--id_video int
--id_elenco int
create table Video_Elenco
(
	 id int identity(1,1)
	,id_video int
	,id_elenco int
	CONSTRAINT PK_Video_Elenco PRIMARY KEY (id) 	
)

--Historico_Usuario
--id int identity(1,1)
--id_video int
--id_usuario int
--qtdSegundosAssistidos int
create table Historico_Usuario
(
	 id int identity(1,1)
	,id_video int
	,id_usuario int
	,qtdSegundosAssistidos int
	CONSTRAINT PK_Historico_Usuario PRIMARY KEY (id) 	
)

--Regiao
--id int identity(1,1)
--nome varchar (10)
create table Regiao
(
	id int identity(1,1)
	, nome varchar(11)
	CONSTRAINT PK_Regiao PRIMARY KEY (id) 	

)

--Usuario
--id int identity(1,1)
--cpf varchar (11)
--endereco varchar (200)
--cidade varchar (200)
--estado varchar (2)
--id_Regiao int
create table Usuario
(
	id int identity(1,1)
	, cpf varchar(11)
	, endereco varchar(200)
	, cidade varchar(200)
	, estado varchar(2)
	, id_Regiao int
	CONSTRAINT PK_Usuario PRIMARY KEY (id) 	
)

--PlanoAssinatura
--id int identity(1,1)
--codigo varchar (20)
--id_regiao int
--preco decimal
--dt_ini_vigencia datetime
--dt_fim_vigencia datetime
create table PlanoAssinatura
(
	id int identity(1,1)
	, codigo varchar(20)
	, id_regiao int
	, preco decimal
	, dt_ini_vigencia datetime
	, dt_fim_vigencia datetime
	CONSTRAINT PK_PlanoAssinatura PRIMARY KEY (id) 	
)

--Alterando todas as tabelas para adicionar as foreign key

alter table Elenco
add constraint FK_Elenco_1 foreign key (id_papel) References Papel_Elenco(id)

alter table Historico_Usuario
add constraint FK_Historico_Usuario_1 foreign key (id_video) References Video(id)

alter table Historico_Usuario
add constraint FK_Historico_Usuario_2 foreign key (id_usuario) References Usuario(id)

alter table Plano_Usuario
add constraint FK_Plano_Usuario_1 foreign key (id_plano) References PlanoAssinatura(id)

alter table Plano_Usuario
add constraint FK_Plano_Usuario_2 foreign key (id_usuario) References Usuario(id)

alter table Usuario
add constraint FK_Usuario_1 foreign key (id_regiao) References Regiao(id)

alter table Video
add constraint FK_Video_1 foreign key (id_publisher) References Publisher(id)

alter table Video
add constraint FK_Video_2 foreign key (id_genero) References Genero(id)

alter table Video
add constraint FK_Video_3 foreign key (id_classificacao) References Classificacao(id)

alter table Video_Elenco
add constraint FK_Video_Elenco_1 foreign key (id_elenco) References Elenco(id)

alter table Video_Elenco
add constraint FK_Video_Elenco_2 foreign key (id_video) References Video(id)

alter table PlanoAssinatura
add constraint FK_PlanoAssinatura_1 foreign key (id_regiao) References Regiao(id)

--Inserts
insert into Papel_Elenco
Values
 ('Diretor')
,('Ator/Atriz')

insert into Genero
Values
 ('Acao')
,('Aventura')
,('Comedia')
,('Drama')
,('Documentarios')
,('Suspense')
,('Bibliografico')
,('Fantasia')
,('Musical')
,('Romance')

insert into Classificacao
values
 (0)
,(10)
,(12)
,(16)
,(18)

insert into Regiao
values
 ('Norte')
,('Nordeste')
,('CentroOeste')
,('Sudeste')
,('Sul')

insert into PlanoAssinatura
values
 (1578, 1, 20.00, GETDATE(), DATEADD(MONTH, 1, GETDATE()))
,(1577, 2, 35.00, GETDATE(), DATEADD(MONTH, 2, GETDATE()))
,(1521, 3, 40.00, GETDATE(), DATEADD(MONTH, 3, GETDATE()))
,(1598, 4, 55.00, GETDATE(), DATEADD(MONTH, 4, GETDATE()))
,(1575, 5, 75.00, GETDATE(), DATEADD(YEAR, 2, GETDATE()))

insert into Publisher
values 
	('Paramont', '02592588632512', GETDATE(), DATEADD(YEAR, 1, GETDATE()))
	,('Marvel', '05269874125635', DATEADD(DAY, 1, GETDATE()), DATEADD(YEAR, 2, GETDATE()))
	,('DC', '12587456985236', DATEADD(DAY, 2, GETDATE()), DATEADD(YEAR, 3, GETDATE()))
	,('Warner Bros', '03256987415896', DATEADD(DAY, 3, GETDATE()), DATEADD(YEAR, 4, GETDATE()))
	,('Disney', '25874156985632', DATEADD(DAY, 4, GETDATE()), DATEADD(YEAR, 5, GETDATE()))
	,('Amazon', '03265987415821', DATEADD(DAY, 5, GETDATE()), DATEADD(YEAR, 6, GETDATE()))
	,('Netflix', '06584751236547', DATEADD(DAY, 6, GETDATE()), DATEADD(YEAR, 7, GETDATE()))
	,('Fox', '20314785963258', DATEADD(DAY, 7, GETDATE()), DATEADD(YEAR, 8, GETDATE()))
	,('Sony', '2589632587415', DATEADD(DAY, 8, GETDATE()), DATEADD(YEAR, 9, GETDATE()))
	,('Universal', '03258965874158', DATEADD(DAY, 9, GETDATE()), DATEADD(YEAR, 2, GETDATE()))

insert into Usuario
Values
 ('usuário_0', 'endereço_3', 'cidade_3', 'E4', 5) 
,('usuário_1', 'endereço_3', 'cidade_2', 'E4', 1) 
,('usuário_2', 'endereço_5', 'cidade_5', 'E7', 3) 
,('usuário_3', 'endereço_2', 'cidade_9', 'E7', 3) 
,('usuário_4', 'endereço_7', 'cidade_5', 'E2', 4) 
,('usuário_5', 'endereço_1', 'cidade_3', 'E7', 5) 
,('usuário_6', 'endereço_3', 'cidade_1', 'E2', 5) 
,('usuário_7', 'endereço_3', 'cidade_8', 'E7', 3) 
,('usuário_8', 'endereço_7', 'cidade_4', 'E6', 3) 
,('usuário_9', 'endereço_7', 'cidade_3', 'E8', 1) 
,('usuário_10', 'endereço_6', 'cidade_3', 'E2', 2)
,('usuário_11', 'endereço_7', 'cidade_4', 'E3', 5)
,('usuário_12', 'endereço_1', 'cidade_2', 'E3', 4)
,('usuário_13', 'endereço_6', 'cidade_3', 'E6', 1)
,('usuário_14', 'endereço_4', 'cidade_5', 'E5', 2)
,('usuário_15', 'endereço_1', 'cidade_6', 'E6', 5)
,('usuário_16', 'endereço_6', 'cidade_3', 'E5', 4)
,('usuário_17', 'endereço_2', 'cidade_4', 'E6', 4)
,('usuário_18', 'endereço_4', 'cidade_9', 'E8', 4)
,('usuário_19', 'endereço_1', 'cidade_5', 'E1', 1)
,('usuário_20', 'endereço_6', 'cidade_3', 'E7', 1)
,('usuário_21', 'endereço_4', 'cidade_1', 'E6', 4)
,('usuário_22', 'endereço_5', 'cidade_6', 'E1', 3)
,('usuário_23', 'endereço_6', 'cidade_6', 'E1', 2)
,('usuário_24', 'endereço_5', 'cidade_4', 'E5', 3)
,('usuário_25', 'endereço_6', 'cidade_5', 'E5', 4)
,('usuário_26', 'endereço_4', 'cidade_6', 'E2', 4)
,('usuário_27', 'endereço_4', 'cidade_9', 'E1', 5)
,('usuário_28', 'endereço_4', 'cidade_5', 'E5', 4)
,('usuário_29', 'endereço_6', 'cidade_5', 'E3', 4)
,('usuário_30', 'endereço_5', 'cidade_9', 'E1', 4)
,('usuário_31', 'endereço_3', 'cidade_2', 'E8', 5)
,('usuário_32', 'endereço_7', 'cidade_6', 'E2', 4)
,('usuário_33', 'endereço_7', 'cidade_5', 'E2', 2)
,('usuário_34', 'endereço_5', 'cidade_2', 'E6', 5)
,('usuário_35', 'endereço_7', 'cidade_9', 'E2', 4)
,('usuário_36', 'endereço_4', 'cidade_2', 'E8', 2)
,('usuário_37', 'endereço_1', 'cidade_3', 'E4', 1)
,('usuário_38', 'endereço_1', 'cidade_9', 'E8', 5)
,('usuário_39', 'endereço_3', 'cidade_9', 'E3', 2)
,('usuário_40', 'endereço_5', 'cidade_3', 'E7', 4)
,('usuário_41', 'endereço_6', 'cidade_4', 'E8', 1)
,('usuário_42', 'endereço_2', 'cidade_4', 'E2', 4)
,('usuário_43', 'endereço_6', 'cidade_4', 'E6', 4)
,('usuário_44', 'endereço_5', 'cidade_4', 'E2', 2)
,('usuário_45', 'endereço_2', 'cidade_6', 'E8', 3)
,('usuário_46', 'endereço_2', 'cidade_9', 'E5', 5)
,('usuário_47', 'endereço_4', 'cidade_3', 'E7', 4)
,('usuário_48', 'endereço_6', 'cidade_3', 'E3', 4)
,('usuário_49', 'endereço_1', 'cidade_4', 'E7', 1)

insert into Video
Values
 (2, 4, 4, 'Video_1', 'Sinopse_1', getdate(), 5131)   
,(7, 2, 7, 'Video_2', 'Sinopse_2', getdate(), 4521)   
,(3, 1, 5, 'Video_3', 'Sinopse_3', getdate(), 6988)   
,(4, 4, 2, 'Video_4', 'Sinopse_4', getdate(), 4769)   
,(1, 2, 3, 'Video_5', 'Sinopse_5', getdate(), 7124)   
,(5, 4, 1, 'Video_6', 'Sinopse_6', getdate(), 4438)   
,(10, 2, 8, 'Video_7', 'Sinopse_7', getdate(), 4465)  
,(8, 5, 9, 'Video_8', 'Sinopse_8', getdate(), 6362)   
,(4, 5, 1, 'Video_9', 'Sinopse_9', getdate(), 6839)   
,(7, 4, 8, 'Video_10', 'Sinopse_10', getdate(), 6975) 
,(3, 3, 4, 'Video_11', 'Sinopse_11', getdate(), 6923) 
,(6, 5, 5, 'Video_12', 'Sinopse_12', getdate(), 5025) 
,(6, 2, 3, 'Video_13', 'Sinopse_13', getdate(), 6126) 
,(2, 3, 3, 'Video_14', 'Sinopse_14', getdate(), 5251) 
,(7, 1, 5, 'Video_15', 'Sinopse_15', getdate(), 4587) 
,(6, 2, 6, 'Video_16', 'Sinopse_16', getdate(), 5059) 
,(4, 4, 7, 'Video_17', 'Sinopse_17', getdate(), 5355) 
,(7, 2, 7, 'Video_18', 'Sinopse_18', getdate(), 4583) 
,(6, 2, 7, 'Video_19', 'Sinopse_19', getdate(), 3725) 
,(4, 1, 7, 'Video_20', 'Sinopse_20', getdate(), 4096) 
,(10, 2, 7, 'Video_21', 'Sinopse_21', getdate(), 5312)
,(6, 1, 6, 'Video_22', 'Sinopse_22', getdate(), 6864)
,(7, 3, 3, 'Video_23', 'Sinopse_23', getdate(), 5476)
,(3, 3, 4, 'Video_24', 'Sinopse_24', getdate(), 6870)
,(10, 5, 7, 'Video_25', 'Sinopse_25', getdate(), 6642)
,(2, 5, 8, 'Video_26', 'Sinopse_26', getdate(), 4764)
,(6, 5, 2, 'Video_27', 'Sinopse_27', getdate(), 6808)
,(8, 1, 2, 'Video_28', 'Sinopse_28', getdate(), 5266)
,(5, 2, 4, 'Video_29', 'Sinopse_29', getdate(), 4609)
,(8, 1, 9, 'Video_30', 'Sinopse_30', getdate(), 4107)
,(2, 4, 8, 'Video_31', 'Sinopse_31', getdate(), 3898)
,(10, 1, 10, 'Video_32', 'Sinopse_32', getdate(), 3711)
,(10, 4, 2, 'Video_33', 'Sinopse_33', getdate(), 4826)
,(6, 5, 10, 'Video_34', 'Sinopse_34', getdate(), 7064)
,(6, 2, 10, 'Video_35', 'Sinopse_35', getdate(), 5765)
,(10, 4, 2, 'Video_36', 'Sinopse_36', getdate(), 5416)
,(5, 5, 1, 'Video_37', 'Sinopse_37', getdate(), 7050)
,(2, 1, 2, 'Video_38', 'Sinopse_38', getdate(), 6657)
,(2, 3, 8, 'Video_39', 'Sinopse_39', getdate(), 5386)
,(2, 4, 4, 'Video_40', 'Sinopse_40', getdate(), 4998)
,(1, 1, 10, 'Video_41', 'Sinopse_41', getdate(), 7102)
,(1, 5, 10, 'Video_42', 'Sinopse_42', getdate(), 5733)
,(5, 3, 8, 'Video_43', 'Sinopse_43', getdate(), 5126)
,(2, 2, 2, 'Video_44', 'Sinopse_44', getdate(), 5017)
,(6, 2, 7, 'Video_45', 'Sinopse_45', getdate(), 4093)
,(1, 1, 10, 'Video_46', 'Sinopse_46', getdate(), 6720)
,(7, 2, 2, 'Video_47', 'Sinopse_47', getdate(), 3773)
,(1, 3, 9, 'Video_48', 'Sinopse_48', getdate(), 6694)
,(10, 3, 6, 'Video_49', 'Sinopse_49', getdate(), 6532)
,(8, 1, 5, 'Video_50', 'Sinopse_50', getdate(), 5750)
,(9, 3, 6, 'Video_51', 'Sinopse_51', getdate(), 6124)
,(4, 4, 8, 'Video_52', 'Sinopse_52', getdate(), 6991)
,(4, 2, 10, 'Video_53', 'Sinopse_53', getdate(), 6664)
,(1, 2, 4, 'Video_54', 'Sinopse_54', getdate(), 7181)
,(3, 1, 4, 'Video_55', 'Sinopse_55', getdate(), 6462)
,(7, 5, 5, 'Video_56', 'Sinopse_56', getdate(), 7055)
,(6, 5, 5, 'Video_57', 'Sinopse_57', getdate(), 5794)
,(7, 2, 7, 'Video_58', 'Sinopse_58', getdate(), 4866)
,(9, 1, 3, 'Video_59', 'Sinopse_59', getdate(), 5687)
,(5, 2, 6, 'Video_60', 'Sinopse_60', getdate(), 6730)
,(6, 2, 8, 'Video_61', 'Sinopse_61', getdate(), 6294)
,(5, 5, 9, 'Video_62', 'Sinopse_62', getdate(), 6327)
,(3, 3, 6, 'Video_63', 'Sinopse_63', getdate(), 5960)
,(9, 4, 10, 'Video_64', 'Sinopse_64', getdate(), 3614)
,(1, 3, 2, 'Video_65', 'Sinopse_65', getdate(), 5226)
,(3, 1, 4, 'Video_66', 'Sinopse_66', getdate(), 7048)
,(8, 4, 10, 'Video_67', 'Sinopse_67', getdate(), 6905)
,(10, 4, 6, 'Video_68', 'Sinopse_68', getdate(), 3665)
,(6, 3, 3, 'Video_69', 'Sinopse_69', getdate(), 4961)
,(2, 4, 5, 'Video_70', 'Sinopse_70', getdate(), 5840)
,(1, 4, 4, 'Video_71', 'Sinopse_71', getdate(), 3711)
,(8, 5, 6, 'Video_72', 'Sinopse_72', getdate(), 4354)
,(2, 2, 6, 'Video_73', 'Sinopse_73', getdate(), 6704)
,(2, 1, 6, 'Video_74', 'Sinopse_74', getdate(), 5283)
,(10, 4, 1, 'Video_75', 'Sinopse_75', getdate(), 6778)
,(10, 5, 8, 'Video_76', 'Sinopse_76', getdate(), 5358)
,(1, 3, 2, 'Video_77', 'Sinopse_77', getdate(), 4786)
,(5, 3, 9, 'Video_78', 'Sinopse_78', getdate(), 4514)
,(2, 3, 5, 'Video_79', 'Sinopse_79', getdate(), 5723)
,(8, 2, 2, 'Video_80', 'Sinopse_80', getdate(), 6171)
,(1, 4, 9, 'Video_81', 'Sinopse_81', getdate(), 6245)
,(2, 4, 10, 'Video_82', 'Sinopse_82', getdate(), 5285)
,(10, 4, 5, 'Video_83', 'Sinopse_83', getdate(), 4937)
,(8, 3, 7, 'Video_84', 'Sinopse_84', getdate(), 3893)
,(10, 5, 10, 'Video_85', 'Sinopse_85', getdate(), 4382)
,(9, 1, 8, 'Video_86', 'Sinopse_86', getdate(), 5429)
,(4, 2, 8, 'Video_87', 'Sinopse_87', getdate(), 5830)
,(7, 5, 8, 'Video_88', 'Sinopse_88', getdate(), 5903)
,(6, 2, 9, 'Video_89', 'Sinopse_89', getdate(), 4255)
,(2, 1, 4, 'Video_90', 'Sinopse_90', getdate(), 4992)
,(7, 4, 5, 'Video_91', 'Sinopse_91', getdate(), 5942)
,(2, 3, 6, 'Video_92', 'Sinopse_92', getdate(), 5519)
,(9, 2, 7, 'Video_93', 'Sinopse_93', getdate(), 6510)
,(4, 5, 9, 'Video_94', 'Sinopse_94', getdate(), 6766)
,(10, 2, 4, 'Video_95', 'Sinopse_95', getdate(), 6585)
,(10, 2, 9, 'Video_96', 'Sinopse_96', getdate(), 6902)
,(1, 5, 8, 'Video_97', 'Sinopse_97', getdate(), 4938)
,(8, 3, 10, 'Video_98', 'Sinopse_98', getdate(), 6694)
,(6, 3, 6, 'Video_99', 'Sinopse_99', getdate(), 4520)
,(8, 1, 4, 'Video_100', 'Sinopse_100', getdate(), 6863)

insert into Elenco
Values 
 ('Nome_1', 1, 'Link1')  
,('Nome_2', 1, 'Link2')  
,('Nome_3', 2, 'Link3')  
,('Nome_4', 2, 'Link4')  
,('Nome_5', 2, 'Link5')  
,('Nome_6', 2, 'Link6')  
,('Nome_7', 1, 'Link7')  
,('Nome_8', 2, 'Link8')  
,('Nome_9', 1, 'Link9')  
,('Nome_10', 1, 'Link10')
,('Nome_11', 1, 'Link11')
,('Nome_12', 1, 'Link12')
,('Nome_13', 2, 'Link13')
,('Nome_14', 1, 'Link14')
,('Nome_15', 2, 'Link15')
,('Nome_16', 2, 'Link16')
,('Nome_17', 2, 'Link17')
,('Nome_18', 1, 'Link18')
,('Nome_19', 2, 'Link19')
,('Nome_20', 1, 'Link20')
,('Nome_21', 1, 'Link21')
,('Nome_22', 1, 'Link22')
,('Nome_23', 1, 'Link23')
,('Nome_24', 1, 'Link24')
,('Nome_25', 1, 'Link25')
,('Nome_26', 1, 'Link26')
,('Nome_27', 1, 'Link27')
,('Nome_28', 1, 'Link28')
,('Nome_29', 1, 'Link29')
,('Nome_30', 2, 'Link30')
,('Nome_31', 2, 'Link31')
,('Nome_32', 1, 'Link32')
,('Nome_33', 2, 'Link33')
,('Nome_34', 1, 'Link34')
,('Nome_35', 2, 'Link35')
,('Nome_36', 1, 'Link36')
,('Nome_37', 2, 'Link37')
,('Nome_38', 2, 'Link38')
,('Nome_39', 2, 'Link39')
,('Nome_40', 1, 'Link40')
,('Nome_41', 2, 'Link41')
,('Nome_42', 1, 'Link42')
,('Nome_43', 2, 'Link43')
,('Nome_44', 1, 'Link44')
,('Nome_45', 2, 'Link45')
,('Nome_46', 1, 'Link46')
,('Nome_47', 1, 'Link47')
,('Nome_48', 2, 'Link48')
,('Nome_49', 1, 'Link49')
,('Nome_50', 1, 'Link50')

insert into Video_elenco
values
  (20, 9)
, (11, 11)
, (70, 21)
, (39, 21)
, (4, 19) 
, (29, 48)
, (83, 9) 
, (24, 40)
, (47, 14)
, (52, 20)
, (31, 17)
, (50, 2) 
, (39, 32)
, (4, 17)
, (26, 42)
, (16, 44)
, (73, 27)
, (89, 46)
, (54, 44)
, (9, 40)
, (47, 39)
, (56, 33)
, (16, 43)
, (5, 25)
, (29, 11)
, (1, 14)
, (21, 26)
, (23, 11)
, (17, 9)
, (77, 4)
, (39, 3)
, (16, 10)
, (23, 20)
, (23, 15)
, (28, 15)
, (26, 29)
, (20, 36)
, (93, 26)
, (77, 42)
, (87, 27)
, (59, 27)
, (5, 3)
, (84, 44)
, (69, 11)
, (31, 34)
, (77, 19)
, (11, 2)
, (40, 21)
, (64, 19)
, (43, 38)
, (64, 37)
, (22, 49)
, (95, 21)
, (8, 24)
, (58, 35)
, (44, 17)
, (30, 12)
, (47, 42)
, (1, 6)
, (35, 17)
, (69, 1)
, (99, 30)
, (53, 44)
, (48, 9)
, (33, 26)
, (87, 20)
, (41, 6)
, (89, 42)
, (33, 4)
, (9, 21)
, (81, 11)
, (64, 30)
, (25, 22)
, (7, 43)
, (55, 28)
, (41, 26)
, (4, 5)
, (7, 32)
, (75, 30)
, (45, 4)
, (93, 45)
, (16, 4)
, (84, 2)
, (91, 10)
, (35, 31)
, (52, 47)
, (3, 46)
, (52, 24)
, (36, 20)
, (36, 5)
, (82, 31)
, (62, 38)
, (11, 17)
, (36, 16)
, (5, 13)
, (9, 36)
, (61, 1)
, (49, 45)
, (7, 29)
, (75, 10)
, (52, 44)
, (52, 46)
, (3, 24)
, (50, 6)
, (57, 29)
, (28, 18)
, (26, 18)
, (25, 16)
, (29, 19)
, (96, 25)
, (67, 30)
, (15, 5)
, (53, 40)
, (33, 1)
, (43, 30)
, (42, 39)
, (65, 8)
, (57, 46)
, (11, 34)
, (74, 32)
, (84, 13)
, (75, 23)
, (98, 36)
, (46, 13)
, (77, 9)
, (63, 34)
, (61, 13)
, (53, 45)
, (73, 21)
, (40, 11)
, (14, 25)
, (68, 47)
, (18, 25)
, (71, 5)
, (79, 16)
, (21, 30)
, (63, 17)
, (65, 21)
, (85, 34)
, (11, 40)
, (35, 5)
, (24, 13)
, (98, 36)
, (17, 20)
, (63, 32)
, (20, 34)
, (29, 26)
, (50, 18)
, (57, 39)
, (28, 24)
, (3, 18)
, (46, 23)
, (97, 2)
, (5, 15)
, (61, 6)
, (7, 3)
, (32, 30)
, (87, 3)
, (26, 22)
, (97, 22)
, (33, 16)
, (47, 7)
, (12, 26)
, (31, 6)
, (83, 15)
, (85, 4)
, (42, 31)
, (77, 49)
, (63, 39)
, (28, 47)
, (68, 44)
, (78, 26)
, (59, 8)
, (36, 34)
, (65, 22)
, (10, 7)
, (81, 41)
, (16, 35)
, (89, 16)
, (35, 22)
, (72, 47)
, (45, 16)
, (25, 1)
, (63, 35)
, (82, 44)
, (42, 24)
, (16, 2)
, (76, 22)
, (54, 47)
, (55, 47)
, (18, 31)
, (46, 20)
, (20, 36)
, (25, 29)
, (46, 4)
, (9, 16)
, (43, 41)
, (22, 37)
, (43, 23)
, (28, 29)
, (53, 32)
, (86, 38)
, (2, 31)
, (97, 39)
, (7, 36)
, (17, 47)
, (76, 20)
, (28, 6)
, (48, 4)
, (13, 26)
, (76, 3)
, (25, 37)
, (80, 6)
, (5, 17)
, (80, 2)
, (2, 4)
, (67, 48)
, (42, 26)
, (75, 35)
, (37, 28)
, (74, 23)
, (51, 37)
, (90, 8)
, (55, 2)
, (55, 6)
, (26, 18)
, (35, 38)
, (82, 24)
, (41, 6)
, (95, 45)
, (57, 32)
, (98, 3)
, (69, 5)
, (28, 40)
, (97, 37)
, (36, 39)
, (69, 28)
, (77, 15)
, (53, 25)
, (85, 33)
, (56, 1)
, (78, 34)
, (76, 33)
, (72, 45)
, (14, 46)
, (12, 32)
, (74, 23)
, (99, 6)
, (48, 24)
, (5, 40)

insert into Historico_Usuario
Values
 (91, 29, 2191)
,(79, 26, 6867)
,(5, 43, 3692) 
,(92, 12, 2825)
,(62, 14, 4654)
,(82, 26, 3730)
,(28, 48, 134) 
,(14, 35, 1653)
,(70, 9, 1739) 
,(29, 30, 4795)
,(9, 40, 5231) 
,(4, 2, 5414)  
,(7, 40, 3232) 
,(58, 24, 5089)
,(68, 7, 6949) 
,(53, 38, 2853)
,(52, 46, 5054)
,(46, 43, 4368)
,(11, 39, 6282)
,(8, 5, 2476)
,(72, 39, 1892)
,(85, 42, 3199)
,(67, 29, 1794)
,(90, 38, 5106)
,(7, 36, 3472)
,(32, 24, 4046)
,(27, 9, 3083)
,(85, 39, 4929)
,(97, 32, 6799)
,(12, 47, 1849)
,(88, 50, 5061)
,(11, 44, 5091)
,(45, 42, 2095)
,(53, 43, 1190)
,(15, 32, 1086)
,(100, 20, 1019)
,(13, 40, 2188)
,(32, 41, 6625)
,(92, 44, 7167)
,(58, 45, 1519)
,(51, 28, 4658)
,(100, 1, 5534)
,(1, 49, 6023)
,(78, 44, 4539)
,(28, 38, 2255)
,(27, 35, 1023)
,(54, 49, 1682)
,(81, 50, 986)
,(96, 29, 1278)
,(79, 10, 7178)
,(72, 44, 6817)
,(9, 2, 2247)
,(52, 8, 4378)
,(39, 50, 3068)
,(31, 18, 6678)
,(68, 2, 481)
,(61, 33, 1214)
,(86, 3, 6563)
,(98, 35, 3962)
,(52, 2, 3212)
,(60, 12, 5579)
,(84, 4, 12)
,(69, 10, 5203)
,(1, 38, 3913)
,(54, 8, 7089)
,(81, 25, 4652)
,(21, 14, 3812)
,(12, 9, 3865)
,(83, 43, 5916)
,(4, 6, 2330)
,(77, 1, 831)
,(17, 40, 5495)
,(66, 24, 2059)
,(93, 50, 6110)
,(35, 31, 6535)
,(63, 16, 6426)
,(93, 9, 1435)
,(91, 16, 5472)
,(92, 25, 344)
,(24, 1, 1478)
,(19, 33, 635)
,(40, 12, 5305)
,(43, 19, 2598)
,(23, 8, 235)
,(37, 15, 2083)
,(69, 39, 4101)
,(63, 11, 3879)
,(93, 6, 6716)
,(13, 43, 5091)
,(36, 13, 2235)
,(72, 21, 3270)
,(9, 38, 2461)
,(77, 48, 2641)
,(18, 10, 6823)
,(54, 36, 100)
,(17, 28, 127)
,(48, 12, 5139)
,(48, 31, 5817)
,(67, 13, 3888)
,(16, 14, 2746)
,(3, 4, 911)
,(6, 26, 5351)
,(58, 14, 3869)
,(95, 47, 5915)
,(21, 23, 45)
,(60, 20, 2900)
,(92, 48, 2260)
,(69, 45, 70)
,(60, 12, 5787)
,(65, 21, 3564)
,(81, 31, 4826)
,(99, 8, 896)
,(83, 25, 1438)
,(28, 30, 1905)
,(49, 27, 2272)
,(90, 14, 1089)
,(81, 4, 6146)
,(14, 12, 2283)
,(7, 17, 1353)
,(12, 23, 1933)
,(94, 47, 6228)
,(5, 8, 2269)
,(16, 11, 2280)
,(89, 39, 6593)
,(21, 33, 2659)
,(5, 11, 2604)
,(70, 36, 6928)
,(66, 43, 2439)
,(65, 34, 2656)
,(36, 46, 5769)
,(94, 36, 200)
,(94, 17, 4723)
,(40, 22, 2717)
,(1, 38, 417)
,(84, 47, 2201)
,(94, 47, 4232)
,(95, 1, 940)
,(83, 22, 5395)
,(31, 15, 634)
,(53, 21, 3465)
,(95, 40, 2156)
,(52, 48, 471)
,(89, 14, 2286)
,(72, 33, 5557)
,(99, 35, 6936)
,(91, 41, 6653)
,(4, 36, 5259)
,(79, 21, 6477)
,(68, 6, 2028)
,(28, 32, 318)
,(57, 44, 263)
,(90, 3, 6789)
,(76, 16, 7020)
,(25, 3, 4770)
,(28, 12, 2653)
,(36, 43, 5250)
,(79, 21, 3376)
,(17, 25, 5024)
,(76, 9, 2826)
,(40, 43, 6011)
,(79, 31, 4654)
,(28, 8, 5592)
,(74, 5, 4602)
,(3, 8, 3592)
,(95, 40, 4705)
,(7, 26, 1232)
,(54, 16, 1932)
,(56, 25, 1609)
,(58, 21, 2736)
,(34, 8, 6402)
,(56, 18, 3418)
,(15, 23, 3169)
,(2, 50, 642)
,(60, 32, 5427)
,(10, 39, 1843)
,(97, 11, 5042)
,(5, 35, 4711)
,(23, 44, 3833)
,(57, 12, 845)
,(43, 35, 5338)
,(40, 20, 6788)
,(75, 24, 5669)
,(3, 41, 2422)
,(22, 3, 3699)
,(9, 47, 4959)
,(52, 24, 5234)
,(97, 31, 1360)
,(68, 15, 3330)
,(24, 17, 3526)
,(95, 29, 1623)
,(33, 30, 2151)
,(35, 10, 1633)
,(82, 18, 2126)
,(47, 48, 2924)
,(37, 42, 4544)
,(15, 7, 6693)
,(85, 3, 5535)
,(40, 23, 670)
,(56, 36, 736)
,(49, 26, 1016)
,(30, 5, 1695)
,(12, 45, 3304)
,(22, 37, 5357)
,(47, 36, 882)
,(44, 25, 4748)
,(79, 16, 3338)
,(84, 5, 1366)
,(57, 5, 3753)
,(46, 47, 990)
,(21, 40, 3443)
,(13, 17, 5940)
,(16, 9, 6219)
,(18, 13, 6769)
,(18, 47, 2916)
,(19, 20, 2510)
,(65, 48, 6888)
,(44, 39, 2890)
,(64, 33, 3030)
,(96, 37, 7077)
,(72, 33, 6897)
,(33, 1, 6762)
,(27, 17, 2685)
,(30, 14, 2362)
,(80, 31, 452)
,(53, 33, 1216)
,(79, 19, 5165)
,(18, 41, 7013)
,(19, 39, 184)
,(8, 25, 4907)
,(41, 11, 3120)
,(89, 23, 4310)
,(99, 43, 6596)
,(47, 46, 318)
,(98, 18, 4904)
,(63, 32, 1135)
,(34, 6, 7126)
,(26, 9, 2615)
,(27, 28, 6077)
,(99, 8, 1707)
,(92, 10, 6129)
,(70, 45, 536)
,(90, 46, 1120)
,(47, 28, 5820)
,(26, 16, 3273)
,(68, 10, 3322)
,(30, 28, 969)
,(87, 37, 2671)
,(70, 8, 264)
,(8, 31, 6588)
,(76, 50, 5112)
,(68, 28, 5262)
,(20, 15, 3281)
,(61, 37, 5205)
,(1, 44, 4134)
,(19, 50, 6101)
,(91, 30, 2481)
,(39, 35, 4239)
,(11, 3, 3246)
,(49, 50, 5335)
,(4, 42, 2158)
,(25, 36, 3907)
,(10, 29, 5522)
,(73, 25, 6571)
,(1, 35, 5888)
,(42, 44, 6217)
,(80, 26, 1102)
,(19, 9, 164)
,(58, 19, 2214)
,(13, 29, 3644)
,(28, 36, 2050)
,(72, 29, 6548)
,(43, 39, 1190)
,(4, 5, 3064)
,(9, 10, 807)
,(44, 19, 34)
,(78, 35, 1298)
,(59, 35, 3523)
,(59, 43, 4775)
,(28, 34, 2430)
,(24, 49, 7179)
,(27, 23, 5529)
,(63, 15, 846)
,(91, 50, 751)
,(70, 39, 3074)
,(73, 6, 7029)
,(92, 7, 7163)
,(31, 18, 6376)
,(33, 35, 208)
,(80, 7, 5184)
,(25, 8, 659)
,(83, 40, 766)
,(43, 41, 5337)
,(35, 41, 619)
,(89, 44, 5058)
,(8, 45, 6611)
,(7, 44, 5328)
,(69, 19, 3827)
,(35, 47, 4511)
,(12, 47, 5407)
,(74, 42, 1184)
,(40, 34, 6063)
,(2, 44, 6977)
,(33, 15, 2083)
,(24, 29, 2410)
,(91, 21, 3513)
,(19, 13, 5785)
,(12, 37, 1917)
,(98, 28, 5614)
,(56, 25, 6219)
,(48, 16, 6367)
,(100, 31, 6994)
,(93, 25, 1442)
,(87, 4, 135)
,(95, 38, 4042)
,(46, 23, 5760)
,(20, 22, 3723)
,(14, 47, 4933)
,(95, 32, 716)
,(90, 21, 741)
,(7, 23, 2774)
,(11, 43, 7071)
,(41, 13, 6922)
,(37, 50, 6662)
,(29, 17, 1345)
,(79, 9, 7137)
,(71, 27, 774)
,(98, 19, 371)
,(35, 18, 2798)
,(20, 3, 7030)
,(88, 2, 524)
,(10, 40, 4394)
,(64, 43, 6487)
,(58, 3, 1491)
,(84, 42, 3213)
,(60, 43, 4360)
,(50, 9, 3362)
,(11, 10, 6394)
,(100, 5, 647)
,(34, 38, 3596)
,(60, 11, 1455)
,(99, 25, 6940)
,(86, 10, 3780)
,(58, 8, 2288)
,(10, 7, 3479)
,(91, 8, 3812)
,(61, 38, 3530)
,(79, 36, 6337)
,(51, 39, 5976)
,(19, 6, 5148)
,(53, 15, 614)
,(41, 50, 6048)
,(1, 43, 2464)
,(49, 37, 4757)
,(9, 47, 80)
,(15, 1, 487)
,(41, 5, 6779)
,(57, 37, 25)
,(1, 41, 3638)
,(33, 24, 5238)
,(14, 34, 637)
,(81, 3, 6135)
,(24, 35, 1009)
,(65, 45, 2071)
,(19, 7, 117)
,(83, 36, 5606)
,(87, 19, 5372)
,(77, 39, 50)
,(78, 49, 4110)
,(9, 20, 1260)
,(34, 35, 2722)
,(62, 18, 510)
,(58, 14, 6234)
,(16, 46, 2368)
,(93, 39, 1438)
,(66, 19, 4361)
,(99, 9, 779)
,(73, 23, 830)
,(99, 19, 6397)
,(9, 2, 692)
,(29, 8, 2135)
,(97, 16, 1528)
,(91, 29, 5576)
,(95, 13, 3108)
,(92, 36, 3193)
,(42, 42, 128)
,(81, 6, 4226)
,(97, 5, 1532)
,(7, 31, 1659)
,(27, 32, 7034)
,(19, 25, 1687)
,(77, 44, 5515)
,(4, 49, 3266)
,(99, 38, 5763)
,(84, 3, 6639)
,(68, 41, 5347)
,(68, 29, 3862)
,(88, 14, 6602)
,(51, 16, 404)
,(9, 45, 5040)
,(99, 33, 6762)
,(80, 39, 5519)
,(20, 8, 5993)
,(68, 20, 6282)
,(57, 41, 2700)
,(79, 7, 381)
,(30, 20, 5718)
,(49, 30, 498)
,(45, 16, 1558)
,(32, 14, 4045)
,(71, 48, 461)
,(76, 1, 703)
,(87, 2, 2007)
,(16, 24, 4832)
,(92, 50, 1291)
,(67, 16, 3274)
,(55, 37, 1310)
,(1, 40, 3658)
,(91, 25, 402)
,(88, 18, 3252)
,(56, 45, 6350)
,(28, 49, 3142)
,(81, 41, 5861)
,(28, 47, 724)
,(78, 7, 6560)
,(13, 29, 4297)
,(89, 39, 34)
,(77, 39, 3875)
,(38, 36, 1120)
,(56, 43, 3681)
,(5, 50, 4872)
,(83, 31, 4313)
,(79, 32, 193)
,(75, 43, 3573)
,(65, 14, 5741)
,(9, 12, 4739)
,(60, 40, 6601)
,(46, 50, 4177)
,(45, 40, 756)
,(35, 45, 1878)
,(29, 13, 6931)
,(31, 12, 6726)
,(43, 48, 3812)
,(32, 17, 6751)
,(58, 8, 6635)
,(51, 7, 3676)
,(75, 15, 3439)
,(50, 48, 470)
,(60, 30, 78)
,(10, 19, 5881)
,(50, 23, 5392)
,(77, 24, 4339)
,(54, 17, 209)
,(87, 33, 2030)
,(13, 15, 3231)
,(98, 45, 6000)
,(66, 47, 4806)
,(60, 31, 4265)
,(79, 40, 2112)
,(90, 36, 4700)
,(93, 17, 4085)
,(72, 41, 6396)
,(19, 41, 4931)
,(32, 49, 5638)
,(49, 44, 4613)
,(20, 19, 4858)
,(62, 31, 4996)
,(18, 22, 3177)
,(15, 45, 6065)
,(16, 50, 4886)
,(31, 32, 4532)
,(38, 47, 2379)
,(72, 21, 3358)
,(57, 40, 609)
,(15, 17, 6938)
,(89, 6, 5223)
,(96, 30, 2987)
,(62, 15, 671)
,(96, 38, 6403)
,(13, 29, 6612)
,(5, 2, 5917)
,(1, 1, 2439)
,(16, 6, 6753)
,(32, 25, 6859)
,(21, 3, 5938)
,(61, 2, 707)
,(48, 14, 5667)
,(12, 11, 2844)
,(27, 35, 2557)
,(54, 21, 1394)
,(45, 30, 6139)
,(55, 26, 5458)
,(27, 8, 2376)
,(63, 37, 53)
,(79, 33, 767)
,(47, 21, 1620)
,(27, 18, 5164)
,(80, 33, 2149)
,(14, 47, 5957)
,(43, 38, 2297)
,(99, 31, 4954)

--Consultas necessárias:

--Listar todos os filmes com sua classificacao e idade minima
--Listar a quantidade de filmes para cada faixa etária
--Listar a quantidade de filmes que cada publisher possui
--Listar o gênero mais feito por cada publisher
--Listar os 10 diretores com mais filmes
--Listar os 10 atores/atrizes com mais filmes
--Listar os 10 filmes mais assistidos
--Listar os 3 gêneros mais assistidos
--Listar os 5 filmes com menor indice de retenção, que é quando começam a assistir e param (usar o os filmes com menor qtdAssistidos
--Listar os 5 filmes com maior indice de retenção, que é quando começam a assistir e terminam(usar o os filmes com o maior qtdSegundosAssistidos ou se ele for nulo, considerar a duracao do video)
--Listar os publishers ordenados por data de fim do contrato mais proximas (menores)
--Listar o total faturado por cada plano
--1. Listar todos os filmes com sua classificacao e idade minima

select v.nome [Nome do Filme], c.idade_minima as [Idade Minima], v.id_classificacao as [Classificação]
from Video as v
inner join	Classificacao as c 
			on v.id_classificacao = c.id
order by c.idade_minima

--2. Listar a quantidade de filmes para cada faixa etária
select count(v.nome) as [Quantidade de Filmes], c.idade_minima as Idade
from Video as v
inner join	Classificacao as c 
			on v.id_classificacao = c.id
group by c.idade_minima

--3. Listar a quantidade de filmes que cada publisher possui
select p.nome as [Nome Distribuidora], count(v.id_publisher) as [Quantidade de Filmes]
from Publisher as p
inner join	Video as v
			on v.id_publisher = p.id
group by p.nome

--4. Listar o gênero mais feito por cada publisher
select p.nome as Publisher, g.nome as [Nome do Genero], count(v.id_genero) as [Quatidade de Filmes]
from Genero as g
inner join	Video as v
			on v.id_genero = g.id
inner join	Publisher as p
			on v.id_publisher = p.id
group by p.nome, g.nome
order by p.nome
--*****************FAZER A PARTE QUE PEGA A MAIOR QTD DE FILMES DE CADA GÊNERO***************************

--5. Listar os 10 diretores com mais filmes

select top 10 e.nome as [Diretor], count(ve.id_video) as [Quantidade de filmes]
from Elenco as e
inner join	Papel_Elenco as pe
			on pe.id = e.id_papel
inner join	Video_Elenco as ve
			on ve.id_elenco = e.id
where pe.cd_papel = 'Diretor'
--where pe.id = 1
group by e.nome
order by count(ve.id_video) desc

--*****************DELIMITAR AOS 10 DIRETORES COM MAIOR QUANTIDADE DE FILMES*************************** --- Feito

--6. Listar os 10 atores/atrizes com mais filmes
select top 10 e.nome as [Ator/Atriz], count(ve.id_video) as [Quantidade de Filmes]
from Elenco as e
inner join	Papel_Elenco as pe
			on pe.id = e.id_papel
inner join	Video_Elenco as ve
			on ve.id_elenco = e.id
where pe.cd_papel = 'Ator/Atriz'
--where pe.id = 2
group by e.nome
order by count(ve.id_video) desc

--7- Listar os 10 filmes mais assistidos
select top 10 v.nome as Filme, count(v.id) as [Quantidade de Videos]
from Video as v
inner join  Historico_Usuario as hu
			on hu.id_video = v.id
group by v.nome
order by [Quantidade de Videos] desc

--8- Listar os 3 gêneros mais assistidos
select top 3 g.nome as Gênero, count(g.id) as [Quantidade Videos]
from genero as g

inner join  Video as v
			on v.id_genero = g.id

inner join  Historico_Usuario as h
			on h.id_video = v.id
group by g.nome
order by [Quantidade Videos] desc

--9- Listar os 5 filmes com maior indice de retenção, que é quando começam a assistir e param
  -- (usar o os filmes com o maior qtdSegundosAssistidos ou se ele for nulo, considerar a duracao do video)

select top 5 v.nome as Filme, count(v.id) as [Qtd Videos Não Finalizados]
from Video as v

inner join  Historico_Usuario as h
			on h.id_video = v.id
where h.qtdSegundosAssistidos < v.duracao_segundos

group by v.nome
order by [Qtd Videos Não Finalizados] desc

--10- Listar os 5 filmes com maior indice de retenção, que é quando começam a assistir e terminam
  -- (usar o os filmes com o maior qtdSegundosAssistidos ou se ele for nulo, considerar a duracao do video)
select top 5 v.nome as Filme, count(v.id) as [Quantidade Videos Finalizados]
from Video as v

inner join  Historico_Usuario as h
			on h.id_video = v.id
where h.qtdSegundosAssistidos >= v.duracao_segundos

group by v.nome
order by count(v.id) desc

--11- Listar os publishers ordenados por data de fim do contrato mais proximas (menores)
select nome as Produtor, dt_fim_contrato as [Fim do Contrato]
from publisher

group by nome, dt_fim_contrato
order by dt_fim_contrato

--12- Listar o total faturado por cada plano
select codigo as [Código do Plano], sum(preco * DATEDIFF ( month  , dt_ini_vigencia , dt_fim_vigencia )) as [Total Faturado] from PlanoAssinatura
group by codigo
order by [Total Faturado] desc

-------------------------------------------- Apagar tabelas e database e criar data base --------------------------------------

drop table Video_Elenco
drop table Plano_usuario
drop table PlanoAssinatura
drop table Historico_Usuario
drop table Video
drop table Usuario
drop table Regiao
drop table Publisher
drop table Elenco
drop table Papel_Elenco
drop table Genero
drop table Classificacao
use master
drop database LetsClix
create database LetsClix

-------------------------------------------- Apagar tabelas e database e criar data base --------------------------------------
