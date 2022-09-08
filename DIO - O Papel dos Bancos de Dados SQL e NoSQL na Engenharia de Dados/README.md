# DIO - O Papel dos Bancos de Dados SQL e NoSQL na Engenharia de Dados

## Algumas características e diferenças entre Banco de Dados SQL e NoSQL:

### SQL

```bash
Escalabilidade Vertical ou Horizontal.
Estrutura mais rígida, previamente moldada, modelada, definição de chaves primárias e secundárias.
Maior consistência, organização.
Performance: Dependente de sistema de disco para performance.
Transações: Atomicidade, consistência, isolamento, durabilidade (ACID).
```

### NoSQL

```bash
Escalabilidade Horizontal.
Particionando (sharding) entre os nós
Ausência quase completa de regras de esquema, mas há boas práticas que devem ser seguidas para que ele se torne performático.
Menos garantia da consistência.
Performance: Depende do tamanho do cluster e latência da rede.
Transações: Basically available, soft-state, eventually consistent.
Vantagens: flexibilidade, escalabilidade, alta performance.
No caso do Mongo, é recomendado o uso para grande volume de dados (Mongo), mas não é recomendado em casos de necessidade de Relacionamentos/JOIN, em que propriedades ACID e transações são importantes e em sistemas de pagamento, pois diversas entidades de pagamento não homologam em sistemas que dados financeiros de clientes não estão em um banco de dados relacional.
```

### Engenharia de Dados

```bash
O Engenheiro de Dados Prepara a informação que será consumida, por isso precisa ter o conhecimento técnico para coletar, preparar, armazenar e deixar essa informação disponível para que o cientista de dados utilize.
O Engenheiro de Dados tem maior proximidade com a manipulação dos dados e possui o conhecimento técnico das ferramentas.
Engenheiro vai gerar essas informações para consumo do cientista de dados ou outras opções de consumo de informações, por isso é necessário seu conhecimento nos diversos tipos de Banco de Dados.
```
