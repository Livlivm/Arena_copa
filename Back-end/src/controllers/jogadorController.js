const prisma = require("../data/prisma");

const cadastrar = async (req, res) => {
    const data = req.body;

    const item = await prisma.jogador.create({ data });

    res.status(201).json(item);
};

const listarPorJogo = async (req, res) => {
    const { id } = req.params;

    const lista = await prisma.jogador.findMany({
        where: { jogoId: Number(id) }
    });

    res.status(200).json(lista);
};

module.exports = { 
    cadastrar, 
    listarPorJogo 
};