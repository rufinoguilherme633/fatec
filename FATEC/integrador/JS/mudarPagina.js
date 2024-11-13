function mudarPagina(fazerAlgumaCoisa, url) {
    // Verifica se fazerAlgumaCoisa é uma função
    if (typeof fazerAlgumaCoisa !== 'function') {
        console.log('não fazer nada');
        window.location.href = url; // Se não for uma função, apenas redireciona para a URL
    } else {
        fazerAlgumaCoisa(); // Se for uma função, chama a função
        console.log(fazerAlgumaCoisa);
    }
}
