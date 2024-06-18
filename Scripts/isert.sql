use food_delivery;


insert into tb_usuario( nome_usuario, senha, data_criacao , data_ultima_atualizacao, ativo)
values ('paulo001','ilt55367','2011/02/02 00:15:00',' 2012/05/04 20:12:15',1),
('laura0102','if2314h8',' 2012/02/02 20:12:15','2012/10/07 20:12:58',1),
(' mariajanice012','if2314@#','2012/01/11 20:12:00','2013/11/01 20:13:20',1),
('ana_clara144','if2314@!','2013/01/02 20:13:45','2013/01/02 20:13:50',0),
('carlos_manoel01','if2314@1','2012/01/10 20:12:00','2012/12/10 20:12:00',0),
('joao4555','if2314@2','2012/01/10 20:12:00','2012/10/20 13:15:45',1),
('carlos544','if2314@2','2012/10/10 20:12:25','2013/10/10 17:45:35',1),
('ana_maria488','if2314@2','2011/10/10 20:11:00','2012/10/09 23:45:00',1),
('marcos55','if2314@4','2010/10/05 20:10:45','2015/10/15 16:40:23',1),
('fernando002','if2314@5','2009/12/10 20:09:23','2017/10/10 15:19:45',1);


insert into  tb_categoria_estabelecimento (nome)
values(' classico'),
('internacional'),
('gourmet'),
('fast-food'),
('tipico'),
('bares'),
('self-servise'),
('pet friendely'),
('veganos'),
('vegetarianos');

insert into tb_categoria_cardapio (nome)
values 	('entrada'),
('salada'),
('primeiro prato'),
('segundo prato'),
('prato principal'),
('prato intermediario'),
('sobremesa'),
('bebidas sem alcool'),
(' bebidas com alcool'),
(' veganos'),
(' vegetarianos');

insert into tb_categoria_item (nome)
values('refrigerantes'),
('doces'),
('água'),
('sucos'),
('cervejas'),
('laticínios'),
('frutas'),
('legumes');

insert into tb_categoria_item (nome)
values(' carnes'),
('frutos do mar');

insert into tb_dias_semana (nome)
values('domingo'),
(' segunda feira'),
('terca feira'),
('quarta feira'),
('quinta feira'),
(' sexta feira'),
('sabado');

insert into tb_voucher (codigo_promo, valor,tipo_voucher,data_inicio,data_fim,descricao,quantidade)
values('A1B2C3D4E5F6G7',900.00,1  , '2023/01/15 08:30:00', '2023/10/15 08:30:00' ,'compras apartir de 4500,00 reais', 100000 ),
('A1B2C3D4E5F6G8',50.00 , 1,'2023/02/28 14:45:00', '2023/04/28 14:45:00', 'fazendo compras acima de 250,00 reais ,ganhe 50,00 reis de desconto' , 6000),
('O6P7Q8R9S1T2U3',25.00 ,1, '2023/03/10 18:00:00', '2023/05/10 18:00:00' ,'compras acima de 150,00 reais , ganham 25,00 reais de desconto', 12000),
('V4W5X6Y7Z8A9B1',15.00 , 1,'2023/04/05 09:15:00 ', '2023/05/05 09:15:00 ', 'compre um ferro de passar e ganhe 15,00 reais de desconto', 2500),
('C2D3E4F5G6H7I8',18.50  ,1, '2023/05/20 12:30:00',  '2023/06/20 12:30:00',' compras apartir de 100,00 reais ' ,5000),
('J9K1L2M3N4O5P6',17.99  ,1, '2023/06/08 16:45:00',  '2023/07/07 16:45:00',' compras apartir  de 90,00 reais',7000),
('Q7R8S9T1U2V3W4',56.80  ,1, '2023/07/22 20:00:00',  '2023/09/21 20:00:00','compras apartir de 300,00 reais', 15000 ),
('X5Y6Z7A8B9C1D2',100.00 ,1, '2023/08/17 10:15:00',  '2023/10/16 10:15:00',' compras apartir de 600,00 reais',20000),
('E3F4G5H6I7J8K9',400.00 ,1, '2023/09/03 23:30:00', '2023/10/03 23:30:00','compras apartir de 1.500,00 reais',2000 ),
('L1M2N3O4P5Q6R7',1000.00 ,1,'2023/08/28 07:45:00 ','2023/11/05','compras apartir de 5.000,00 reais',50000);

insert into tb_endereco (cep,logadouro ,cidade,uf)
values 
	('44300000', 'rua Maria Quiteria', 'cahoeira','BA'),
	('01001000', ' avenida Getulio vargas','São Paulo','SP'),
	('20000000', ' rua primeiro de marco',' Rio de Janeiro', 'RJ'),
	('30110001',' rua padre pedro pinto' ,' Belo Horizonte',  'MG' ),
	('70000000',' avenida eixo monumental' , 'Brasilia' ,'DF' ),
	('40000000' ,' avenida afranio peixoto', ' Salvador','BA'  ),
	('50000000' ,' rua da uniao' ,'Recife','PE' ),
	('60000000' ,'rua joao moreira' ,' Fortaleza' ,'CE'),
	('90010000', 'rua carlos chagas','Porto Alegre','RS'),
	('80010000',' rua riachuelo',' Curitiba','PR')
;


describe tb_cliente ;
update tb_cliente 


insert into tb_cliente ( usuario_id ,cpf,rg,pre_nome,sobrenome,data_nascimento)
values (1,'15588899975','1954554','Paulo','Silva' ,'1999/05/31'),
(2,'56689748518','1234568','Laura','Costa Guimarães','2003/04/15'),
(3,'45566677787','7895871','Maria Janice','Fernandes','1999/10/17'),
(4,'12365498759','1564897','Ana Clara','Conceição','2000/10/15'),
(5,'45168798756','1789876','Carlos Manoel',' Ferreira','2005/10/01'),
(6,'12356488974','4897564','João',' Costa','2000/05/05'),
(7,'45987612565','4879546','Carlos','Gomes','1984/06/18'),
(8,'45897856418','4578974','Ana Maria',' Silva','1990/05/08'),
(9,'15698465798','5489763','Marcos','Avelar','2007/12/31'),
(10,'16559814514','4587965','Fernando ',' Conceição','2000/12/15');