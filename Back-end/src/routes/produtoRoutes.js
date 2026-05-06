const express = require("express");

const router = express.Router();

const {
    cadastrar,
    listar,
    comprar
} = require("../controllers/produtoController");

const auth = require("../middlewares/authMiddleware");

router.post("/cadastrar", cadastrar);
router.get("/listar", listar);
router.post("/comprar", auth, comprar);

module.exports = router;