



alter table tb_pedido add constraint fk_endereco11 foreign key (endereco_cliente_id) references tb_endereco_cliente (endereco_cliente_id);

  

alter table tb_pedido add avaliacao char (1) null;



alter table tb_pedido add descricao_avaliacao varchar (144) null;



alter table tb_pedido add entregador integer not null;

 alter table tb_pedido 

add constraint fk_entregadoribk 

foreign key (entregador)

references tb_entregador(entregador_id);



alter table tb_pedido add gorgeta decimal(6,2) null;

alter table tb_pedido add valor_entrega decimal(6,2) not null;

 ##alter





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



 create table if not exists tb_comissao(
 entregador_id integer not null,
 pedido_id integer not null,

 comissao decimal (6,2) null,

 comissao_receber decimal (6,2) null,

 

  foreign key(pedido_id)references tb_pedido(pedido_id),

  foreign key (entregador_id) references tb_entregador(entregador_id)

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



## alter

alter table tb_status 

add name_eng varchar (20) not null;



alter table tb_status

rename column nome to nome_pt;

##



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

## alter



alter table tb_cartao 

add pessoa_fisica bit null,

add pessoa_juridica bit null;



alter table tb_cartao 

add tp_cartao enum ("debito","credito","refeicao","outros") default 'outros' not null;

##





drop table tb_dias_semana ;





create table if not exists tb_horario_funcionamento(

estabelecimento_id integer  not null,

horario_inicio time default(00) not null,

horario_fim time  default (23)not null,

almoco bit default(0) not null,



foreign key (estabelecimento_id)references tb_estabelecimento(estabelecimento_id)

);



##alter 

alter table tb_horario_funcionamento 

rename column almoco to intervalo;



alter table tb_horario_funcionamento 

add dia enum("seg","ter",'qua',"qui","sex","sab"," feriado") not null;

##



drop table tb_categoria_estabelecimento ;

drop table tb_categoria_cardapio ;

drop table tb_categoria_item ;

use food_delivery;

create table if not exists tb_categoria( 
categoria_id integer auto_increment not null,
nome varchar (15) unique not null ,
descricao_categ enum ("estabelecimento"," cardapio","item_cardapio") not null,
super_categoria integer null,
sub_categoria integer null,

 primary key (categoria_id)
 );