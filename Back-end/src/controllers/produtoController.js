const prisma = require("../data/prisma");

const cadastrar = async (req, res) => {
    const data = req.body;

    const item = await prisma.produto.create({ data });

    res.status(201).json(item);
};

const listar = async (req, res) => {
    const lista = await prisma.produto.findMany();
    res.status(200).json(lista);
};

const comprar = async (req, res) => {
    const { produtos } = req.body;

    const total = produtos.reduce((acc, p) => acc + p.preco, 0);

    await prisma.pedido.create({
        data: {
            usuarioId: req.usuario.id,
            total
        }
    });

    await prisma.usuario.update({
        where: { id: req.usuario.id },
        data: {
            pontos: { increment: Math.floor(total) }
        }
    });

    res.status(200).json({
        mensagem: "Compra realizada com sucesso"
    });
};

module.exports = { 
    cadastrar,
     listar,
      comprar 
    };