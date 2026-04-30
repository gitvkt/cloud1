<?php
$host = "localhost";
$user = "vktcloud_aula1";
$pass = "#Bul0va88";
$db   = "vktcloud_aula1";

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $conn->begin_transaction();

    try {
        $cnpj        = $_POST['cnpj_organizacao'];
        $nomeFantasia= $_POST['nome_fantasia_organizacao'];
        $razaoSocial = $_POST['razao_social_organizacao'];
        $natureza    = $_POST['natureza_juridica'];
        $porte       = $_POST['porte'];
        $situacao    = $_POST['situacao_cadastral'];
        $dataAbertura= $_POST['data_abertura'];
        $atividade   = $_POST['atividade_principal'];
        $atividades  = $_POST['atividades_secundarias'];
        $logradouro  = $_POST['logradouro'];
        $numero      = $_POST['numero'];
        $complemento = $_POST['complemento'];
        $bairro      = $_POST['bairro'];
        $cidade      = $_POST['cidade'];
        $estado      = $_POST['estado'];
        $cep         = $_POST['cep'];
        $telefone    = $_POST['telefone'];

        // Email padrão se não vier nada
        $email       = !empty($_POST['email']) ? $_POST['email'] : "sememail@vktcloud.com.br";

        $inscEst     = $_POST['inscricao_estadual'];
        $suframa     = $_POST['codigo_suframa'];
        $status      = $_POST['status_organizacao'];
        $plano       = $_POST['nivel_plano_organizacao'];

        $stmt = $conn->prepare("INSERT INTO ORGANIZACAO (
            cnpj_organizacao, nome_fantasia_organizacao, razao_social_organizacao,
            natureza_juridica, porte, situacao_cadastral, data_abertura,
            atividade_principal, atividades_secundarias,
            logradouro, numero, complemento, bairro, cidade, estado, cep,
            telefone, email,
            inscricao_estadual, codigo_suframa,
            status_organizacao, nivel_plano_organizacao
        ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

        $stmt->bind_param("ssssssssssssssssssssss",
            $cnpj, $nomeFantasia, $razaoSocial,
            $natureza, $porte, $situacao, $dataAbertura,
            $atividade, $atividades,
            $logradouro, $numero, $complemento, $bairro, $cidade, $estado, $cep,
            $telefone, $email,
            $inscEst, $suframa,
            $status, $plano
        );

        $stmt->execute();
        $stmt->close();

        $conn->commit();
        echo "<div class='alert alert-success text-center mt-3'>Organização cadastrada com sucesso!</div>";

    } catch (Exception $e) {
        $conn->rollback();
        echo "<div class='alert alert-danger text-center mt-3'>Erro ao cadastrar: " . $e->getMessage() . "</div>";
    }
}
?>


<!DOCTYPE html>
<html lang="pt-br" data-bs-theme="dark">
<head>
  <meta charset="UTF-8">
  <title>Cadastrar Organização</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-light">
