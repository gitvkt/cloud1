-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 30/04/2026 às 00:13
-- Versão do servidor: 8.0.44-cll-lve
-- Versão do PHP: 8.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vktcloud_aula1`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `CLIENTE`
--

CREATE TABLE `CLIENTE` (
  `id_cliente_pk` int NOT NULL,
  `uuid_cliente` char(36) NOT NULL DEFAULT (uuid()),
  `apelido_cliente` varchar(100) NOT NULL,
  `email_cliente` varchar(120) NOT NULL,
  `senha_cliente_hash` varchar(255) NOT NULL,
  `status_cliente` enum('Ativo','Inativo','Bloqueado','Pendente','Banido') DEFAULT 'Ativo',
  `nivel_acesso_cliente` enum('Administrador','Nivel1','Nivel2','Nivel3') DEFAULT 'Nivel1',
  `celular_auth` varchar(18) NOT NULL,
  `whatsapp_auth` varchar(18) DEFAULT NULL,
  `data_nascimento_cliente` date NOT NULL,
  `data_cadastro_cliente` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao_cliente` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_exclusao_cliente` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `CLIENTE_BIO`
--

CREATE TABLE `CLIENTE_BIO` (
  `id_cliente_bio_pk` int NOT NULL,
  `id_cliente_fk` int NOT NULL,
  `foto_perfil_cliente` varchar(255) DEFAULT 'avatar_cliente.png',
  `genero_cliente` enum('Masculino','Feminino','Não Informado') DEFAULT 'Não Informado',
  `altura_cliente` decimal(3,2) DEFAULT NULL,
  `peso_cliente` decimal(6,3) DEFAULT NULL,
  `observacoes_cliente` text,
  `data_atualizacao_bio` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `CLIENTE_CONTATO`
--

CREATE TABLE `CLIENTE_CONTATO` (
  `id_cliente_contato_pk` int NOT NULL,
  `id_cliente_fk` int NOT NULL,
  `tipo_contato` enum('Residencial','Comercial','Entrega','Outro') DEFAULT 'Residencial',
  `cep_cliente` char(9) DEFAULT NULL,
  `logradouro_cliente` varchar(150) DEFAULT NULL,
  `numero_cliente` varchar(10) DEFAULT NULL,
  `complemento_cliente` varchar(100) DEFAULT NULL,
  `bairro_cliente` varchar(150) DEFAULT NULL,
  `cidade_cliente` varchar(150) DEFAULT NULL,
  `estado_cliente` char(2) DEFAULT NULL,
  `telefone_fixo_cliente` varchar(15) DEFAULT NULL,
  `email_secundario_cliente` varchar(120) DEFAULT NULL,
  `data_cadastro_contato` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao_contato` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `CLIENTE_ORGANIZACAO`
--

