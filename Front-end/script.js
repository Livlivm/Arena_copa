document.addEventListener("DOMContentLoaded", function () {

  const btnAbrir = document.getElementById("btnCadastro");
  const modal = document.getElementById("modal");
  const close = document.getElementById("close");
  const btnCriar = document.getElementById("btnCriar");

  // abrir modal
  btnAbrir.addEventListener("click", () => {
    modal.style.display = "flex";
  });

  // fechar modal
  close.addEventListener("click", () => {
    modal.style.display = "none";
  });

  // clicar fora
  window.addEventListener("click", (e) => {
    if (e.target === modal) {
      modal.style.display = "none";
    }
  });

  // cadastrar
  btnCriar.addEventListener("click", () => {
    const nome = document.getElementById("nome").value;
    const email = document.getElementById("email").value;
    const data = document.getElementById("data").value;
    const endereco = document.getElementById("endereco").value;

    if (!nome || !email || !data || !endereco) {
      alert("Preencha todos os campos!");
      return;
    }

    alert("Cadastro realizado com sucesso!");

    console.log({ nome, email, data, endereco });

    modal.style.display = "none";
  });

});