# Projeto de Banco de Dados de Oficina

	- Contexto: Levantamento de requisitos
	- Projeto Conceitual: Modelo Entidade Relacionamento
	- Projeto Lógico: Modelo Relacional

# Modelando Oficina:
## Ordem de serviço:
	- Deve ser vinculada a um tipo de trabalho a ser executado (conserto ou revisão).
	- Valor do serviço.
	- Cada peça tambem irá compor a OS
	- Numero, data de emissão, valor, status e data para conclusão dos trabalhos.
	- Pode ser composta por vários serviços e um mesmo serviço pode estar contido em mais de uma OS.
	- Uma OS pode ter vários tipos de peças e uma peça pode estar presente em mais de uma OS.

## Cliente:
	- O cliente pode ter mais de um veiculo 
	- Autoriza a execução dos serviços

## Veiculo:
	- O veiculo pode ser consertado ou ter revisão periodica
	
## Equipe:
	- Possui um numero de funcionarios
	- Cada um executa uma tarefa
	- Preencher OS com data de entrega
	- Avalia e Executa

## Mecânicos:
	- Código, nome, endereço e especialidade
	
## Tabela de Serviços
	- Tipo de serviço a ser executado, valor do serviço, peças utilizadas, tempo de entrega do serviço, 

## Entidades: 
- Ordem de Serviço, Cliente, Veiculos, Equipes, Funcionarios (mecânicos), Tabela de Serviços, Serviços, Estoque de Peças

# Refinamento:
	- Cliente pode: PJ e PF, possuir mais de um veiculo;
	- Veiculo: Tipo do veiculo (carro, moto, caminhão), proprietário ou responsavel, Placa, Marca, Modelo, ano de fabricação.

# Criar queries SQL com as cláusulas abaixo: 

- Recuperações simples com SELECT Statement
- Filtros com WHERE Statement
- Crie expressões para gerar atributos derivados
- Defina ordenações dos dados com ORDER BY
- Condições de filtros aos grupos – HAVING Statement
- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados


# Perguntas a serem respondidas com Queries:

	- Qual(is) os veiculos de cada cliente pessoa Fisica?
	- Qual(is) os veiculos de cada cliente pessoa Juridica?
	- Quais os clientes possuem motos?
	- Quais as peças presentes no estoque?
	- Quantas OS existem?
	- Quantas OS foram Concluidas?
	- Qual o valor gasto por cada Cliente PJ?
	- Recupere o Nome do cliente, o tipo de veiculo, a marca, o modelo, o numero do orçamento e da ordem de serviço;
	- Recupere o Nome do cliente, o tipo de veiculo, a marca, o modelo, o numero do orçamento e da ordem de serviço que o serviço já está com status de concluido e foi feito pela equipe de motor com a data da conclusão;
	- Qual o valor em reais de cada tipo de peça no estoque?
	- Qual o valor em reais de todas as peças no estoque?
	- Recupere o Nome dos funcionarios em cada equipe;
	- Recupere o Nome do funcionário Responsavel de cada equipe e o numero das OS executadas por sua equipe;
	- Quais as peças usadas na manutenção dos veiculos da empresa 'Expresso São Miguel Ltda'?
	- Recupere a equipe responsavel por cada veiculo;


