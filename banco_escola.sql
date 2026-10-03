-- -----------------------------------------------------
-- Criacao de banco de dados
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS AA_Escola ;


-- -----------------------------------------------------
-- Selecao do banco de dados
-- -----------------------------------------------------
USE AA_Escola ;


-- -----------------------------------------------------
-- Tabela de Alunos
-- -----------------------------------------------------
CREATE TABLE Aluno (
  matricula_aluno INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  serie_atual TINYINT NOT NULL,
  email VARCHAR(254) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  CPF CHAR(11) UNIQUE NOT NULL,
  data_nascimento DATE NOT NULL,
  endereco VARCHAR(60) NOT NULL,
  CEP CHAR(8) NOT NULL,
  cidade_uf VARCHAR(60) NOT NULL
  
)AUTO_INCREMENT = 10001;


-- -----------------------------------------------------
-- Tabela de Professores
-- -----------------------------------------------------
CREATE TABLE Professor (
  matricula_prof INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  CPF CHAR(11) UNIQUE NOT NULL,
  formacao VARCHAR(100) NOT NULL,
  email VARCHAR(254) NOT NULL
 
  );


-- -----------------------------------------------------
-- Tabela de Disciplina
-- -----------------------------------------------------
CREATE TABLE Disciplina (
  id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  matricula_prof INT NOT NULL,
  
  FOREIGN KEY (matricula_prof)
    REFERENCES Professor (matricula_prof)
)AUTO_INCREMENT = 101;


-- -----------------------------------------------------
-- Tabela de Turmas
-- -----------------------------------------------------
CREATE TABLE Turma (
  id_turma INT AUTO_INCREMENT PRIMARY KEY,
  id_disciplina INT NOT NULL,
  ano_letivo YEAR NOT NULL,
  semestre TINYINT NOT NULL,
  
  FOREIGN KEY (id_disciplina)
    REFERENCES Disciplina (id_disciplina)
)AUTO_INCREMENT = 11;


-- -----------------------------------------------------
-- Tabela de matricula dos alunos nas disciplinas (relacionamento M:N)
-- -----------------------------------------------------
CREATE TABLE Matricula_Disciplina (
  id_matricula INT AUTO_INCREMENT PRIMARY KEY,
  matricula_aluno INT NOT NULL,
  id_turma INT NOT NULL,
  situacao_matricula VARCHAR(45) NOT NULL,
  
  UNIQUE (matricula_aluno, id_turma),
  UNIQUE (id_matricula, matricula_aluno, id_turma),
  
  FOREIGN KEY (matricula_aluno)
	REFERENCES Aluno (matricula_aluno),
    
  FOREIGN KEY (id_turma)
	REFERENCES Turma (id_turma)
)AUTO_INCREMENT = 21;


-- -----------------------------------------------------
-- Tabela de notas das disciplinas matriculadas
-- -----------------------------------------------------
CREATE TABLE Notas (
  id_matricula INT NOT NULL,
  matricula_aluno INT NOT NULL,
  id_turma INT NOT NULL,
  bimestre TINYINT NOT NULL,
  nota_bimestre DECIMAL(4,2) NOT NULL,
  
  PRIMARY KEY (id_matricula, matricula_aluno, id_turma, bimestre),
  
  FOREIGN KEY (id_matricula, matricula_aluno, id_turma)
	REFERENCES Matricula_Disciplina (id_matricula, matricula_aluno, id_turma)
);


