function enviarCadastro(){
    let confirmEmail = './confirmEmail'
document.getElementById('formCadastro').addEventListener('submit', function(event) {
    event.preventDefault(); // Previne o envio do formulário para processar os dados

    // Pega os valores dos campos
    const nome = document.getElementById('nome_input').value;
    const curso = document.getElementById('curso_input').value;
    const email = document.getElementById('email_input').value;
    const senha = document.getElementById('senha_input').value;
    const sobrenome = document.getElementById('sobrenome_input').value;
    const telefone = document.getElementById('telefone_input').value;
    const confirmEmail = document.getElementById('confirm_email_input').value;
    const confirmSenha = document.getElementById('confirm_senha_input').value;

    // Exibe os dados no console para verificar
    console.log({
        nome,
        curso,
        email,
        senha,
        sobrenome,
        telefone,
        confirmEmail,
        confirmSenha
    })

    if(validarInputsNaoPreenchidos([nome,
        curso,
        email,
        senha,
        sobrenome,
        telefone,
        confirmEmail,
        confirmSenha
    ]) === false){
        console.log('preencha todo o formulario');
    }else{
        console.log('Cadastro válido');
    }


    if (confirmeEmailSenha(email, confirmEmail, senha, confirmSenha) === false) {
        console.log('E-mails ou senhas não correspondem');
    } else {
        console.log('Cadastro válido');
    }





    

});
}