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

// Carregar listas de clientes e organizações para o formulário
$clientes = $conn->query("SELECT id_cliente_pk, apelido_cliente FROM CLIENTE ORDER BY apelido_cliente");
$organizacoes = $conn->query("SELECT id_organizacao_pk, nome_fantasia_organizacao FROM ORGANIZACAO ORDER BY nome_fantasia_organizacao");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $idCliente = $_POST['id_cliente_fk'];
    $idOrg     = $_POST['id_organizacao_fk'];

    $stmt = $conn->prepare("INSERT INTO CLIENTE_ORGANIZACAO (id_cliente_fk, id_organizacao_fk) VALUES (?, ?)");
    $stmt->bind_param("ii", $idCliente, $idOrg);

    if ($stmt->execute()) {
        echo "<div class='alert alert-success text-center mt-3'>Vínculo Cliente-Organização criado com sucesso!</div>";
    } else {
        echo "<div class='alert alert-danger text-center mt-3'>Erro: " . $stmt->error . "</div>";
    }
    $stmt->close();
}
?>
<!DOCTYPE html>
<html lang="pt-br" data-bs-theme="dark">
<head>
  <meta charset="UTF-8">
  <title>Vincular Cliente à Organização</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-light">
<div class="container mt-5 pb-5">
  <form method="POST" action="">
    <div class="card mb-4 shadow">
      <div class="card-header bg-primary text-white">Vínculo Cliente ↔ Organização</div>
      <div class="card-body bg-dark text-light">
        <label class="form-label">Selecione o Cliente</label>
        <select name="id_cliente_fk" class="form-select mb-3" required>
          <option value="">-- Escolha um Cliente --</option>
          <?php while($c = $clientes->fetch_assoc()): ?>
            <option value="<?= $c['id_cliente_pk']; ?>"><?= $c['apelido_cliente']; ?></option>
          <?php endwhile; ?>
        </select>

        <label class="form-label">Selecione a Organização</label>
        <select name="id_organizacao_fk" class="form-select mb-3" required>
          <option value="">-- Escolha uma Organização --</option>
          <?php while($o = $organizacoes->fetch_assoc()): ?>
            <option value="<?= $o['id_organizacao_pk']; ?>"><?= $o['nome_fantasia_organizacao']; ?></option>
          <?php endwhile; ?>
        </select>
      </div>
    </div>
    <button type="submit" class="btn btn-success w-100">Vincular Cliente à Organização</button>
  </form>
</div>
</body>
</html>