CREATE TABLE `CLIENTE_ORGANIZACAO` (
  `id_cliente_organizacao` int NOT NULL,
  `uuid_cliente_organizacao` char(36) NOT NULL DEFAULT (uuid()),
  `id_cliente_fk` int NOT NULL,
  `id_organizacao_fk` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ORGANIZACAO`
--

CREATE TABLE `ORGANIZACAO` (
  `id_organizacao_pk` int NOT NULL,
  `uuid_organizacao` char(36) NOT NULL DEFAULT (uuid()),
  `cnpj_organizacao` varchar(20) NOT NULL,
  `nome_fantasia_organizacao` varchar(100) NOT NULL,
  `razao_social_organizacao` varchar(100) NOT NULL,
  `natureza_juridica` varchar(100) DEFAULT NULL,
  `porte` varchar(50) DEFAULT NULL,
  `situacao_cadastral` varchar(50) DEFAULT NULL,
  `data_abertura` date DEFAULT NULL,
  `atividade_principal` varchar(200) DEFAULT NULL,
  `atividades_secundarias` text,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `inscricao_estadual` varchar(30) DEFAULT NULL,
  `inscricao_municipal` varchar(30) DEFAULT NULL,
  `codigo_suframa` varchar(30) DEFAULT NULL,
  `status_organizacao` enum('Ativa','Inativa','Suspensa','Bloqueada') DEFAULT 'Ativa',
  `nivel_plano_organizacao` enum('Master','Nivel1','Nivel2','Nivel3') DEFAULT 'Nivel1',
  `data_cadastro_organizacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao_organizacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `USUARIO`
--

CREATE TABLE `USUARIO` (
  `id_usuario_pk` int NOT NULL,
  `uuid_usuario` char(36) NOT NULL DEFAULT (uuid()),
  `apelido_usuario` varchar(100) NOT NULL,
  `email_usuario` varchar(120) NOT NULL,
  `senha_usuario_hash` varchar(255) NOT NULL,
  `status_usuario` enum('Ativo','Inativo','Bloqueado','Pendente','Banido') DEFAULT 'Ativo',
  `nivel_acesso_usuario` enum('Admin','Gerente','Suporte1','Suporte2','Suporte3','Operador') DEFAULT 'Operador',
  `celular_auth` varchar(18) NOT NULL,
  `whatsapp_auth` varchar(18) DEFAULT NULL,
  `data_nascimento_usuario` date NOT NULL,
  `data_cadastro_usuario` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao_usuario` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_exclusao_usuario` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `USUARIO`
--

INSERT INTO `USUARIO` (`id_usuario_pk`, `uuid_usuario`, `apelido_usuario`, `email_usuario`, `senha_usuario_hash`, `status_usuario`, `nivel_acesso_usuario`, `celular_auth`, `whatsapp_auth`, `data_nascimento_usuario`, `data_cadastro_usuario`, `data_atualizacao_usuario`, `data_exclusao_usuario`) VALUES
(6, 'ae06f363-4435-11f1-9707-0cc47acfc6da', 'Admin', 'admin@vktcloud.com.br', '$2y$10$2ByS2K9Eff..IAvrNWwTQupNMs1Z5HqfFROkqmb5m6YjvjHLGfRGm', 'Ativo', 'Admin', '22998081404', '22998081404', '1985-01-30', '2026-04-30 01:41:16', '2026-04-30 01:41:16', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `USUARIO_BIO`
--

CREATE TABLE `USUARIO_BIO` (
  `id_usuario_bio_pk` int NOT NULL,
  `id_usuario_fk` int NOT NULL,
  `foto_perfil_usuario` varchar(255) DEFAULT 'avatar_usuario.png',
  `genero_usuario` enum('Masculino','Feminino','Não Informado') DEFAULT 'Não Informado',
  `altura_usuario` decimal(3,2) DEFAULT NULL,
  `peso_usuario` decimal(6,3) DEFAULT NULL,
  `observacoes_usuario` text,
  `data_atualizacao_bio` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `USUARIO_BIO`
--

INSERT INTO `USUARIO_BIO` (`id_usuario_bio_pk`, `id_usuario_fk`, `foto_perfil_usuario`, `genero_usuario`, `altura_usuario`, `peso_usuario`, `observacoes_usuario`, `data_atualizacao_bio`) VALUES
(4, 6, 'foto_usuario_69f2b33cd7ee7.png', 'Masculino', 1.63, 85.500, 'OBS', '2026-04-30 01:41:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `USUARIO_CONTATO`
--

CREATE TABLE `USUARIO_CONTATO` (
  `id_usuario_contato_pk` int NOT NULL,
  `id_usuario_fk` int NOT NULL,
  `tipo_contato` enum('Residencial','Comercial','Entrega','Outro') DEFAULT 'Residencial',
  `cep_usuario` char(9) DEFAULT NULL,
  `logradouro_usuario` varchar(150) DEFAULT NULL,
  `numero_usuario` varchar(10) DEFAULT NULL,
  `complemento_usuario` varchar(100) DEFAULT NULL,
  `bairro_usuario` varchar(150) DEFAULT NULL,
  `cidade_usuario` varchar(150) DEFAULT NULL,
  `estado_usuario` char(2) DEFAULT NULL,
  `telefone_fixo_usuario` varchar(15) DEFAULT NULL,
  `email_secundario_usuario` varchar(120) DEFAULT NULL,
  `data_cadastro_contato` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao_contato` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `USUARIO_CONTATO`
--

INSERT INTO `USUARIO_CONTATO` (`id_usuario_contato_pk`, `id_usuario_fk`, `tipo_contato`, `cep_usuario`, `logradouro_usuario`, `numero_usuario`, `complemento_usuario`, `bairro_usuario`, `cidade_usuario`, `estado_usuario`, `telefone_fixo_usuario`, `email_secundario_usuario`, `data_cadastro_contato`, `data_atualizacao_contato`) VALUES
(1, 6, 'Residencial', '28893-483', 'Rua Manoel Moreira dos Santos', '759', 'casa 2', 'Nova Esperança', 'Rio das Ostras', 'RJ', '22998081404', 'vktsistemas@gmail.com', '2026-04-30 01:41:16', '2026-04-30 01:41:16');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `CLIENTE`
--
ALTER TABLE `CLIENTE`
  ADD PRIMARY KEY (`id_cliente_pk`),
  ADD UNIQUE KEY `uuid_cliente` (`uuid_cliente`),
  ADD UNIQUE KEY `apelido_cliente` (`apelido_cliente`),
  ADD UNIQUE KEY `email_cliente` (`email_cliente`);

--
-- Índices de tabela `CLIENTE_BIO`
--
ALTER TABLE `CLIENTE_BIO`
  ADD PRIMARY KEY (`id_cliente_bio_pk`),
  ADD UNIQUE KEY `id_cliente_fk` (`id_cliente_fk`);

--
-- Índices de tabela `CLIENTE_CONTATO`
--
ALTER TABLE `CLIENTE_CONTATO`
  ADD PRIMARY KEY (`id_cliente_contato_pk`),
  ADD KEY `fk_cliente_contato` (`id_cliente_fk`);

--
-- Índices de tabela `CLIENTE_ORGANIZACAO`
--
ALTER TABLE `CLIENTE_ORGANIZACAO`
  ADD PRIMARY KEY (`id_cliente_organizacao`),
  ADD UNIQUE KEY `uuid_cliente_organizacao` (`uuid_cliente_organizacao`),
  ADD UNIQUE KEY `uq_cliente_organizacao` (`id_cliente_fk`,`id_organizacao_fk`),
  ADD KEY `fk_cliente_organizacao_organizacao` (`id_organizacao_fk`);

--
-- Índices de tabela `ORGANIZACAO`
--
ALTER TABLE `ORGANIZACAO`
  ADD PRIMARY KEY (`id_organizacao_pk`),
  ADD UNIQUE KEY `uuid_organizacao` (`uuid_organizacao`),
  ADD UNIQUE KEY `cnpj_organizacao` (`cnpj_organizacao`);

--
-- Índices de tabela `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD PRIMARY KEY (`id_usuario_pk`),
  ADD UNIQUE KEY `uuid_usuario` (`uuid_usuario`),
  ADD UNIQUE KEY `apelido_usuario` (`apelido_usuario`),
  ADD UNIQUE KEY `email_usuario` (`email_usuario`);

--
-- Índices de tabela `USUARIO_BIO`
--
ALTER TABLE `USUARIO_BIO`
  ADD PRIMARY KEY (`id_usuario_bio_pk`),
  ADD UNIQUE KEY `id_usuario_fk` (`id_usuario_fk`);

--
-- Índices de tabela `USUARIO_CONTATO`
--
ALTER TABLE `USUARIO_CONTATO`
  ADD PRIMARY KEY (`id_usuario_contato_pk`),
  ADD KEY `fk_usuario_contato` (`id_usuario_fk`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `CLIENTE`
--
ALTER TABLE `CLIENTE`
  MODIFY `id_cliente_pk` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `CLIENTE_BIO`
--
ALTER TABLE `CLIENTE_BIO`
  MODIFY `id_cliente_bio_pk` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `CLIENTE_CONTATO`
--
ALTER TABLE `CLIENTE_CONTATO`
  MODIFY `id_cliente_contato_pk` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `CLIENTE_ORGANIZACAO`
--
ALTER TABLE `CLIENTE_ORGANIZACAO`
  MODIFY `id_cliente_organizacao` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ORGANIZACAO`
--
ALTER TABLE `ORGANIZACAO`
  MODIFY `id_organizacao_pk` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `USUARIO`
--
ALTER TABLE `USUARIO`
  MODIFY `id_usuario_pk` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `USUARIO_BIO`
--
ALTER TABLE `USUARIO_BIO`
  MODIFY `id_usuario_bio_pk` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `USUARIO_CONTATO`
--
ALTER TABLE `USUARIO_CONTATO`
  MODIFY `id_usuario_contato_pk` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `CLIENTE_BIO`
--
ALTER TABLE `CLIENTE_BIO`
  ADD CONSTRAINT `fk_id_cliente_bio` FOREIGN KEY (`id_cliente_fk`) REFERENCES `CLIENTE` (`id_cliente_pk`) ON DELETE CASCADE;

--
-- Restrições para tabelas `CLIENTE_CONTATO`
--
ALTER TABLE `CLIENTE_CONTATO`
  ADD CONSTRAINT `fk_cliente_contato` FOREIGN KEY (`id_cliente_fk`) REFERENCES `CLIENTE` (`id_cliente_pk`) ON DELETE CASCADE;

--
-- Restrições para tabelas `CLIENTE_ORGANIZACAO`
--
ALTER TABLE `CLIENTE_ORGANIZACAO`
  ADD CONSTRAINT `fk_cliente_organizacao_cliente` FOREIGN KEY (`id_cliente_fk`) REFERENCES `CLIENTE` (`id_cliente_pk`) ON DELETE RESTRICT,
  ADD CONSTRAINT `fk_cliente_organizacao_organizacao` FOREIGN KEY (`id_organizacao_fk`) REFERENCES `ORGANIZACAO` (`id_organizacao_pk`) ON DELETE RESTRICT;

--
-- Restrições para tabelas `USUARIO_BIO`
--
ALTER TABLE `USUARIO_BIO`
  ADD CONSTRAINT `fk_id_usuario_bio` FOREIGN KEY (`id_usuario_fk`) REFERENCES `USUARIO` (`id_usuario_pk`) ON DELETE CASCADE;

--
-- Restrições para tabelas `USUARIO_CONTATO`
--
ALTER TABLE `USUARIO_CONTATO`
  ADD CONSTRAINT `fk_usuario_contato` FOREIGN KEY (`id_usuario_fk`) REFERENCES `USUARIO` (`id_usuario_pk`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
