const prisma = require("../data/prisma");

const cadastrar = async (req, res) => {
    const data = req.body;

    const item = await prisma.figurinha.create({ data });

    res.status(201).json(item);
};

const listar = async (req, res) => {
    const lista = await prisma.figurinha.findMany();
    res.status(200).json(lista);
};


const marcar = async (req, res) => {
    const { figurinhaId } = req.body;

    const item = await prisma.usuarioFigurinha.create({
        data: {
            usuarioId: req.usuario.id,
            figurinhaId
        }
    });

    res.status(201).json(item);
};

module.exports = { 
    cadastrar,
     listar, 
     marcar
     };