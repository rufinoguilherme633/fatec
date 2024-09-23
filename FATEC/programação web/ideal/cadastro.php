<?php
$servidor="localhost";
$usuario="root";
$senha="root";
$banco="ideal";

$conexao=mysqli_connect($servidor,$usuario,$senha,$banco);

$nome=$_POST['nome'];
$telefone=$_POST['telefone'];
$endereco=$_POST['endereco'];
$email=$_POST['email'];

$sql="insert into client(nome,telefone,endereco,email) values('$nome','$telefone','$endereco','$email')"; 

mysqli_query($conexao,$sql);
?>