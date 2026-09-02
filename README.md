# 🎬 Streaming Service — Graph Database Model

> Modelagem de dados em grafos para uma plataforma de streaming utilizando **Neo4j e Cypher**.

![Neo4j](https://img.shields.io/badge/Neo4j-Graph%20Database-4581C3?logo=neo4j&logoColor=white)
![Cypher](https://img.shields.io/badge/Cypher-Query%20Language-018BFF)
![Graph Database](https://img.shields.io/badge/Database-Graph%20Model-2E8B57)
![NoSQL](https://img.shields.io/badge/Database-NoSQL-orange)
![Data Modeling](https://img.shields.io/badge/Data-Modeling-7952B3)
![DIO](https://img.shields.io/badge/DIO-Neo4j%20Bootcamp-5A0FC8)
![Status](https://img.shields.io/badge/Status-Concluído-brightgreen)

---

## 📌 Sobre o Projeto

O **Streaming Graph Model** é um projeto de **modelagem de dados orientada a grafos** desenvolvido para representar o domínio de uma plataforma de streaming.

A solução utiliza **Neo4j e Cypher** para estruturar entidades e relacionamentos entre:

- usuários;
- filmes;
- séries;
- gêneros;
- atores;
- diretores.

O objetivo é demonstrar como bancos de dados em grafos podem representar de forma natural relações complexas existentes em plataformas de conteúdo digital.

---

## 🎯 Objetivo

Construir um modelo capaz de representar as principais entidades e conexões de um serviço de streaming e permitir consultas orientadas a relacionamentos.

O projeto trabalha conceitos como:

- Graph Databases
- Neo4j
- Cypher Query Language
- NoSQL
- Data Modeling
- Graph Data Modeling
- Nós e relacionamentos
- Propriedades
- Constraints
- Integridade de dados
- Consultas em grafos
- Fundamentos de Recommendation Systems

---

## 🧠 Por que utilizar Grafos?

Plataformas de streaming são altamente relacionais.

Um mesmo conteúdo pode estar conectado a:

- usuários;
- gêneros;
- atores;
- diretores;
- avaliações;
- outros conteúdos.

Em um banco relacional tradicional, diversas análises podem exigir múltiplos `JOINs`.

Em um banco de grafos, os relacionamentos fazem parte diretamente do modelo.

Exemplo:

```text
Usuário
   ↓
WATCHED
   ↓
Filme
   ↓
IN_GENRE
   ↓
Gênero
```

Isso facilita a navegação entre entidades e torna análises relacionais mais intuitivas.

---

## 🏗️ Modelo de Dados

O grafo utiliza seis tipos principais de nós:

| Nó | Representação |
|---|---|
| `User` | Usuários da plataforma |
| `Movie` | Filmes disponíveis |
| `Series` | Séries disponíveis |
| `Genre` | Gêneros dos conteúdos |
| `Actor` | Atores e atrizes |
| `Director` | Diretores |

---

## 🔗 Relacionamentos

O modelo utiliza relacionamentos como:

| Relacionamento | Significado |
|---|---|
| `WATCHED` | Usuário assistiu determinado conteúdo |
| `ACTED_IN` | Ator participou de filme ou série |
| `DIRECTED` | Diretor dirigiu determinado conteúdo |
| `IN_GENRE` | Conteúdo pertence a determinado gênero |

O relacionamento `WATCHED` também pode armazenar propriedades, como avaliações atribuídas pelos usuários.

---

## 🖼️ Diagrama do Modelo

<p align="center">
  <img src="Assets/streaming-graph-model.png"
       alt="Modelo de dados em grafos da plataforma de streaming"
       width="850">
</p>

O diagrama apresenta visualmente as entidades e os relacionamentos utilizados na modelagem.

---

## 📊 Dataset Demonstrativo

O modelo é populado com dados de exemplo para permitir a execução das consultas.

| Entidade | Quantidade |
|---|---:|
| Usuários | 10 |
| Filmes | 6 |
| Séries | 4 |
| Gêneros | 6 |
| Atores | 8 |
| Diretores | 5 |

**Total de nós:** 39  
**Relacionamentos:** 44

Esses dados têm finalidade didática e demonstrativa.

---

## 🔐 Constraints e Integridade

O modelo utiliza constraints para garantir unicidade dos identificadores das principais entidades.

Exemplo conceitual:

```text
User     → userId
Movie    → movieId
Series   → seriesId
Genre    → genreId
```

Isso ajuda a:

- evitar registros duplicados;
- manter consistência;
- melhorar a confiabilidade do grafo.

---

## 🗄️ Construção do Grafo

A estrutura completa do banco está em:

[`Cypher/modelo.cypher`](Cypher/modelo.cypher)

Esse arquivo contém a criação de:

- constraints;
- nós;
- propriedades;
- relacionamentos;
- dados demonstrativos.

---

## 🔎 Consultas com Cypher

As consultas analíticas estão em:

[`Cypher/consultas.cypher`](Cypher/consultas.cypher)

Elas permitem explorar conceitos como:

- navegação entre nós;
- filtros;
- relacionamentos;
- agregações;
- padrões;
- preferências;
- conteúdos relacionados;
- recomendações baseadas em conexões.

---

## 🎯 Possibilidades de Recomendação

Uma das aplicações mais interessantes desse tipo de modelagem é a recomendação de conteúdo.

Um fluxo conceitual pode ser representado por:

```text
Usuário
   ↓
Conteúdos Assistidos
   ↓
Gêneros Preferidos
   ↓
Usuários com Comportamento Semelhante
   ↓
Outros Conteúdos
   ↓
Recomendação
```

A estrutura em grafo permite percorrer essas conexões com maior naturalidade.

Este projeto demonstra os **fundamentos de modelagem necessários** para que algoritmos mais avançados de recomendação sejam incorporados posteriormente.

---

## 🔄 Fluxo do Projeto

```text
Definição do Domínio
        ↓
Entidades
        ↓
Relacionamentos
        ↓
Constraints
        ↓
Dados de Exemplo
        ↓
Neo4j
        ↓
Consultas Cypher
        ↓
Análise das Conexões
        ↓
Possibilidades de Recomendação
```

---

## 🛠️ Tecnologias

| Tecnologia | Uso |
|---|---|
| **Neo4j** | Banco de dados orientado a grafos |
| **Cypher** | Criação e consulta do grafo |
| **Arrows** | Modelagem visual |
| **Git** | Versionamento |
| **GitHub** | Repositório e documentação |

---

## 📂 Estrutura do Repositório

```text
Streaming-Graph-Model/
│
├── Assets/
│   └── streaming-graph-model.png
│
├── Cypher/
│   ├── modelo.cypher
│   └── consultas.cypher
│
└── README.md
```

---

## ▶️ Como Executar

### 1. Clone o repositório

```bash
git clone https://github.com/MCLG1661/Streaming-Graph-Model.git
cd Streaming-Graph-Model
```

### 2. Configure o Neo4j

Utilize uma instância compatível do Neo4j.

### 3. Crie o modelo

Execute o conteúdo de:

```text
Cypher/modelo.cypher
```

Isso criará a estrutura do grafo e os dados demonstrativos.

### 4. Execute as consultas

Depois, utilize:

```text
Cypher/consultas.cypher
```

para explorar os dados e relacionamentos.

---

## 💡 Competências Demonstradas

### Graph Databases

- Neo4j
- Cypher
- Graph Data Modeling
- Graph Databases
- NoSQL

### Data Modeling

- definição de entidades;
- definição de relacionamentos;
- propriedades;
- constraints;
- integridade de dados;
- modelagem de domínios.

### Analytics

- navegação em grafos;
- análise de relacionamentos;
- consultas baseadas em padrões;
- fundamentos de recomendação.

### Engenharia

- Git
- GitHub
- organização de artefatos
- documentação técnica

---

## 🚀 Possíveis Evoluções

O modelo pode evoluir incorporando novas entidades:

- episódios;
- temporadas;
- estúdios;
- países;
- premiações;
- listas pessoais;
- histórico temporal de visualização.

Também pode evoluir em direção a análises mais avançadas:

- similaridade entre usuários;
- recommendation systems;
- PageRank;
- Community Detection;
- Node Similarity;
- Graph Data Science;
- Graph Machine Learning;
- embeddings;
- avaliação de recomendações.

Uma evolução natural seria utilizar a **Neo4j Graph Data Science Library** para transformar o modelo em um sistema de recomendação mais avançado.

---

## ⚠️ Limitações

Este projeto possui finalidade **educacional e demonstrativa**.

O dataset utilizado é pequeno e construído para demonstrar conceitos de modelagem em grafos.

Portanto:

- não representa uma plataforma de streaming em escala real;
- não utiliza dados reais de usuários;
- não implementa algoritmos avançados de recomendação;
- não possui pipeline de produção.

O foco está nos fundamentos de **modelagem, relacionamentos e consultas em Neo4j**.

---

## 🎓 Contexto Acadêmico

Projeto desenvolvido durante o **Bootcamp Neo4j — Análise de Dados com Grafos**, da DIO.

**Disciplina:** Fundamentos de Neo4j  
**Professor:** Matheus Ferreira  
**Período:** Primeiro semestre de 2026

O desafio teve como objetivo aplicar conceitos de modelagem em grafos, Cypher, constraints, relacionamentos e consultas em um domínio próximo de uma aplicação real.

---

## 👨‍💻 Autor

**Marcus Guedes**

Marketing | Data Science | Inteligência Artificial | Gestão de Projetos

- **GitHub:** [MCLG1661](https://github.com/MCLG1661)
- **LinkedIn:** Marcus Guedes

---

🎬 **Transformando dados em conexões e conexões em conhecimento.**
