const usuarioGlobal = [
  {
    cnh: false,
    email: "guilherme@gmail.com.br",
    senha: 123,
  },

  {
    cnh: true,
    email: "guilherme@gmail.com.br",
    senha: 1234,
  },
];

function login(e) {
  e.preventDefault();
  let usuario = document.getElementById("email").value;
  let senha = document.getElementById("password").value;


  usuarioGlobal.forEach(user => {
    if (usuario == user.email && senha == user.senha) {
      if (user.cnh === false) {
        mudarPagina(null, "./pages/passageiro/pesquisarCarona.html");
      } else {
        mudarPagina(null, "./pages/motorista/darCarona.html");
      }
    }
  });

  
    console.log("usuario oou senha incorreto");

}
