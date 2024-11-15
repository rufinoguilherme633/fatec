function pegarDadosCarro(motorista){

  console.log('motorista que chegou ' , motorista)
      const cnh = document.getElementById("cnh").value;
      const modelo = document.getElementById("modelo").value;
      const placa = document.getElementById("placa").value;
      const fileInput = document.getElementById("fileInput").value;
     
      // Exibe os dados no console para verificar
      console.log({
        cnh,
        modelo,
        placa,
        fileInput
      });
      const inputs = [
        cnh,
        modelo,
        placa,
        fileInput
      ];

      return inputs

}
