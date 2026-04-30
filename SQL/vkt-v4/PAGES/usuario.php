<?php
// Conexão com o banco de dados
$host = "localhost";
$user = "usuariobd";
$pass = "senhabd";
$db   = "bd";


$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Inicia transação
    $conn->begin_transaction();

    try {
        // --- USUARIO ---
        $apelido   = $_POST['apelido_usuario'];
        $email     = $_POST['email_usuario'];
        $senha     = password_hash($_POST['senha_usuario'], PASSWORD_DEFAULT);
        $status    = $_POST['status_usuario'];
        $nivel     = $_POST['nivel_acesso_usuario'];
        $celular   = $_POST['celular_auth'];
        $whatsapp  = $_POST['whatsapp_auth'];
        $nascimento= $_POST['data_nascimento_usuario'];

        $stmt = $conn->prepare("INSERT INTO USUARIO (apelido_usuario, email_usuario, senha_usuario_hash, status_usuario, nivel_acesso_usuario, celular_auth, whatsapp_auth, data_nascimento_usuario) 
                                VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssssss", $apelido, $email, $senha, $status, $nivel, $celular, $whatsapp, $nascimento);
        $stmt->execute();
        $idUsuario = $stmt->insert_id;
        $stmt->close();

//Parte 2
        // --- USUARIO_BIO ---
        $fotoNome = null;
        if (isset($_FILES['foto_perfil_usuario']) && $_FILES['foto_perfil_usuario']['error'] == 0) {
            $extensao = strtolower(pathinfo($_FILES['foto_perfil_usuario']['name'], PATHINFO_EXTENSION));
            $permitidos = ['png','jpg','jpeg'];
            if (in_array($extensao, $permitidos)) {
                $fotoNome = uniqid("foto_usuario_") . "." . $extensao;
                $destino = __DIR__ . "/avatar/" . $fotoNome;
                move_uploaded_file($_FILES['foto_perfil_usuario']['tmp_name'], $destino);
            }
        }

        $genero = $_POST['genero_usuario'];
        $altura = str_replace(",", ".", $_POST['altura_usuario']);
        $peso   = str_replace(",", ".", $_POST['peso_usuario']);
        $obs    = $_POST['observacoes_usuario'];

        $stmtBio = $conn->prepare("INSERT INTO USUARIO_BIO (id_usuario_fk, foto_perfil_usuario, genero_usuario, altura_usuario, peso_usuario, observacoes_usuario) 
                                   VALUES (?, ?, ?, ?, ?, ?)");
        $stmtBio->bind_param("issdds", $idUsuario, $fotoNome, $genero, $altura, $peso, $obs);
        $stmtBio->execute();
        $stmtBio->close();

//Parte 3

        // --- USUARIO_CONTATO ---
        $tipoContato = $_POST['tipo_contato_usuario'];
        $cep         = $_POST['cep_usuario'];
        $logradouro  = $_POST['logradouro_usuario'];
        $numero      = $_POST['numero_usuario'];
        $complemento = $_POST['complemento_usuario'];
        $bairro      = $_POST['bairro_usuario'];
        $cidade      = $_POST['cidade_usuario'];
        $estado      = $_POST['estado_usuario'];
        $telefoneFixo= $_POST['telefone_fixo_usuario'];
        $emailSec    = $_POST['email_secundario_usuario'];

        $stmtContato = $conn->prepare("INSERT INTO USUARIO_CONTATO (id_usuario_fk, tipo_contato, cep_usuario, logradouro_usuario, numero_usuario, complemento_usuario, bairro_usuario, cidade_usuario, estado_usuario, telefone_fixo_usuario, email_secundario_usuario) 
                                       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmtContato->bind_param("issssssssss", 
    $idUsuario, $tipoContato, $cep, $logradouro, $numero, 
    $complemento, $bairro, $cidade, $estado, $telefoneFixo, $emailSec
);

        $stmtContato->execute();
        $stmtContato->close();

        // Se tudo deu certo, confirma transação
        $conn->commit();
        echo "<div class='alert alert-success text-center mt-3'>Usuário cadastrado com sucesso!</div>";

    } catch (Exception $e) {
        // Se houve erro em qualquer etapa, desfaz tudo
        $conn->rollback();
        echo "<div class='alert alert-danger text-center mt-3'>Erro ao cadastrar: " . $e->getMessage() . "</div>";
    }
}
?>
<!DOCTYPE html>
<html lang="pt-br" data-bs-theme="dark">
<head>
  <meta charset="UTF-8">
  <title>Cadastrar Usuário</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-light">
<div class="container mt-5 pb-5">
  <form method="POST" action="" enctype="multipart/form-data">
    
    <!-- USUARIO -->
    <div class="card mb-4 shadow">
      <div class="card-header bg-primary text-white">Dados do Usuário</div>
      <div class="card-body bg-dark text-light">
        <input type="text" name="apelido_usuario" class="form-control mb-3" placeholder="Apelido (único)" required>
        <input type="email" name="email_usuario" class="form-control mb-3" placeholder="Email principal" required>
        <input type="password" name="senha_usuario" class="form-control mb-3" placeholder="Senha de acesso" required>
        <select name="status_usuario" class="form-select mb-3">
          <option value="Ativo">Ativo</option>
          <option value="Inativo">Inativo</option>
          <option value="Bloqueado">Bloqueado</option>
          <option value="Pendente">Pendente</option>
          <option value="Banido">Banido</option>
        </select>
        <select name="nivel_acesso_usuario" class="form-select mb-3">
          <option value="Admin">Admin</option>
          <option value="Gerente">Gerente</option>
          <option value="Suporte1">Suporte1</option>
          <option value="Suporte2">Suporte2</option>
          <option value="Suporte3">Suporte3</option>
          <option value="Operador" selected>Operador</option>
        </select>
        <input type="text" name="celular_auth" class="form-control mb-3" placeholder="Celular (autenticação)" required>
        <input type="text" name="whatsapp_auth" class="form-control mb-3" placeholder="WhatsApp (opcional)">
        <input type="date" name="data_nascimento_usuario" class="form-control mb-3" required>
      </div>
    </div>

    <!-- USUARIO_BIO -->
    <div class="card mb-4 shadow">
      <div class="card-header bg-secondary text-white">Bio do Usuário</div>
      <div class="card-body bg-dark text-light">
        <label class="form-label">Foto de Perfil</label>
        <input type="file" name="foto_perfil_usuario" class="form-control mb-3" accept=".png,.jpg,.jpeg">
        <select name="genero_usuario" class="form-select mb-3">
          <option value="Não Informado" selected>Não Informado</option>
          <option value="Masculino">Masculino</option>
          <option value="Feminino">Feminino</option>
        </select>
        <input type="text" name="altura_usuario" class="form-control mb-3" placeholder="Altura (ex: 1,75)">
        <input type="text" name="peso_usuario" class="form-control mb-3" placeholder="Peso (ex: 70,5)">
        <textarea name="observacoes_usuario" class="form-control mb-3" placeholder="Observações"></textarea>
      </div>
    </div>

    <!-- USUARIO_CONTATO -->
    <div class="card mb-4 shadow">
      <div class="card-header bg-info text-white">Contato do Usuário</div>
      <div class="card-body bg-dark text-light">
        <select name="tipo_contato_usuario" class="form-select mb-3">
          <option value="Residencial" selected>Residencial</option>
          <option value="Comercial">Comercial</option>
          <option value="Entrega">Entrega</option>
          <option value="Outro">Outro</option>
        </select>
        <input type="text" name="cep_usuario" class="form-control mb-3" placeholder="CEP (00000-000)">
        <input type="text" name="logradouro_usuario" class="form-control mb-3" placeholder="Logradouro">
        <input type="text" name="numero_usuario" class="form-control mb-3" placeholder="Número">
        <input type="text" name="complemento_usuario" class="form-control mb-3" placeholder="Complemento">
        <input type="text" name="bairro_usuario" class="form-control mb-3" placeholder="Bairro">
        <input type="text" name="cidade_usuario" class="form-control mb-3" placeholder="Cidade">
        <input type="text" name="estado_usuario" class="form-control mb-3" placeholder="UF (RJ, SP, MG...)">
        <input type="text" name="telefone_fixo_usuario" class="form-control mb-3" placeholder="Telefone fixo (opcional)">
        <input type="email" name="email_secundario_usuario" class="form-control mb-3" placeholder="Email secundário (opcional)">
      </div>
    </div>

    <button type="submit" class="btn btn-success w-100">Cadastrar Usuário</button>
  </form>
</div>

<!-- Script para CEP com traço automático e preenchimento via ViaCEP -->
<script>
document.querySelector("input[name='cep_usuario']").addEventListener('input', function(e) {
  let cep = e.target.value.replace(/\D/g, '');
  if (cep.length > 5) {
    e.target.value = cep.substring(0,5) + '-' + cep.substring(5,8);
  } else {
    e.target.value = cep;
  }

  if (cep.length === 8) {
    fetch(`https://viacep.com.br/ws/${cep}/json/`)
      .then(response => response.json())
      .then(data => {
        if (!data.erro) {
          document.querySelector("input[name='logradouro_usuario']").value = data.logradouro;
          document.querySelector("input[name='bairro_usuario']").value = data.bairro;
          document.querySelector("input[name='cidade_usuario']").value = data.localidade;
          document.querySelector("input[name='estado_usuario']").value = data.uf;
        }
      });
  }
});
</script>

</body>
</html>
