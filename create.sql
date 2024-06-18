CREATE SCHEMA IF NOT exists food_delivery;

use food_delivery;





create table if not exists tb_usuario(
usuario_id integer auto_increment not null,
nome_usuario varchar(20) unique not null,
senha char (8) not null ,
data_criacao datetime not null,
data_ultima_atualizacao datetime null,
ativo bit not null, 

primary key (usuario_id)
);


create table if not exists tb_entregador(
entregador_id integer  auto_increment not null,
cnh char (9) not null,
validade_cnh date not null,
nome varchar (20) not null,
sobrenome varchar (40) not null,
sexo char (1) not null,
placa_moto char(7) not null,
nota decimal (3,2) null,

primary key (entregador_id)
);


create table if not exists tb_dias_semana (
dia_id integer auto_increment not null, 
nome varchar (15) not null, 

primary key(dia_id)
);





create table if not exists tb_voucher(
codigo_promo varchar(15) not null, 
valor decimal(7,2) null,
porcentagem decimal (7,2) null,
tipo_voucher bit not null, 
data_inicio datetime not null, 
data_fim datetime not null, 
descricao varchar(144) not null, 
quantidade integer not null,

primary key (codigo_promo)
);





create table if not exists tb_endereco(
cep char(8) not null ,
cidade varchar (30) not null, 
uf char (2) not null, 
primary key (cep)
);



create table if not exists tb_cliente (
cliente_id integer auto_increment  not null, 
usuario_id integer not null, 
cpf char (11) unique not null, 
rg varchar (11) not null,
pre_nome varchar (15) not null,
sobrenome varchar (80) not null, 
sexo char(1) null,
data_nascimento date not null, 

primary key(cliente_id ),
foreign key (usuario_id) references tb_usuario(usuario_id)
ON DELETE cascade
);





create table if not exists tb_endereco_cliente(

	endereco_cliente_id integer  auto_increment not null,

	cep char (8) not null,

	cliente_id integer not null,

	logadouro varchar(40) not null,

	bairro varchar (40) null,

	numero varchar(8) null,

	ponto_referencia varchar (40) null,

	complemento varchar (40) null



 primary key(endereco_cliente_id),

 foreign key(cliente_id)references tb_cliente(cliente_id),

 foreign key(cep) references tb_endereco(cep)

);





create table if not exists tb_estabelecimento(

estabelecimento_id integer  auto_increment  not null,

categoria_estabelecimento_id integer not null,

cnpj char(14) unique not null,

razao_social varchar(60) not null,

nome_fantasia varchar(60)not null,

descricao varchar (144) null,

email varchar(30) not null,

nota decimal(3,2) not null,



primary key(estabelecimento_id),

foreign key(categoria_estabelecimento_id)references tb_categoria_estabelecimento(categoria_estabelecimento_id)

);



create table if not exists tb_contato_estabelecimento(

estabelecimento_id integer  not null,

contato char (11) not null

);

 alter table tb_contato_estabelecimento add constraint fk_contato foreign key (estabelecimento_id) references tb_estabelecimento(estabelecimento_id);





create table if not exists tb_horario_funcionamento(

estabelecimento_id integer  not null,

dia_id integer not null,

horario_inicio time default(00) not null,

horario_fim time  default (23)not null,

almoco bit default(0) not null,



foreign key (estabelecimento_id)references tb_estabelecimento(estabelecimento_id),

foreign key (dia_id) references tb_dias_semana(dia_id)

);





create table if not exists tb_cardapio(

cardapio_id integer  auto_increment not null,

categoria_cardapio_id integer not null,

estabelecimento_id integer not null,

nome varchar (20) not null,



primary key(cardapio_id),

foreign key(categoria_cardapio_id) references tb_categoria_cardapio(categoria_cardapio_id),

foreign key(estabelecimento_id) references tb_estabelecimento(estabelecimento_id)

);



create table if not exists tb_item_cardapio(

item_id integer  auto_increment not null,

cardapio_id integer not null,

categoria_item_id integer not null,

nome varchar(30)not null,

preco_unitario decimal(6,2) not null,

descricao varchar (30) not null,

observacoes varchar (144) null,



primary key(item_id),

foreign key (cardapio_id) references tb_cardapio(cardapio_id),

foreign key (categoria_item_id) references tb_categoria_item(categoria_item_id)

);



create table if not exists tb_estabelecimento_endereco(

estabelecimento_endereco_id integer auto_increment not null,

estabelecimento_id integer not null,

cep char (11) not null,

logadouro varchar(40)null,

numero varchar (8) null,

ponto_referencia varchar (40) null,

complemento varchar (40)null,



primary key (estabelecimento_endereco_id),

foreign key(estabelecimento_id) references tb_estabelecimento(estabelecimento_id),

foreign key(cep) references tb_endereco(cep)

);



create table if not exists tb_status (

status_id integer  auto_increment  not null,

nome varchar (20) unique not null,

status_anterior integer  null ,

status_proximo integer null,



primary key (status_id),

foreign key (status_anterior) references tb_status(status_id ),

foreign key (status_proximo)references tb_status (status_id )

);



select *from tb_status ;

create table if not exists tb_pedido (

pedido_id integer  auto_increment not null,

endereco_cliente_id integer not null,

cliente_id integer not null,

estabelecimento_id integer not null,

status_id integer not null,

data_hora_solicitacao datetime not null,

data_hora_entrega datetime null,

total decimal (7,2) not null,

desconto decimal(7,2) not null,



primary key(pedido_id),

foreign key(estabelecimento_id)references tb_estabelecimento(estabelecimento_id),

foreign key (cliente_id)references tb_cliente(cliente_id),

foreign key (status_id) references tb_status(status_id)

);

alter table add constraint fk_endereco foreign key (endereco_cliente_id)references tb_endereco_cliente (endereco_cliente_id);



create table if not exists tb_pedido_historico(

pedido_id integer not null,

status_id integer not null,

data_hora datetime not null

);

alter table tb_pedido_historico add constraint fk_pedido foreign key (pedido_id) references tb_pedido(pedido_id);

alter table tb_pedido_historico add constraint fk_status foreign key (status_id) references tb_status(status_id);



create table if not exists tb_item_pedido(

pedido_id integer not null,

item_cardapio_id integer not null,

quantidade integer not null,

observacao varchar(144) null,



foreign key ( pedido_id) references tb_pedido(pedido_id)

);

  alter table tb_item_pedido add constraint fk_item_cardapio foreign key (item_cardapio_id)references tb_item_cardapio(item_id);



create table if not exists tb_cartao(

cartao_id integer  auto_increment not null,

cliente_id integer not null,

numero char (16) not null,

nome_titular varchar (25) not null,

validade char (5) not null,

cvv char (3) not null,



primary key (cartao_id),

foreign key (cliente_id) references tb_cliente(cliente_id)

);



create table if not exists tb_pagamento(

pedido_id integer not null,

cartao_id integer null,

codigo_promo varchar (15) null,

valor decimal (7,2) not null,

data_hora datetime not null,



foreign key (pedido_id) references tb_pedido( pedido_id),

foreign key ( cartao_id) references tb_cartao (cartao_id)

);

 alter table tb_pagamento add constraint fk_promocao foreign key (codigo_promo) references tb_voucher(codigo_promo);
