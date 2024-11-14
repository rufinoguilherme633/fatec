 function trocarImagem(file,image){
    const fileInput =document.getElementById(file)
    const imagePreview =document.getElementById(image)
    fileInput.addEventListener('change', function(event){
        const file = event.target.files[0];
        if(file){
            const objectUrl=URL.createObjectURL(file)

            imagePreview.src = objectUrl
            imagePreview.style.display = 'block'
        }
    })
 }