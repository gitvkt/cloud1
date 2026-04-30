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

// Consulta unindo as tabelas
$sql = "SELECT u.id_usuario_pk, u.apelido_usuario, u.email_usuario, u.status_usuario, u.nivel_acesso_usuario,
               b.foto_perfil_usuario, b.genero_usuario, b.altura_usuario, b.peso_usuario,
               c.tipo_contato, c.cidade_usuario, c.estado_usuario, c.telefone_fixo_usuario
        FROM USUARIO u
        LEFT JOIN USUARIO_BIO b ON u.id_usuario_pk = b.id_usuario_fk
        LEFT JOIN USUARIO_CONTATO c ON u.id_usuario_pk = c.id_usuario_fk
        ORDER BY u.id_usuario_pk DESC";

$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="pt-br" data-bs-theme="dark">
<head>
  <meta charset="UTF-8">
  <title>Listagem de Usuários</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-light" style="font-family: Arial, sans-serif;">
<div class="container mt-5 pb-5">
  <h2 class="mb-4">Usuários Cadastrados</h2>
  <table class="table table-dark table-striped align-middle">
    <thead>
      <tr>
        <th>Foto</th>
        <th>Apelido</th>
        <th>Email</th>
        <th>Status</th>
        <th>Nível</th>
        <th>Gênero</th>
        <th>Altura</th>
        <th>Peso</th>
        <th>Contato</th>
        <th>Cidade/UF</th>
      </tr>
    </thead>
    <tbody>
      <?php if ($result->num_rows > 0): ?>
        <?php while($row = $result->fetch_assoc()): ?>
          <tr>
            <td>
              <?php if (!empty($row['foto_perfil_usuario'])): ?>
                <img src="avatar/<?php echo htmlspecialchars($row['foto_perfil_usuario']); ?>" 
                     alt="Avatar" width="60" height="60" class="rounded-circle">
              <?php else: ?>
                <span class="text-muted">Sem foto</span>
              <?php endif; ?>
            </td>
            <td><?php echo htmlspecialchars($row['apelido_usuario']); ?></td>
            <td><?php echo htmlspecialchars($row['email_usuario']); ?></td>
            <td><?php echo htmlspecialchars($row['status_usuario']); ?></td>
            <td><?php echo htmlspecialchars($row['nivel_acesso_usuario']); ?></td>
            <td><?php echo htmlspecialchars($row['genero_usuario']); ?></td>
            <td><?php echo htmlspecialchars($row['altura_usuario']); ?> m</td>
            <td><?php echo htmlspecialchars($row['peso_usuario']); ?> kg</td>
            <td><?php echo htmlspecialchars($row['telefone_fixo_usuario']); ?></td>
            <td><?php echo htmlspecialchars($row['cidade_usuario']); ?>/<?php echo htmlspecialchars($row['estado_usuario']); ?></td>
          </tr>
        <?php endwhile; ?>
      <?php else: ?>
        <tr><td colspan="10" class="text-center">Nenhum usuário cadastrado.</td></tr>
      <?php endif; ?>
    </tbody>
  </table>
</div>
</body>
</html>
