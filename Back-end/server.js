require("dotenv").config();

const express = require("express");
const cors = require("cors");
const app = express();

app.use(cors());
app.use(express.json());

app.use("/usuarios", require("./src/routes/usuarioRoutes"));
app.use("/auth", require("./src/routes/authRoutes"));
app.use("/jogos", require("./src/routes/jogoRoutes"));
app.use("/jogadores", require("./src/routes/jogadorRoutes"));
app.use("/figurinhas", require("./src/routes/figurinhaRoutes"));
app.use("/produtos", require("./src/routes/produtoRoutes"));
app.use("/trocas", require("./src/routes/trocaRoutes"));

const porta = process.env.PORT || 3000;
app.listen(porta, () => {
    console.log(`Servidor online na porta ${porta}`);
});