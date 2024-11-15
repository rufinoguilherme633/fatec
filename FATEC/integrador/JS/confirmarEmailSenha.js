function confirmarEmailSenha(email, confirmEmail, senha, confirmSenha) {
  if (email != confirmEmail) {
    return false;
  }
  if ( senha != confirmSenha) {
    return false;
  }
  return true;
}
