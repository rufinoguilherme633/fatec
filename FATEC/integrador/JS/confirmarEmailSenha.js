function confirmeEmailSenha(email, confirmEmail, senha, confirmSenha){
    if(email === confirmEmail && senha === confirmSenha){
        return true
    }else{
        return      false
    }
}