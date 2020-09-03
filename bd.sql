-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 03-Set-2020 às 12:42
-- Versão do servidor: 10.4.10-MariaDB
-- versão do PHP: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm_cor`
--

DROP TABLE IF EXISTS `adm_cor`;
CREATE TABLE IF NOT EXISTS `adm_cor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `cor` varchar(40) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `adm_cor`
--

INSERT INTO `adm_cor` (`id`, `nome`, `cor`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Azul', 'primary', '2019-05-15 00:00:00', NULL),
(2, 'Cinza', 'secundary', '2019-05-09 00:00:00', NULL),
(3, 'Verde', 'success', '2019-05-09 00:00:00', NULL),
(4, 'Vermelho', 'danger', '2019-05-09 00:00:00', NULL),
(5, 'Amarelo', 'warning', '2019-05-09 00:00:00', NULL),
(6, 'Azul claro', 'info', '2019-05-09 00:00:00', NULL),
(7, 'Claro', 'light', '2019-05-09 00:00:00', NULL),
(8, 'Cinza escuro', 'dark', '2019-05-09 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm_grupo_pagina`
--

DROP TABLE IF EXISTS `adm_grupo_pagina`;
CREATE TABLE IF NOT EXISTS `adm_grupo_pagina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ordem` int(11) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adm_grupo_pagina`
--

INSERT INTO `adm_grupo_pagina` (`id`, `nome`, `ordem`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Listar', 1, '2019-05-29 00:00:00', NULL),
(2, 'Cadastrar', 2, '2019-05-29 00:00:00', NULL),
(3, 'Editar', 3, '2019-05-29 00:00:00', NULL),
(4, 'Apagar', 4, '2019-05-29 00:00:00', NULL),
(5, 'Visualizar', 5, '2019-05-29 00:00:00', NULL),
(6, 'Outros', 6, '2019-05-29 00:00:00', NULL),
(7, 'Acesso', 7, '2019-05-29 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm_menu`
--

DROP TABLE IF EXISTS `adm_menu`;
CREATE TABLE IF NOT EXISTS `adm_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `icone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordem` int(11) NOT NULL,
  `adm_situacao_id` int(11) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adm_menu`
--

INSERT INTO `adm_menu` (`id`, `nome`, `icone`, `ordem`, `adm_situacao_id`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Dashboard', 'fas fa-tachometer-alt', 1, 1, '2019-05-29 00:00:00', NULL),
(2, 'Usuario', 'fas fa-user', 2, 1, '2019-05-29 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm_niveis_acesso`
--

DROP TABLE IF EXISTS `adm_niveis_acesso`;
CREATE TABLE IF NOT EXISTS `adm_niveis_acesso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ordem` int(11) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adm_niveis_acesso`
--

INSERT INTO `adm_niveis_acesso` (`id`, `nome`, `ordem`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Root', 1, '2019-05-23 00:00:00', NULL),
(2, 'Administrador', 2, '2019-05-23 00:00:00', NULL),
(3, 'Colaborador', 3, '2019-05-23 00:00:00', NULL),
(4, 'Cliente', 4, '2019-05-23 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm_niveis_acesso_pagina`
--

DROP TABLE IF EXISTS `adm_niveis_acesso_pagina`;
CREATE TABLE IF NOT EXISTS `adm_niveis_acesso_pagina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissao` int(11) NOT NULL,
  `ordem` int(11) NOT NULL,
  `dropdown` int(11) NOT NULL,
  `liberada_menu` int(11) NOT NULL,
  `adm_menu_id` int(11) NOT NULL,
  `adm_niveis_acesso_id` int(11) NOT NULL,
  `adm_pagina_id` int(11) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `adm_niveis_acesso_pagina`
--

INSERT INTO `adm_niveis_acesso_pagina` (`id`, `permissao`, `ordem`, `dropdown`, `liberada_menu`, `adm_menu_id`, `adm_niveis_acesso_id`, `adm_pagina_id`, `data_criacao`, `data_modificacao`) VALUES
(1, 1, 1, 0, 0, 1, 1, 1, '2019-05-29 00:00:00', NULL),
(2, 1, 2, 0, 0, 2, 1, 2, '2019-05-29 00:00:00', NULL),
(3, 1, 2, 0, 0, 2, 1, 9, '2019-05-29 00:00:00', NULL),
(4, 1, 2, 0, 0, 2, 1, 7, '2019-05-29 00:00:00', NULL),
(5, 1, 2, 0, 0, 2, 1, 8, '2019-05-29 00:00:00', NULL),
(6, 1, 2, 0, 0, 2, 1, 10, '2019-05-29 00:00:00', NULL),
(7, 1, 2, 0, 0, 2, 1, 11, '2019-05-29 00:00:00', NULL),
(8, 1, 2, 0, 0, 2, 1, 12, '2019-05-29 00:00:00', NULL),
(9, 1, 2, 0, 0, 2, 1, 13, '2019-05-29 00:00:00', NULL),
(10, 1, 2, 0, 0, 2, 1, 14, '2019-05-29 00:00:00', NULL),
(11, 1, 2, 0, 0, 2, 1, 15, '2019-05-29 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm_situacao`
--

DROP TABLE IF EXISTS `adm_situacao`;
CREATE TABLE IF NOT EXISTS `adm_situacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `adm_cor_id` int(11) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `adm_situacao`
--

INSERT INTO `adm_situacao` (`id`, `nome`, `adm_cor_id`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Ativo', 3, '2019-05-10 00:00:00', NULL),
(2, 'Inativo', 4, '2019-05-10 00:00:00', NULL),
(3, 'Em Análise', 5, '2019-05-10 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `carousel`
--

DROP TABLE IF EXISTS `carousel`;
CREATE TABLE IF NOT EXISTS `carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `posicao_text` varchar(40) DEFAULT NULL,
  `titulo_botao` varchar(40) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `ordem` int(11) NOT NULL,
  `adm_cor_id` int(11) DEFAULT NULL,
  `adm_situacao_id` int(11) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `carousel`
--

INSERT INTO `carousel` (`id`, `nome`, `imagem`, `titulo`, `descricao`, `posicao_text`, `titulo_botao`, `link`, `ordem`, `adm_cor_id`, `adm_situacao_id`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Banner 01', 'banner01.jpg', '', '', 'text-left', '', '', 1, 1, 1, '2019-05-08 08:31:15', NULL),
(2, 'Banner 02', 'banner02.jpg', '', '', 'text-left', '', '', 2, 1, 1, '2019-05-08 08:31:15', NULL),
(3, 'Banner 03', 'banner03.jpg', '', '', 'text-right', '', '', 3, 4, 1, '2019-05-08 09:19:32', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_noticia`
--

DROP TABLE IF EXISTS `categoria_noticia`;
CREATE TABLE IF NOT EXISTS `categoria_noticia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categoria_noticia`
--

INSERT INTO `categoria_noticia` (`id`, `nome`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Esporte', '2019-05-17 00:00:00', NULL),
(2, 'Tecnologia', '2019-05-17 00:00:00', NULL),
(3, 'Economia', '2019-05-17 00:00:00', NULL),
(4, 'Reciclagem', '2020-09-03 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

DROP TABLE IF EXISTS `contato`;
CREATE TABLE IF NOT EXISTS `contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `assunto` varchar(100) NOT NULL,
  `mensagem` text NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`id`, `nome`, `email`, `assunto`, `mensagem`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Flavio Izo', 'flavio@flavioizo.com', 'Sugestão', 'sd', '2019-05-28 00:00:00', NULL),
(2, 'Flavio Izo', 'flavio@flavioizo.com', 'Sugestão', 'sd', '2019-05-28 00:00:00', NULL),
(3, 'Flavio Izo', 'flavio@flavioizo.com', 'Sugestão', 'sd', '2019-05-28 00:00:00', NULL),
(4, 'Flavio Izo', 'flavio@flavioizo.com', 'Sugestão', 'sd', '2019-05-28 21:38:20', NULL),
(5, 'Flavio Izo', 'flavio@flavioizo.com', 'Dúvidas', 'sdsd', '2019-05-28 22:15:04', NULL),
(6, 'Flavio Izo', 'flavio@flavioizo.com', 'Dúvidas', 'sdsd', '2019-05-28 22:15:24', NULL),
(7, 'Carla', 'wesley.leoncio.izi@hotmail.com', 'Sugestão', 'SADDSA', '2020-08-28 20:10:45', NULL),
(8, 'NEUZA', 'wesley.leoncio.izi@hotmail.com', 'Sugestão', '123', '2020-08-28 20:34:09', NULL),
(9, 'NEUZA', 'wesley.leoncio.izi@hotmail.com', 'Sugestão', '123', '2020-08-29 17:25:13', NULL),
(10, 'Carla', 'wesley.leoncio.izi@hotmail.com', 'Sugestão', '123', '2020-08-29 17:26:03', NULL),
(11, 'Carla', 'wesley.leoncio.izi@hotmail.com', 'Sugestão', '123', '2020-08-29 17:28:07', NULL),
(12, 'NEUZA', 'wesley.leoncio.izi@hotmail.com', 'Sugestão', '123', '2020-08-29 18:07:30', NULL),
(13, 'Wesley leoncio da cruz', 'duoamazonprime@gmail.com', 'Sugestão', '123', '2020-08-29 18:08:01', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticia`
--

DROP TABLE IF EXISTS `noticia`;
CREATE TABLE IF NOT EXISTS `noticia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `descricao` text NOT NULL,
  `conteudo` text NOT NULL,
  `imagem` varchar(60) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `keywords` varchar(150) NOT NULL,
  `description` varchar(200) NOT NULL,
  `author` varchar(50) NOT NULL,
  `resumo` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT 0,
  `robots_id` int(11) NOT NULL,
  `adm_user_id` int(11) NOT NULL,
  `adm_situacoes_id` int(11) NOT NULL,
  `tipo_noticia_id` int(11) NOT NULL,
  `categoria_noticia_id` int(11) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `noticia`
--

INSERT INTO `noticia` (`id`, `titulo`, `descricao`, `conteudo`, `imagem`, `slug`, `keywords`, `description`, `author`, `resumo`, `hits`, `robots_id`, `adm_user_id`, `adm_situacoes_id`, `tipo_noticia_id`, `categoria_noticia_id`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Reciclagem no Brasil', 'O processo de Reciclagem no Brasil remonta mais de 100 anos, uma vez que as primeiras indústrias a reutilizarem a matéria prima foram as indústrias de celulose.', '<p>O processo de Reciclagem no Brasil remonta mais de 100 anos, uma vez que as primeiras indústrias a reutilizarem a matéria prima foram as indústrias de celulose. Com o passar do tempo, o conceito foi se expandindo e hoje a reciclagem é um tema que faz parte da consciência ambiental e cidadã.</p>\r\n<p>Embora o sistema de reciclagem seja pontual, isto é, não ocorre em todos os municípios brasileiros, no país, a prefeitura de sete cidades fornecem o serviço de coleta seletiva a 100% das residências.</p>', 'noticia.jpg', 'noticia-teste-1', 'noticia, mussum, teste', 'Aqui teremos a descrição do texto da notícia.', 'DW', '<p>Aqui teremos um resumo público para demonstrar um texto de notícia</p>', 0, 1, 1, 1, 1, 4, '2020-09-03 00:00:00', NULL),
(2, 'Reciclagem de Lixo Eletrônico', 'O processo de reciclagem do e-lixo se inicia com a coleta ou recebimento do material.', '<p>O processo de reciclagem do e-lixo se inicia com a coleta ou recebimento do material. Logo após os aparelhos são desmontados por um processo chamado manufatura reversa, que é o movimento inverso ao de uma linha de montagem. Cada material é classificado (plásticos, metais, placas de circuito, vidros, metais pesados, elementos químicos, etc.).</p>\r\n<p>Os materiais que podem ser reciclados são encaminhados para esse fim. A reciclagem pode ser realizada nos centros que realizam a separação, se possuírem estrutura para isso, ou em empresas especializadas em cada tipo de material. O material a ser reciclado é reduzido por trituração ou compactação para minimizar os custos com transporte.</p>', 'noticia.jpg', 'noticia-teste-2', 'noticia, mussum, teste2', 'Aqui teremos a descrição do texto da notícia 2.', 'DW', '<p>Aqui teremos um resumo público para demonstrar um texto de notícia 2</p>', 0, 1, 1, 1, 1, 4, '2019-05-17 00:00:00', NULL),
(3, 'Reciclagem, Arte e Artesanato', 'Além de serem reaproveitados e transformados em novas embalagens e produtos, o conceito de reciclagem estende-se à arte e ao artesanato atribuindo maior valor ao produto artístico uma vez que hoje em dia, a palavra de ordem é \"reutilizar\".', '<p>Além de serem reaproveitados e transformados em novas embalagens e produtos, o conceito de reciclagem estende-se à arte e ao artesanato atribuindo maior valor ao produto artístico uma vez que hoje em dia, a palavra de ordem é \"reutilizar\".</p>\r\n\r\n<p>No Brasil, o artista que se destacou com o tema da Reciclagem foi Vicente José de Oliveira Muniz, mais conhecido como Vik Muniz, visto que desenvolveu um trabalho artístico com catadores de lixo do aterro do Jardim Gramacho em Duque de Caxias no estado do Rio de Janeiro atentando para o tema da sustentabilidade.</p>\r\n\r\n<p>Assim, o artista plástico realizou inúmeras exposições nacionais e internacionais e, ademais, em 2010, seu trabalho com os catadores foi transformado no documentário intitulado \"Lixo Extraordinário\".</p>', 'noticia.jpg', 'noticia-teste-3', 'noticia, mussum, teste3', 'Aqui teremos a descrição do texto da notícia 3.', 'DW', '<p>Aqui teremos um resumo público para demonstrar um texto de notícia 3</p>', 0, 1, 1, 1, 1, 4, '2019-05-17 00:00:00', NULL),
(4, 'Noticia 04', 'Todo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo! Si u mundo tá muito paradis?', '<p>Tá deprimidis, eu conheço uma cachacis que pode alegrar sua vidis. Sapien in monti palavris qui num significa nadis i pareci latim. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Paisis, filhis, espiritis santis. Praesent vel viverra nisi. Mauris aliquet nunc non turpis scelerisque, eget. Cevadis im ampola pa arma uma pindureta.</p>', 'noticia.jpg', 'noticia-teste-4', 'noticia, mussum, teste', 'Aqui teremos a descrição do texto da notícia 4.', 'DW', '<p>Aqui teremos um resumo público para demonstrar um texto de notícia 4</p>', 0, 1, 1, 1, 1, 3, '2019-05-17 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagina`
--

DROP TABLE IF EXISTS `pagina`;
CREATE TABLE IF NOT EXISTS `pagina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controller` varchar(50) NOT NULL,
  `metodo` varchar(50) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `obs` varchar(150) DEFAULT NULL,
  `keywords` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `author` varchar(100) NOT NULL,
  `icone` varchar(100) DEFAULT NULL,
  `liberada_publico` int(11) NOT NULL,
  `flag_bloqueio` int(11) NOT NULL,
  `ordem` int(11) NOT NULL,
  `adm_grupo_pagina_id` int(11) NOT NULL,
  `adm_niveis_acesso_id` int(11) NOT NULL,
  `tp_pagina_id` int(11) NOT NULL,
  `robots_id` int(11) NOT NULL,
  `situacoes_id` int(11) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pagina`
--

INSERT INTO `pagina` (`id`, `controller`, `metodo`, `nome`, `titulo`, `obs`, `keywords`, `description`, `author`, `icone`, `liberada_publico`, `flag_bloqueio`, `ordem`, `adm_grupo_pagina_id`, `adm_niveis_acesso_id`, `tp_pagina_id`, `robots_id`, `situacoes_id`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Home', 'index', 'Página principal', 'DW - Página inicial', 'Página principal', 'dw, programação, php', 'Site para exibir a página inicial do projeto', 'DW', 'home.jpg', 1, 1, 1, 0, 1, 1, 1, 1, '2019-05-24 00:00:00', NULL),
(2, 'QuemSomos', 'index', 'Página sobre a empresa', 'DW - Quem Somos', 'Página sobre a empresa', 'dw, programação, php', 'Site para exibir a página quem somos do projeto', 'DW', 'quemsomos.jpg', 1, 1, 2, 0, 1, 1, 1, 1, '2019-05-24 00:00:00', NULL),
(3, 'Noticia', 'index', 'Página de notícias', 'DW - Notícias', 'Página de notícias', 'dw, programação, php', 'Site para exibir a página de notícias do projeto', 'DW', 'noticias.jpg', 1, 1, 3, 0, 1, 1, 1, 1, '2019-05-24 00:00:00', NULL),
(4, 'Noticia', 'visualizar', 'Página de visualização da notícia', 'DW - Notícias', 'Página de notícias', 'dw, programação, php', 'Site para exibir a página de notícias do projeto', 'DW', 'noticias.jpg', 1, 1, 4, 0, 1, 1, 1, 1, '2019-05-24 00:00:00', NULL),
(5, 'Contato', 'index', 'Página de contato', 'DW - Contato', 'Página de contato', 'dw, programação, php', 'Site para exibir a página de contato do projeto', 'DW', 'contato.jpg', 1, 1, 5, 0, 1, 1, 1, 1, '2019-05-24 00:00:00', NULL),
(6, 'Error404', 'index', 'Página de Erro', 'DW - Erro 404', 'Página de erro', 'dw, programação, php', 'Site para exibir a página de erro do projeto', 'DW', 'erro.jpg', 1, 1, 1, 0, 1, 1, 1, 1, '2019-05-24 00:00:00', NULL),
(7, 'AdmHome', 'index', 'Página principal da área administrativa', 'DW - Página inicial ADM', 'Página principal ADM', 'dw, programação, php', 'Site para exibir a página inicial do projeto ADM', 'DW', 'home.jpg', 0, 1, 1, 0, 1, 2, 1, 1, '2019-05-24 00:00:00', NULL),
(8, 'AdmUser', 'index', 'Página de usuários da área administrativa', 'DW - Página user ADM', 'Página user ADM', 'dw, programação, php', 'Site para exibir a página user do projeto ADM', 'DW', 'user.jpg', 0, 1, 1, 0, 1, 2, 1, 1, '2019-05-24 00:00:00', NULL),
(9, 'AdmAuth', 'auth', 'Página de login da área administrativa', 'DW - Página login ADM', 'Página login ADM', 'dw, programação, php', 'Site para exibir a página de login do projeto ADM', 'DW', '', 1, 1, 1, 7, 1, 2, 1, 1, '2019-05-24 00:00:00', NULL),
(10, 'AdmNoticia', 'listar', 'Página ADM de notícia', 'DW - Página ADM Notícia', 'Página ADM', 'dw, programação, php', 'Site para exibir a página do projeto ADM', 'DW', '', 1, 1, 1, 7, 1, 2, 1, 1, '2019-05-24 00:00:00', NULL),
(11, 'AdmUser', 'addUser', 'Página de usuários da área administrativa', 'DW - Página user ADM', 'Página user ADM', 'dw, programação, php', 'Site para exibir a página user do projeto ADM', 'DW', 'user.jpg', 0, 1, 1, 0, 1, 2, 1, 1, '2019-05-24 00:00:00', NULL),
(12, 'AdmUser', 'moreUser', 'Página de usuários da área administrativa', 'DW - Página user ADM', 'Página user ADM', 'dw, programação, php', 'Site para exibir a página user do projeto ADM', 'DW', 'user.jpg', 0, 1, 1, 0, 1, 2, 1, 1, '2019-05-24 00:00:00', NULL),
(13, 'AdmUser', 'upUser', 'Página de usuários da área administrativa', 'DW - Página user ADM', 'Página user ADM', 'dw, programação, php', 'Site para exibir a página user do projeto ADM', 'DW', 'user.jpg', 0, 1, 1, 0, 1, 2, 1, 1, '2019-05-24 00:00:00', NULL),
(14, 'AdmUser', 'delUser', 'Página de usuários da área administrativa', 'DW - Página user ADM', 'Página user ADM', 'dw, programação, php', 'Site para exibir a página user do projeto ADM', 'DW', 'user.jpg', 0, 1, 1, 0, 1, 2, 1, 1, '2019-05-24 00:00:00', NULL),
(15, 'AdmUser', 'upUser', 'Página de usuários da área administrativa', 'DW - Página user ADM', 'Página user ADM', 'dw, programação, php', 'Site para alterar a página user do projeto ADM', 'DW', 'user.jpg', 0, 1, 1, 0, 1, 2, 1, 1, '2019-05-24 00:00:00', NULL),
(16, 'PontoColeta', 'index', 'Página de Ponto de coleta', 'WY - Ponto de Coleta', '', 'dw, programação, php', 'Site para exibir a página de Ponto de coleta do projeto', 'WY', 'contato.jpg', 1, 1, 5, 0, 1, 1, 1, 1, '2019-05-24 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ponto_coleta`
--

DROP TABLE IF EXISTS `ponto_coleta`;
CREATE TABLE IF NOT EXISTS `ponto_coleta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `numero` int(11) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ponto_coleta`
--

INSERT INTO `ponto_coleta` (`id`, `empresa`, `email`, `cidade`, `bairro`, `rua`, `numero`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Bazinga', 'bazinga@gmail.com', 'CACHOEIRO DE ITAPEMIRIM', 'RUBEM BRAGA', 'AV. CARLOS LINDEMBERG', 522, '2019-05-28 00:00:00', NULL),
(9, 'CASA GRANDE', 'casagrande@gmail.com', 'CACHOEIRO DE ITAPEMIRIM', 'NOVO PARQUE', 'R. Bernardo Horta', 245, '2020-08-29 17:43:22', NULL),
(49, 'PERIM', 'perim@gmail.com', 'CACHOEIRO DE ITAPEMIRIM', 'Santo Antônio', 'Av. Jones dos Santos Neves', 320, '2020-08-29 18:15:02', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `quem_somos`
--

DROP TABLE IF EXISTS `quem_somos`;
CREATE TABLE IF NOT EXISTS `quem_somos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `descricao` text NOT NULL,
  `imagem` varchar(220) NOT NULL,
  `ordem` int(11) NOT NULL,
  `adm_situacao_id` int(11) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `quem_somos`
--

INSERT INTO `quem_somos` (`id`, `titulo`, `descricao`, `imagem`, `ordem`, `adm_situacao_id`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Histórico', 'Mussum Ipsum, cacilds vidis litro abertis. Praesent malesuada urna nisi, quis volutpat erat hendrerit non. Nam vulputate dapibus. Mé faiz elementum girarzis, nisi eros vermeio. Detraxit consequat et quo num tendi nada. Cevadis im ampola pa arma uma pindureta.\r\n\r\nPaisis, filhis, espiritis santis. Quem num gosta di mim que vai caçá sua turmis! Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis. Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose.', 'historico.jpg', 1, 1, '2019-05-17 00:00:00', NULL),
(2, 'Fundadores', 'Copo furadis é disculpa de bebadis, arcu quam euismod magna.  Sapien in monti palavris qui num significa nadis i pareci latim. Nec orci ornare consequat. Praesent lacinia ultrices consectetur. Sed non ipsum felis. Viva Forevis aptent taciti sociosqu ad litora torquent.\r\n\r\nSuco de cevadiss deixa as pessoas mais interessantis. Delegadis gente finis, bibendum egestas augue arcu ut est. Per aumento de cachacis, eu reclamis. Si num tem leite então bota uma pinga aí cumpadi!', 'fundadores.jpg', 2, 1, '2019-05-17 00:00:00', NULL),
(3, 'Produtos e serviços', 'Nec orci ornare consequat. Praesent lacinia ultrices consectetur. Sed non ipsum felis. Mais vale um bebadis conhecidiss, que um alcoolatra anonimis. Sapien in monti palavris qui num significa nadis i pareci latim. A ordem dos tratores não altera o pão duris.\r\n\r\nSuco de cevadiss deixa as pessoas mais interessantis. Praesent vel viverra nisi. Mauris aliquet nunc non turpis scelerisque, eget. Copo furadis é disculpa de bebadis, arcu quam euismod magna. Paisis, filhis, espiritis santis.', 'produtos_servicos.jpg', 3, 1, '2019-05-17 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `robots`
--

DROP TABLE IF EXISTS `robots`;
CREATE TABLE IF NOT EXISTS `robots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `robots`
--

INSERT INTO `robots` (`id`, `nome`, `tipo`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Indexar a página e seguir os links', 'index,follow', '2019-05-16 00:00:00', NULL),
(2, 'Não indexar a página, mas seguir os links', 'noindex,follow', '2019-05-16 00:00:00', NULL),
(3, 'Indexar a página, mas não seguir os links', 'index,nofollow', '2019-05-17 00:00:00', NULL),
(4, 'Não indexar a página e nem seguir os links', 'noindex,nofollow', '2019-05-17 00:00:00', NULL),
(5, 'Não exibir a versão em cache da página', 'noarchive', '2019-05-17 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

DROP TABLE IF EXISTS `servico`;
CREATE TABLE IF NOT EXISTS `servico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `descricao` varchar(210) NOT NULL,
  `imagem` varchar(40) NOT NULL,
  `adm_cor_id` int(11) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`id`, `nome`, `descricao`, `imagem`, `adm_cor_id`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Gestão de resíduos industriais', 'A gestão dos resíduos industriais é o principal serviço que a Fox Reciclagem presta a seus clientes, e esse serviço muitas vezes demanda a prestação de outros serviços complementares.', 'gestao_residuos.jpg', 2, '2019-05-17 00:00:00', NULL),
(2, 'Comércio de resíduos recicláveis', 'A Fox também atua no mercado de reciclagem comercializando resíduos recicláveis, principalmente papel, papelão e plástico. Por isso, se sua empresa está interessada em comprar ou vender recicláveis conosco.', 'comercio_residuos.jpg', 2, '2019-05-17 00:00:00', NULL),
(3, 'Implementação de coleta seletiva', 'Desenvolvemos projetos de centrais de resíduos. Todos os excedentes sólidos da empresa, inclusive os provenientes da coleta seletiva, são destinados a essa central para classificação quanto ao risco ao ambiente', 'coleta_seletiva.jpg', 2, '2019-05-17 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_noticia`
--

DROP TABLE IF EXISTS `tipo_noticia`;
CREATE TABLE IF NOT EXISTS `tipo_noticia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_noticia`
--

INSERT INTO `tipo_noticia` (`id`, `nome`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Pública', '2019-05-17 00:00:00', NULL),
(2, 'Privada', '2019-05-17 00:00:00', NULL),
(3, 'Privada com resumo público', '2019-05-17 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_pagina`
--

DROP TABLE IF EXISTS `tipo_pagina`;
CREATE TABLE IF NOT EXISTS `tipo_pagina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `obs` varchar(150) NOT NULL,
  `ordem` int(11) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_pagina`
--

INSERT INTO `tipo_pagina` (`id`, `tipo`, `nome`, `obs`, `ordem`, `data_criacao`, `data_modificacao`) VALUES
(1, 'site', 'Site principal', 'Site principal do projeto', 1, '2019-05-17 00:00:00', NULL),
(2, 'adm', 'Área administrativa', 'Área administrativa do projeto', 2, '2019-05-17 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tratamento` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `recuperar_senha` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chave_descadastro` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmacao_email` int(11) NOT NULL DEFAULT 0,
  `imagem` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adm_niveis_acesso_id` int(11) NOT NULL,
  `adm_situacao_id` int(11) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `tratamento`, `nome`, `email`, `user`, `senha`, `recuperar_senha`, `chave_descadastro`, `confirmacao_email`, `imagem`, `adm_niveis_acesso_id`, `adm_situacao_id`, `data_criacao`, `data_modificacao`) VALUES
(1, 'Sr.', 'Flávio Izo', 'fizo@ifes.edu.br', 'fizo', '$2y$10$PHqoywjRI.dfpacnoEjsLenNVUnALes2mD3sCv6D0gAJVy99oKZwG', NULL, '3d45b1284bfdae74c56f29339128b373', 2, NULL, 1, 1, '2019-06-11 23:08:09', NULL),
(8, 'Moça99999', 'Maria999', 'izoflavio299@gmail.com', 'mariaizo29999', '123456', NULL, NULL, 0, 'flavio.jpg', 4, 1, '2019-06-27 00:29:55', '2019-07-04 00:10:50');

-- --------------------------------------------------------

--
-- Estrutura da tabela `video`
--

DROP TABLE IF EXISTS `video`;
CREATE TABLE IF NOT EXISTS `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descricao` varchar(250) NOT NULL,
  `link` varchar(250) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `data_modificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `video`
--

INSERT INTO `video` (`id`, `titulo`, `descricao`, `link`, `data_criacao`, `data_modificacao`) VALUES
(1, 'O que é reciclagem?', 'Reciclagem é o processo em que há a transformação do resíduo sólido que não seria aproveitado, com mudanças em seus estados físico, físico-químico ou biológico.', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/OQ5jpiKzNqg\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '2019-05-18 00:00:00', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
