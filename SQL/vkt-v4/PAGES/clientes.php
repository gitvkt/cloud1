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
    // --- CLIENTE ---
    $apelido   = $_POST['apelido_cliente'];
    $email     = $_POST['email_cliente'];
    $senha     = password_hash($_POST['senha_cliente'], PASSWORD_DEFAULT);
    $celular   = $_POST['celular_cliente'];
    $whatsapp  = $_POST['whatsapp_cliente'];
    $nascimento= $_POST['data_nascimento_cliente'];
    $status    = $_POST['status_cliente'];
    $nivel     = $_POST['nivel_acesso_cliente'];

    $stmt = $conn->prepare("INSERT INTO CLIENTE (apelido_cliente, email_cliente, senha_cliente_hash, celular_cliente, whatsapp_cliente, data_nascimento_cliente, status_cliente, nivel_acesso_cliente) 
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssssss", $apelido, $email, $senha, $celular, $whatsapp, $nascimento, $status, $nivel);
    if ($stmt->execute()) {
        $idCliente = $stmt->insert_id;
        $stmt->close();

        // --- CLIENTE_BIO ---
        $fotoNome = null;
        if (isset($_FILES['foto_perfil_cliente']) && $_FILES['foto_perfil_cliente']['error'] == 0) {
            $extensao = strtolower(pathinfo($_FILES['foto_perfil_cliente']['name'], PATHINFO_EXTENSION));
            $permitidos = ['png','jpg','jpeg'];
            if (in_array($extensao, $permitidos)) {
                $fotoNome = uniqid("avatar_cliente_") . "." . $extensao;
                $destino = __DIR__ . "/avatar/" . $fotoNome;
                move_uploaded_file($_FILES['foto_perfil_cliente']['tmp_name'], $destino);
            }
        }

        $genero     = $_POST['genero_cliente'];
        $altura     = str_replace(',', '.', $_POST['altura_cliente']); // ex.: 1,63 → 1.63
        $peso       = str_replace(',', '.', $_POST['peso_cliente']);   // ex.: 85,500 → 85.500
        $obs        = $_POST['observacoes_cliente'];

        $stmtBio = $conn->prepare("INSERT INTO CLIENTE_BIO (id_cliente_fk, foto_perfil_cliente, genero_cliente, altura_cliente, peso_cliente, observacoes_cliente) 
                                   VALUES (?, ?, ?, ?, ?, ?)");
        $stmtBio->bind_param("issdds", $idCliente, $fotoNome, $genero, $altura, $peso, $obs);
        $stmtBio->execute();
        $stmtBio->close();

        // --- CLIENTE_CONTATO ---
        $tipo       = $_POST['tipo_contato_cliente'];
        $cep        = $_POST['cep_cliente'];
        $logradouro = $_POST['logradouro_cliente'];
        $numero     = $_POST['numero_cliente'];
        $complemento= $_POST['complemento_cliente'];
        $bairro     = $_POST['bairro_cliente'];
        $cidade     = $_POST['cidade_cliente'];
        $estado     = $_POST['estado_cliente'];
        $telefone   = $_POST['telefone_fixo_cliente'];
        $emailSec   = $_POST['email_secundario_cliente'];

        $stmtContato = $conn->prepare("INSERT INTO CLIENTE_CONTATO (id_cliente_fk, tipo_contato_cliente, cep_cliente, logradouro_cliente, numero_cliente, complemento_cliente, bairro_cliente, cidade_cliente, estado_cliente, telefone_fixo_cliente, email_secundario_cliente) 
                                       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmtContato->bind_param("isssssssss", $idCliente, $tipo, $cep, $logradouro, $numero, $complemento, $bairro, $cidade, $estado, $telefone, $emailSec);
        $stmtContato->execute();
        $stmtContato->close();

        echo "<div class='alert alert-success text-center mt-3'>Cliente cadastrado com sucesso!</div>";
    } else {
        echo "<div class='alert alert-danger text-center mt-3'>Erro: " . $stmt->error . "</div>";
    }
}
?>
<!DOCTYPE html>
<html lang="pt-br" data-bs-theme="dark">
<head>
  <meta charset="UTF-8">
  <title>Cadastrar Cliente Completo</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-light" style="font-family: Arial, sans-serif;">
<div class="container mt-5 pb-5">
  <form method="POST" action="" enctype="multipart/form-data">
    <!-- CLIENTE -->
    <div class="card mb-4 shadow">
      <div class="card-header bg-primary text-white">Dados do Cliente</div>
      <div class="card-body bg-dark text-light">
        <input type="text" name="apelido_cliente" class="form-control mb-3" placeholder="Apelido (nome curto de identificação)" required>
        <input type="email" name="email_cliente" class="form-control mb-3" placeholder="Email principal" required>
        <input type="password" name="senha_cliente" class="form-control mb-3" placeholder="Senha de acesso" required>
        <input type="text" name="celular_cliente" class="form-control mb-3" placeholder="Celular (DDD + número)" required>
        <input type="text" name="whatsapp_cliente" class="form-control mb-3" placeholder="WhatsApp (opcional)">
        <input type="date" name="data_nascimento_cliente" class="form-control mb-3" placeholder="Data de nascimento" required>
        <select name="status_cliente" class="form-select mb-3">
          <option value="Ativo">Ativo</option>
          <option value="Inativo">Inativo</option>
          <option value="Bloqueado">Bloqueado</option>
          <option value="Pendente">Pendente</option>
          <option value="Banido">Banido</option>
        </select>
        <select name="nivel_acesso_cliente" class="form-select mb-3">
          <option value="Admin">Admin</option>
          <option value="Gerente">Gerente</option>
          <option value="Suporte1">Suporte1</option>
          <option value="Suporte2">Suporte2</option>
          <option value="Suporte3">Suporte3</option>
          <option value="Operador" selected>Operador</option>
        </select>
      </div>
    </div>
    <!-- CLIENTE_BIO -->
    <div class="card mb-4 shadow">
      <div class="card-header bg-secondary text-white">Dados Bio do Cliente</div>
      <div class="card-body bg-dark text-light">
        <label class="form-label">Foto de Perfil (PNG ou JPEG)</label>
        <input type="file" name="foto_perfil_cliente" class="form-control mb-3" accept=".png,.jpg,.jpeg" required>
        <select name="genero_cliente" class="form-select mb-3">
          <option value="Masculino">Masculino</option>
          <option value="Feminino">Feminino</option>
          <option value="Não Informado" selected>Não Informado</option>
        </select>
        <input type="text" name="altura_cliente" class="form-control mb-3" placeholder="Altura em metros (ex.: 1,63)">
        <input type="text" name="peso_cliente" class="form-control mb-3" placeholder="Peso em kg (ex.: 85,500)">
        <textarea name="observacoes_cliente" class="form-control mb-3" placeholder="Observações adicionais"></textarea>
      </div>
    </div>
    <!-- CLIENTE_CONTATO -->
    <div class="card mb-4 shadow">
      <div class="card-header bg-info text-white">Dados de Contato do Cliente</div>
      <div class="card-body bg-dark text-light">
        <select name="tipo_contato_cliente" class="form-select mb-3">
          <option value="Residencial">Residencial</option>
          <option value="Comercial">Comercial</option>
          <option value="Entrega">Entrega</option>
          <option value="Outro">Outro</option>
        </select>
        <input type="text" id="cep_cliente" name="cep_cliente" class="form-control mb-3" placeholder="CEP (00000-000)">
        <input type="text" id="logradouro_cliente" name="logradouro_cliente" class="form-control mb-3" placeholder="Logradouro (Rua, Avenida...)">
        <input type="text" name="numero_cliente" class="form-control mb-3" placeholder="Número">
        <input type="text" name="complemento_cliente" class="form-control mb-3" placeholder="Complemento (opcional)">
        <input type="text" id="bairro_cliente" name="bairro_cliente" class="form-control mb-3" placeholder="Bairro">
        <input type="text" id="cidade_cliente" name="cidade_cliente" class="form-control mb-3" placeholder="Cidade">
        <input type="text" id="estado_cliente" name="estado_cliente" class="form-control mb-3" placeholder="UF (RJ, SP, MG...)">
        <input type="text" name="telefone_fixo_cliente" class="form-control mb-3" placeholder="Telefone fixo (opcional)">
        <input type="email" name="email_secundario_cliente" class="form-control mb-3" placeholder="Email secundário (opcional)">
      </div>
    </div>

    <button type="submit" class="btn btn-success w-100">Cadastrar Cliente Completo</button>
  </form>
</div>

<!-- Script para CEP com traço automático e preenchimento via ViaCEP -->
<script>
document.getElementById('cep_cliente').addEventListener('input', function(e) {
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
          document.getElementById('logradouro_cliente').value = data.logradouro;
          document.getElementById('bairro_cliente').value = data.bairro;
          document.getElementById('cidade_cliente').value = data.localidade;
          document.getElementById('estado_cliente').value = data.uf;
        }
      });
  }
});
</script>

</body>
</html>
