-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/10/2024 às 15:11
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto_integrador2`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `id` int(11) NOT NULL,
  `motivo_da_consulta` varchar(20) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `data_da_consulta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `consulta`
--

INSERT INTO `consulta` (`id`, `motivo_da_consulta`, `id_paciente`, `id_medico`, `data_da_consulta`) VALUES
(1, 'Dor no peito', 8, 4, '2024-10-21'),
(2, 'Consulta de Rotina', 7, 3, '2024-10-22'),
(3, 'Dor abdominal', 6, 1, '2024-10-25'),
(4, 'Consulta pre-natal', 5, 7, '2024-10-28'),
(5, 'Avaliaçao Pre-cirurg', 4, 5, '2024-11-15'),
(6, 'Consulta pediatra', 3, 6, '2024-11-10'),
(7, 'Consulta Pos-cirurgi', 2, 2, '2024-11-05'),
(8, 'Consulta de Saude Fe', 1, 7, '2024-11-25');

-- --------------------------------------------------------

--
-- Estrutura para tabela `especialidade`
--

CREATE TABLE `especialidade` (
  `nome` varchar(30) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `especialidade`
--

INSERT INTO `especialidade` (`nome`, `id`) VALUES
('Pediatra', 1),
('Cirurgião geral', 2),
('Ginecologista e obstetricia', 3),
('anestesiologista', 4),
('cardiologista', 5),
('Dermatologista', 6),
('Ortopedista', 7),
('Psiquiatra', 8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

CREATE TABLE `medico` (
  `nome` varchar(40) NOT NULL,
  `id` int(11) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `id_especialidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medico`
--

INSERT INTO `medico` (`nome`, `id`, `sexo`, `id_especialidade`) VALUES
('Dr Carlos Silva', 1, 'M', 2),
('Dra Anita Machado', 2, 'F', 2),
('Dra Samara Santos', 3, 'F', 3),
('Dr João Lima', 4, 'M', 5),
('Dr Rafael Torres', 5, 'M', 4),
('Dra Ana Clara', 6, 'F', 1),
('Dra Mariana Souza', 7, 'F', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `nome` varchar(40) NOT NULL,
  `id` int(11) NOT NULL,
  `nascimento` date NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `fk_id_plano_de_saude` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`nome`, `id`, `nascimento`, `cidade`, `telefone`, `email`, `sexo`, `fk_id_plano_de_saude`) VALUES
('Carolina Alves', 1, '1985-03-15', 'São Paulo, SP', '(11) 987654321', 'carolina.alves85@gmail.com', 'F', 1),
('Felipe Mendes', 2, '1979-08-22', 'Rio de Janeiro, RJ', '(21) 984567890', 'felipe.mendes79@yahoo.com', 'M', 2),
('Juliana Costa', 3, '1990-12-10', 'Belo Horizonte, MG', '(31) 998765432', 'juliana.costa90@hotmail.com', 'F', 3),
('Ricardo Silva', 4, '1983-06-07', 'Curitiba, PR', '(41) 985654321', 'ricardo.silva83@gmail.com', 'M', 4),
('Fernanda Oliveira', 5, '1995-02-28', 'Salvador, BA', '(71) 982345678', 'fernanda.oliveira95@gmail.com', 'F', 5),
('Lucas Rocha', 6, '1987-05-19', 'Porto Alegre, RS', '(51) 997891234', 'lucas.rocha87@outlook.com', 'M', 6),
('Bianca Fernandes', 7, '1992-11-05', 'Fortaleza, CE', '(85) 981234567', 'bianca.fernandes92@gmail.com', 'F', 7),
('Eduardo Ribeiro', 8, '1975-09-30', 'Recife, PE', '(81) 987650987', 'eduardo.ribeiro75@gmail.com', 'M', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `plano_de_saude`
--

CREATE TABLE `plano_de_saude` (
  `nome` varchar(40) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `plano_de_saude`
--

INSERT INTO `plano_de_saude` (`nome`, `id`) VALUES
('Plano de Saude Individual', 1),
('Plano de Saude Familiar', 2),
('Plano de Saude Coletivo Empresarial', 3),
('Plano de Saude Coletivo por Adesao', 4),
('Plano de Cobertura Ambulatorial', 5),
('Plano de Cobertura Hospitalar', 6),
('Plano de Cobertura Odontológica', 7);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Índices de tabela `especialidade`
--
ALTER TABLE `especialidade`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_especialidade` (`id_especialidade`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_plano_de_saude` (`fk_id_plano_de_saude`);

--
-- Índices de tabela `plano_de_saude`
--
ALTER TABLE `plano_de_saude`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `especialidade`
--
ALTER TABLE `especialidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `medico`
--
ALTER TABLE `medico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `plano_de_saude`
--
ALTER TABLE `plano_de_saude`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id`),
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`);

--
-- Restrições para tabelas `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id`);

--
-- Restrições para tabelas `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`fk_id_plano_de_saude`) REFERENCES `plano_de_saude` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



SELECT
nascimento, sexo
FROM
paciente
WHERE
nascimento >= "1985-01-01";

SELECT
motivo_da_consulta, data_da_consulta
FROM
consulta
WHERE
data_da_consulta >= "2024-11-01";

SELECT 
paciente.nome as Nome_do_Paciente, paciente.fk_plano_de_saude_id as Id_Plano_de_Saude, plano_de_saude.nome as Tipo_de_Plano_de_Saude, plano_de_saude.id
FROM
paciente
JOIN
plano_de_saude ON paciente.fk_plano_de_saude_id = plano_de_saude.id;


SELECT
consulta.id_consulta, paciente.nome as Nome_do_paciente, medico.nome as Nome_do_medico, consulta.motivo_da_consulta, consulta.data_da_consulta as Data
FROM
consulta
JOIN
paciente ON  consulta.id_paciente = paciente.id
JOIN
medico ON consulta.id_medico = medico.id_medico
WHERE
medico.nome = "Dr Carlos Silva";


SELECT 
sexo,
MIN(nascimento) AS Data_de_Nascimento_Mais_antiga,
MAX(Nascimento) AS Data_de_nascimento_mais_recente
FROM
paciente
WHERE
sexo = "f"
GROUP BY
sexo;