const express = require("express");

const router = express.Router();

const {
    cadastrar,
    listarPorJogo
} = require("../controllers/jogadorController");

router.post("/cadastrar", cadastrar);
router.get("/jogo/:id", listarPorJogo);

module.exports = router;