function cadastroMotorista(event) {
  event.preventDefault();
  console.log('clicados')
   let motorista = pegarDadosPessoa();
   console.log('cadastroMotorista')
   mudarPagina(() => pegarDadosCarro(motorista), './cadastroCarro.html');
    


}
