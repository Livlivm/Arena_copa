const express = require("express");

const router = express.Router();

const {
    cadastrar,
    listar,
    buscar,
    jogosHoje,
    atualizarPlacar,
    excluir
} = require("../controllers/jogoController");

router.post("/cadastrar", cadastrar);
router.get("/listar", listar);
router.get("/buscar/:id", buscar);
router.get("/hoje", jogosHoje);
router.put("/placar/:id", atualizarPlacar);
router.delete("/excluir/:id", excluir);

module.exports = router;