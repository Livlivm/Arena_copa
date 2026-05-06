require('dotenv').config();
const express = require('express');
const cors = require("cors");

const app = express();

app.use(express.json());
app.use(cors());

// Rotas
const usuarioRoutes = require("./src/routes/usuarioRoutes");
const authRoutes = require("./src/routes/authRoutes");
const jogoRoutes = require("./src/routes/jogoRoutes");
const jogadorRoutes = require("./src/routes/jogadorRoutes");
const figurinhaRoutes = require("./src/routes/figurinhaRoutes");
const produtoRoutes = require("./src/routes/produtoRoutes");

// Uso das rotas
app.use("/usuarios", usuarioRoutes);
app.use("/auth", authRoutes);
app.use("/jogos", jogoRoutes);
app.use("/jogadores", jogadorRoutes);
app.use("/figurinhas", figurinhaRoutes);
app.use("/produtos", produtoRoutes);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});