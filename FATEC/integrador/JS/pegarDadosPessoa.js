function pegarDadosPessoa(){

      const nome = document.getElementById("nome_input").value;
      const curso = document.getElementById("curso_input").value;
      const email = document.getElementById("email_input").value;
      const senha = document.getElementById("senha_input").value;
      const sobrenome = document.getElementById("sobrenome_input").value;
      const telefone = document.getElementById("telefone_input").value;
      const confirmEmail = document.getElementById("confirm_email_input").value;
      const confirmSenha = document.getElementById("confirm_senha_input").value;

      // Exibe os dados no console para verificar
      console.log({
        nome,
        curso,
        email,
        senha,
        sobrenome,
        telefone,
        confirmEmail,
        confirmSenha,
      });
      const inputs = [
        nome,
        curso,
        email,
        senha,
        sobrenome,
        telefone,
        confirmEmail,
        confirmSenha,
      ];

    //   if (!validarInputsNaoPreenchidos(inputs)) {
    //     console.log("preencha todo o formulario");
    //   }

      if (!confirmarEmailSenha(email, confirmEmail, senha, confirmSenha)) {
        console.log("E-mails ou senhas não correspondem");
        return
       
      }
      console.log("ate aqui foi no pegar dados");
      console.log("Cadastro válido, enviando dados...");

      return inputs;
}
