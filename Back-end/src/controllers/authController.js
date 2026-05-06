const prisma = require("../data/prisma");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const login = async (req, res) => {
    const { email, senha } = req.body;

    const user = await prisma.usuario.findUnique({
        where: { email }
    });

    if (!user) {
        return res.status(400).json({ erro: "Usuário não encontrado" });
    }

    const valid = await bcrypt.compare(senha, user.senha);

    if (!valid) {
        return res.status(400).json({ erro: "Senha inválida" });
    }

    const token = jwt.sign(
        { id: user.id },
        process.env.JWT_SECRET,
        { expiresIn: "1d" }
    );

    res.status(200).json({ token });
};

module.exports = {
     login
     };