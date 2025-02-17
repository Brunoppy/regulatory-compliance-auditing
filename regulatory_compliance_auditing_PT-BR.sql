-- Banco de Dados de Conformidade Regulatória e Auditoria
-- Este banco de dados foi projetado para rastrear conformidade regulatória, auditorias e ações relacionadas.
  
CREATE DATABASE conformidade_auditoria;
USE conformidade_auditoria;

-- Tabela: Regulamentos
CREATE TABLE regulamentos (
    id_regulamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_vigencia DATE,
    autoridade VARCHAR(255)
);

-- Tabela: Auditorias de Conformidade
CREATE TABLE auditorias_conformidade (
    id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
    id_regulamento INT,
    data_auditoria DATE,
    status ENUM('Pendente', 'Em Progresso', 'Concluído', 'Não Conformidade'),
    descobertas TEXT,
    acao_corretiva TEXT,
    auditor VARCHAR(255),
    FOREIGN KEY (id_regulamento) REFERENCES regulamentos(id_regulamento)
);

-- Tabela: Registros de Auditoria
CREATE TABLE registros_auditoria (
    id_registro INT PRIMARY KEY AUTO_INCREMENT,
    id_auditoria INT,
    acao VARCHAR(255),
    data_acao DATETIME DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR(255),
    FOREIGN KEY (id_auditoria) REFERENCES auditorias_conformidade(id_auditoria)
);

-- Tabela: Treinamento em Conformidade
CREATE TABLE treinamento_conformidade (
    id_treinamento INT PRIMARY KEY AUTO_INCREMENT,
    id_funcionario INT,
    id_regulamento INT,
    data_treinamento DATE,
    status ENUM('Concluído', 'Pendente'),
    FOREIGN KEY (id_regulamento) REFERENCES regulamentos(id_regulamento)
);
