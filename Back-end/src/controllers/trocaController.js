const prisma = require("../data/prisma");

const criar = async (req, res) => {

    const dados = req.body;

    const troca = await prisma.trocas.create({
        data: {
            usuario1Id: dados.usuario1Id,
            usuario2Id: dados.usuario2Id,

            figurinhas: {
                create: dados.figurinhas
            }
        },

        include: {
            figurinhas: true
        }
    });

    res.status(201).json(troca);
};

const listar = async (req, res) => {

    const lista = await prisma.trocas.findMany({

        include: {

            usuario1: true,
            usuario2: true,

            figurinhas: {
                include: {
                    figurinha: true
                }
            }
        }
    });

    res.status(200).json(lista);
};

const buscar = async (req, res) => {

    const { id } = req.params;

    const troca = await prisma.trocas.findUnique({

        where: {
            id: Number(id)
        },

        include: {

            usuario1: true,
            usuario2: true,

            figurinhas: {
                include: {
                    figurinha: true
                }
            }
        }
    });

    res.status(200).json(troca);
};

const atualizar = async (req, res) => {

    const { id } = req.params;

    const dados = req.body;

    const troca = await prisma.trocas.update({

        where: {
            id: Number(id)
        },

        data: dados
    });

    res.status(200).json(troca);
};

const excluir = async (req, res) => {

    const { id } = req.params;

    const troca = await prisma.trocas.delete({

        where: {
            id: Number(id)
        }
    });

    res.status(200).json(troca);
};

const sugestoes = async (req, res) => {

    const { usuarioId } = req.params;

    const usuario = await prisma.usuario.findUnique({

        where: {
            id: Number(usuarioId)
        },

        include: {

            figurinhas: {
                where: {
                    desejada: true
                }
            }
        }
    });

    const idsDesejados = usuario.figurinhas.map(item => item.figurinhaId);

    const sugestoes = await prisma.usuariofigurinha.findMany({

        where: {

            figurinhaId: {
                in: idsDesejados
            },

            repetida: true,

            usuarioId: {
                not: Number(usuarioId)
            }
        },

        include: {
            usuario: true,
            figurinha: true
        }
    });

    res.status(200).json(sugestoes);
};

module.exports = {
    criar,
    listar,
    buscar,
    atualizar,
    excluir,
    sugestoes
};