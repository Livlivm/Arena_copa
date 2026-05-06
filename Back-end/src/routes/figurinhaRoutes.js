const express = require("express");

const router = express.Router();

const {
    cadastrar,
    listar,
    marcar
} = require("../controllers/figurinhaController");

const auth = require("../middlewares/authMiddleware");

router.post("/cadastrar", cadastrar);
router.get("/listar", listar);
router.post("/marcar", auth, marcar);

module.exports = router;