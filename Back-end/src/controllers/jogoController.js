const prisma = require("../data/prisma");

const cadastrar = async (req, res) => {
    const data = req.body;

    data.data = new Date(data.data);

    const item = await prisma.jogo.create({ data });

    res.status(201).json(item);
};

const listar = async (req, res) => {
    const lista = await prisma.jogo.findMany();
    res.status(200).json(lista);
};

const buscar = async (req, res) => {
    const { id } = req.params;

    const item = await prisma.jogo.findUnique({
        where: { id: Number(id) }
    });

    res.status(200).json(item);
};

const jogosHoje = async (req, res) => {
    const hoje = new Date();

    const lista = await prisma.jogo.findMany({
        where: {
            data: {
                gte: new Date(hoje.setHours(0,0,0)),
                lte: new Date(hoje.setHours(23,59,59))
            }
        }
    });

    res.status(200).json(lista);
};


const atualizarPlacar = async (req, res) => {
    const { id } = req.params;
    const { placarA, placarB } = req.body;

    const item = await prisma.jogo.update({
        where: { id: Number(id) },
        data: { placarA, placarB }
    });

    res.status(200).json(item);
};

const excluir = async (req, res) => {
    const { id } = req.params;

    const item = await prisma.jogo.delete({
        where: { id: Number(id) }
    });

    res.status(200).json(item);
};

module.exports = {
    cadastrar,
    listar,
    buscar,
    jogosHoje,
    atualizarPlacar,
    excluir
};