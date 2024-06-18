#### script de DQL 



##1

select sum((total*0.5)+ gorgeta) as comissao_total

from tb_pedido ped

left join tb_comissao tc 

on ped.pedido_id = tc.pedido_id 

left join tb_entregador entr

on ped.entregador = entr.entregador_id 

where ped.status_id = 9  and ped.entregador = 1;





##2

select 

tic.nome as nome_item,

tip.quantidade as quantidade,

tic.preco_unitario as preco_unit,

tip.observacao as obs,

tc.nome as categoria_item,

tcard.nome as cardapio,

tc2.categoria_id as categoria_cardapio,

te.nome_fantasia as estabelecimento

from tb_item_pedido tip 

left join tb_item_cardapio tic 

on tip.item_cardapio_id = tic.item_id 

left join tb_categoria tc 

on tic.categoria_id = tc.categoria_id 

left join tb_cardapio tcard

on tic.cardapio_id = tcard.cardapio_id 

left join tb_categoria tc2

on tcard.categoria_id = tc2.categoria_id 

left join tb_estabelecimento te 

on tcard.estabelecimento_id = te.estabelecimento_id 

where tip.pedido_id = 2

order by tic.nome asc;





##3

select tb_status.nome as tb_pedido_historico.data_hora as data_hora from tb_pedido_historico

join tb_status ts 

on tb_pedido_historico.status_id = tb_status.status_id

order by tb_pedido_historico.data_hora;





##4

select 

stat.nome_pt as situacao,

ped.pedido_id as pedido,

tc.pre_nome as nome,

tc.sobrenome as sobrenome ,

tec.cep as cidade,

tec.logadouro as bairro,

tec.numero as numero,

ped.data_hora_solicitacao as hora_solicitacao,

ped.total as total_pedido,

item.quantidade as unidades

 from tb_status stat

left join tb_pedido ped

on stat.status_id = ped.status_id 

left join tb_endereco_cliente tec 

on ped.cliente_id = tec.cliente_id 

left join tb_item_pedido tip 

on ped.pedido_id = tip.pedido_id 

left join tb_cliente tc 

on tec.cliente_id = tc.cliente_id 

left join tb_item_pedido item

on ped.pedido_id = item.pedido_id 

where stat.status_id = 1  ;



##5

select 

ped.pedido_id as codigo_pedido,

card.numero as numero_cartao,

tv.codigo_promo as promocao,

pag.valor as valor_pedido,

pag.data_hora as data

from tb_pagamento pag

left join tb_pedido ped

on pag.pedido_id = ped.pedido_id

left join tb_cartao card

on pag.cartao_id = card.cartao_id 

left join tb_voucher tv 

on pag.codigo_promo = tv.codigo_promo 

where ped.pedido_id = 1

order by pag.valor ;