<div class="container mt-5 pb-5">
  <form method="POST" action="">
    <div class="card mb-4 shadow">
      <div class="card-header bg-primary text-white">Dados da Organização</div>
      <div class="card-body bg-dark text-light">

        <label for="cnpj_organizacao">CNPJ</label>
        <input type="text" name="cnpj_organizacao" id="cnpj_organizacao" class="form-control mb-3" placeholder="00.000.000/0000-00" required>

        <label for="nome_fantasia_organizacao">Nome Fantasia</label>
        <input type="text" name="nome_fantasia_organizacao" class="form-control mb-3" placeholder="Ex: Padaria do João" required>

        <label for="razao_social_organizacao">Razão Social</label>
        <input type="text" name="razao_social_organizacao" class="form-control mb-3" placeholder="Ex: João Comércio de Alimentos LTDA" required>

        <label for="natureza_juridica">Natureza Jurídica</label>
        <input type="text" name="natureza_juridica" class="form-control mb-3" placeholder="Ex: Sociedade Limitada">

        <label for="porte">Porte</label>
        <input type="text" name="porte" class="form-control mb-3" placeholder="Ex: ME, EPP, LTDA">

        <label for="situacao_cadastral">Situação Cadastral</label>
        <input type="text" name="situacao_cadastral" class="form-control mb-3" placeholder="Ex: Ativa, Inativa">

        <label for="data_abertura">Data de Abertura</label>
        <input type="date" name="data_abertura" class="form-control mb-3">

        <label for="atividade_principal">Atividade Principal</label>
        <input type="text" name="atividade_principal" class="form-control mb-3" placeholder="Ex: Comércio varejista de pães">

        <label for="atividades_secundarias">Atividades Secundárias</label>
        <textarea name="atividades_secundarias" class="form-control mb-3" placeholder="Ex: Comércio de bebidas, confeitaria"></textarea>

        <!-- CEP acima dos campos de endereço -->
        <label for="cep">CEP</label>
        <input type="text" name="cep" class="form-control mb-3" placeholder="00000-000">

        <label for="logradouro">Logradouro</label>
        <input type="text" name="logradouro" class="form-control mb-3" placeholder="Ex: Rua das Flores">

        <label for="numero">Número</label>
        <input type="text" name="numero" class="form-control mb-3" placeholder="Ex: 123">

        <label for="complemento">Complemento</label>
        <input type="text" name="complemento" class="form-control mb-3" placeholder="Ex: Loja 2">

        <label for="bairro">Bairro</label>
        <input type="text" name="bairro" class="form-control mb-3" placeholder="Ex: Centro">

        <label for="cidade">Cidade</label>
        <input type="text" name="cidade" class="form-control mb-3" placeholder="Ex: Rio das Ostras">

        <label for="estado">Estado (UF)</label>
        <input type="text" name="estado" class="form-control mb-3" placeholder="Ex: RJ">

        <label for="telefone">Telefone</label>
        <input type="text" name="telefone" class="form-control mb-3" placeholder="Ex: (22) 99999-9999">

        <label for="email">Email</label>
        <input type="email" name="email" class="form-control mb-3" placeholder="Ex: contato@empresa.com.br">

        <!-- Inscrição Estadual com botão de consulta -->
        <label for="inscricao_estadual">Inscrição Estadual</label>
        <div class="input-group mb-3">
          <input type="text" name="inscricao_estadual" class="form-control" placeholder="Ex: 123456789">
          <a id="link_ie" href="#" target="_blank" class="btn btn-outline-info">Consultar IE</a>
        </div>

        <!-- Código SUFRAMA com botão de consulta -->
        <label for="codigo_suframa">Código Suframa</label>
        <div class="input-group mb-3">
          <input type="text" name="codigo_suframa" class="form-control" placeholder="Ex: 123456">
          <a id="link_suframa" href="#" target="_blank" class="btn btn-outline-info">Consultar SUFRAMA</a>
        </div>

        <label for="status_organizacao">Status da Organização</label>
        <select name="status_organizacao" class="form-select mb-3">
          <option value="Ativa" selected>Ativa</option>
          <option value="Inativa">Inativa</option>
          <option value="Suspensa">Suspensa</option>
          <option value="Bloqueada">Bloqueada</option>
        </select>

        <label for="nivel_plano_organizacao">Nível de Plano</label>
        <select name="nivel_plano_organizacao" class="form-select mb-3">
          <option value="Master">Master</option>
          <option value="Nivel1" selected>Nivel1</option>
          <option value="Nivel2">Nivel2</option>
          <option value="Nivel3">Nivel3</option>
        </select>
      </div>
    </div>
    <button type="submit" class="btn btn-success w-100">Cadastrar Organização</button>
  </form>
</div>


<script>
// Função para formatar CNPJ
function formatCNPJ(value) {
  return value
    .replace(/\D/g, '')
    .replace(/^(\d{2})(\d)/, "$1.$2")
    .replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3")
    .replace(/\.(\d{3})(\d)/, ".$1/$2")
    .replace(/(\d{4})(\d)/, "$1-$2")
    .slice(0, 18);
}

// Função para formatar CEP (00000-000)
function formatCEP(value) {
  return value
    .replace(/\D/g, '')
    .replace(/^(\d{5})(\d)/, "$1-$2")
    .slice(0, 9);
}

