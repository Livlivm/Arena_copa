# Arena Copa

##  Descrição do Projeto

O Arena Copa é um aplicativo fullstack desenvolvido para centralizar informações da Copa do Mundo e proporcionar uma experiência interativa aos usuários.

A plataforma permite acompanhar jogos, visualizar placares, consultar jogadores em campo, além de interagir com um sistema de álbum de figurinhas e uma loja de produtos.

O sistema integra funcionalidades de entretenimento e consumo digital em um único ambiente.

---

## Objetivo

Oferecer uma aplicação completa para fãs de futebol, reunindo:

- Informações sobre partidas  
- Interação com figurinhas  
- Sistema de pontos e recompensas  
- Compra de produtos relacionados  
---

## Tecnologias Utilizadas

- Node.js  
- Express  
- Prisma
- MySQL  
- JWT  
- Flutter 

---

## Funcionalidades

- Visualização de jogos  
- Placar das partidas  
- Consulta de jogadores  
- Cadastro e login de usuários  
- Sistema de álbum de figurinhas  
- Loja de produtos  
- Sistema de pontos  

---

##  Como Executar o Projeto

1. Clone o repositório:
```bash
git clone https://github.com/Livlivm/Arena_copa.git
```

2. Acesse a pasta:
```bash
cd copa-backend
```

3. Instale as dependências:
```bash
npm install
```

4. Configure o arquivo `.env`:
```env
DATABASE_URL="mysql://root:senha@localhost:3306/copa"
JWT_SECRET="segredo123"
```

5. Execute as migrações:
```bash
npx prisma migrate dev
npx prisma generate
```

6. Inicie o servidor:
```bash
node src/server.js
```

---

## Funcionamento do Sistema

1. O usuário realiza cadastro ou login  
2. Pode visualizar jogos e informações atualizadas  
3. Acessa o álbum de figurinhas  
4. Compra produtos na loja  
5. Acumula pontos a cada compra  
6. Pode trocar pontos por recompensas  

---

##  Diferenciais

- Integração de múltiplas funcionalidades em um único app  
- Sistema de pontos e recompensas  
- Álbum digital interativo  
- Estrutura fullstack completa  
- Experiência voltada ao fã de futebol  

---
## Link frount inicial
https://livlivm.github.io/Arenasite/
---
## Autoria

- Read.me realizad por Eduarda Massaro e Lívia Morais
  
---

## Links Figma

- Desktop: https://www.figma.com/proto/5mUIzY55xuB2uLAclh1gOb/Copa-desktop?node-id=0-43&t=KEVaoqe8MglnHBiA-1&scaling=scale-down&content-scaling=fixed&page-id=0%3A1&starting-point-node-id=0%3A58
- Mobile: https://www.figma.com/proto/kiOxwzTiiTkScW5j75OBXX/Copa?node-id=9-107&p=f&t=JuiqVhRNkJtj8YuY-1&scaling=scale-down&content-scaling=fixed&page-id=0%3A1&starting-point-node-id=9%3A107

---
