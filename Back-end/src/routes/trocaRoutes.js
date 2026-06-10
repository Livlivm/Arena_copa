const express = require("express");
const router = express.Router();
const {

    criar,
    listar,
    buscar,
    atualizar,
    excluir,
    sugestoes

} = require("../controllers/trocaController");

router.post("/criar", criar);
router.get("/listar", listar);
router.get("/buscar/:id", buscar);
router.put("/atualizar/:id", atualizar);
router.delete("/excluir/:id", excluir);
router.get("/sugestoes/:usuarioId", sugestoes);
module.exports = router;