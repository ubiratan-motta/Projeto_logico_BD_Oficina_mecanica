use oficina_mecanica;

-- Qual(is) os veiculos de cada cliente pessoa Fisica? Recupere o Nome do Cliente, a Marca do Veiculo e o Modelo
select nome, marca, modelo  from cliente_pf
		inner join cliente on idClientePF = idCClientePF
        inner join veiculo on idcliente = idVCliente
        order by nome;
        
-- Qual(is) os veiculos de cada cliente pessoa Juridica?
select Razao_social, marca, modelo  from cliente_pj
		inner join cliente on idClientePJ = idCClientePJ
        inner join veiculo on idcliente = idVCliente
        order by Razao_social;
        
-- Quais os clientes possuem motos?
select nome, Tipo_veiculo, marca, modelo  from cliente_pf
		inner join cliente on idClientePF = idCClientePF
        inner join veiculo on idcliente = idVCliente
        having Tipo_veiculo = "Moto"
        order by marca;
        
-- Quais as peças presentes no estoque?
select nome_peca from estoque_pecas order by nome_peca;

-- Quantas OS existem?
select count(*) from ordem_servico;

-- Quantas OS foram Concluidas?
select count(*) from ordem_servico where Status_ordem = 'Concluida'; 

-- Qual o valor gasto por cada Cliente PJ?
select Razao_Social, CNPJ, Valor from cliente_pj
		inner join cliente on idClientePJ = idCClientePJ
        inner join orcamento on idCliente = idOCliente
        inner join ordem_servico on idOrcamento = idOSOrcamento;
	
-- Recupere o Nome do cliente, o tipo de veiculo, a marca, o modelo, o numero do orçamento e da ordem de serviço;
select pf.Nome, v.Tipo_veiculo, v.Marca, v.Modelo, o.Numero_orcamento, os.Numero from cliente_pf pf
		inner join cliente c on idClientePF = idCClientePF
        inner join veiculo v on idCliente = idVCliente
        inner join orcamento o on idCliente = idOCliente
        inner join ordem_servico os on idOrcamento = idOSOrcamento;
        
-- Recupere o Nome do cliente, o tipo de veiculo, a marca, o modelo, o numero do orçamento e da ordem de serviço
-- que o serviço já está com status de concluido e foi feito pela equipe de motor com a data da conclusão;
select pf.Nome, v.Tipo_veiculo, v.Marca, v.Modelo, o.Numero_orcamento, os.Numero, os.Status_ordem, e.Especialidade, os.Data_conclusao
	from cliente_pf pf
		inner join cliente c on idClientePF = idCClientePF
        inner join veiculo v on idCliente = idVCliente
        inner join orcamento o on idCliente = idOCliente
        inner join ordem_servico os on idOrcamento = idOSOrcamento
        inner join equipes e on idEquipes = idOSEquipes
        having os.Status_ordem = 'Concluida' and e.Especialidade = 'Motor';
        
-- Qual o valor em reais de cada tipo de peça no estoque?
select Nome_peca, round((Quantidade_disponivel*Valor_unitario),2) as Valor_total_em_estoque from estoque_pecas
		order by Nome_peca;

-- - Qual o valor em reais de todas as peças no estoque?
select sum(round((Quantidade_disponivel*Valor_unitario),2)) as Valor_total_em_estoque from estoque_pecas;

-- Recupere o Nome dos funcionarios em cada equipe;
select f.Nome, e.Especialidade from funcionarios f, equipes e where e.Especialidade = f.Especialidade;

-- Recupere o Nome do funcionário Responsavel de cada equipe e o numero das OS executadas por sua equipe;
select Responsavel, Numero from equipes e 
		inner join ordem_servico os on idEquipes = idOSEquipes;
        
-- Quais as peças usadas na manutenção dos veiculos da empresa 'Expresso São Miguel Ltda'?
select Razao_social, Pecas_nescessarias, Quantidade_pecas from cliente_pj
		inner join cliente on idClientePJ = idCClientePJ
        inner join orcamento on idCliente = idOcliente
        inner join precos_orcamento on idOrcamento = idPO_Orcamento
        inner join tabela_precos on idPO_Tabela_precos = idTabela_precos
        where Razao_social = 'Expresso São Miguel Ltda'
        order by Pecas_nescessarias;
        
-- Recupere a equipe responsavel por cada veiculo;
select Especialidade, Tipo_veiculo, concat(Marca, ' | ', Modelo) as Marca_Modelo, Placa from equipes
		inner join ordem_servico on idEquipes = idOSEquipes
        inner join veiculo on idVeiculo = idOSVeiculo
        order by Especialidade and Tipo_veiculo and Marca_Modelo;
        