// Consulta CNPJ na BrasilAPI
document.getElementById("cnpj_organizacao").addEventListener("input", function(e) {
  e.target.value = formatCNPJ(e.target.value);

  let cnpj = e.target.value.replace(/\D/g, '');
  if (cnpj.length === 14) {
    fetch(`https://brasilapi.com.br/api/cnpj/v1/${cnpj}`)
      .then(response => response.json())
      .then(data => {
        if (!data.message) {
          document.querySelector("input[name='razao_social_organizacao']").value = data.razao_social;
          document.querySelector("input[name='nome_fantasia_organizacao']").value = data.nome_fantasia || data.razao_social;
          document.querySelector("input[name='natureza_juridica']").value = data.natureza_juridica;
          document.querySelector("input[name='porte']").value = data.porte;
          document.querySelector("input[name='situacao_cadastral']").value = data.situacao ? data.situacao : "Não informado";
          document.querySelector("input[name='data_abertura']").value = data.data_inicio_atividade;
          document.querySelector("input[name='atividade_principal']").value = data.cnae_fiscal_descricao;
          document.querySelector("textarea[name='atividades_secundarias']").value = data.atividades_secundarias?.map(a => a.text).join(", ") || "";

          document.querySelector("input[name='logradouro']").value = data.logradouro;
          document.querySelector("input[name='numero']").value = data.numero;
          document.querySelector("input[name='bairro']").value = data.bairro;
          document.querySelector("input[name='cidade']").value = data.municipio;
          document.querySelector("input[name='estado']").value = data.uf;
          document.querySelector("input[name='cep']").value = data.cep ? formatCEP(data.cep) : "";

          document.querySelector("input[name='telefone']").value = data.telefone ? data.telefone : "Não informado";
          // Email padrão quando não houver
          document.querySelector("input[name='email']").value = data.email ? data.email : "sememail@vktcloud.com.br";

          document.querySelector("input[name='inscricao_estadual']").value = data.inscricao_estadual ? data.inscricao_estadual : "Não informado";
          document.querySelector("input[name='codigo_suframa']").value = data.codigo_suframa ? data.codigo_suframa : "Não informado";
        } else {
          alert("Este CNPJ não foi encontrado na base pública (provavelmente MEI). Por favor, preencha os dados manualmente.");
          document.querySelector("input[name='situacao_cadastral']").value = "Não informado";
          document.querySelector("input[name='telefone']").value = "Não informado";
          document.querySelector("input[name='email']").value = "sememail@vktcloud.com.br";
          document.querySelector("input[name='inscricao_estadual']").value = "Não informado";
          document.querySelector("input[name='codigo_suframa']").value = "Não informado";
        }
      })
      .catch(err => {
        console.log("Erro ao consultar CNPJ:", err);
        alert("Não foi possível consultar os dados do CNPJ. Preencha manualmente.");
      });
  }
});

// Formatação automática do CEP enquanto digita
document.querySelector("input[name='cep']").addEventListener("input", function(e) {
  e.target.value = formatCEP(e.target.value);
});

// Consulta CEP na ViaCEP
document.querySelector("input[name='cep']").addEventListener("blur", function(e) {
  let cep = e.target.value.replace(/\D/g, '');
  if (cep.length === 8) {
    fetch(`https://viacep.com.br/ws/${cep}/json/`)
      .then(response => response.json())
      .then(data => {
        if (!data.erro) {
          document.querySelector("input[name='logradouro']").value = data.logradouro || "Não informado";
          document.querySelector("input[name='bairro']").value = data.bairro || "Não informado";
          document.querySelector("input[name='cidade']").value = data.localidade || "Não informado";
          document.querySelector("input[name='estado']").value = data.uf || "Não informado";
        } else {
          alert("CEP não encontrado. Preencha os dados manualmente.");
        }
      })
      .catch(err => {
        console.log("Erro ao consultar CEP:", err);
        alert("Não foi possível consultar o CEP. Preencha manualmente.");
      });
  }
});

// Atualiza links de consulta IE e SUFRAMA com CNPJ digitado
document.getElementById("cnpj_organizacao").addEventListener("blur", function() {
  let cnpj = this.value.replace(/\D/g, '');
  if (cnpj.length === 14) {
    // Link para consulta IE no SINTEGRA RJ
    document.getElementById("link_ie").href = "http://www.sintegra.gov.br/CNPJ?cnpj=" + cnpj;

    // Link para consulta SUFRAMA (portal oficial)
    document.getElementById("link_suframa").href = "https://www.gov.br/suframa/pt-br";
  }
});
</script>
</body>
</html>
