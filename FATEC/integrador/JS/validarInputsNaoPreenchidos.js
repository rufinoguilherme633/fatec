function validarInputsNaoPreenchidos(array){
    for(let i = 0; i < array.length; i++){
        if(array[i] ==='' || array[i] ===null){
            return false 
        }else{
            return true
        }
    }
}