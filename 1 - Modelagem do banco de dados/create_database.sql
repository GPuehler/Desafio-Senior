SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema desafio_senior
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS desafio_senior ;

-- -----------------------------------------------------
-- Schema desafio_senior
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS desafio_senior DEFAULT CHARACTER SET utf8 ;
USE desafio_senior;

-- -----------------------------------------------------
-- Table desafio_senior.PRODUTOS
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS desafio_senior.PRODUTOS (
  ID_PRODUTO INT NOT NULL AUTO_INCREMENT,
  COD_PRODUTO VARCHAR(15) NOT NULL,
  DESCRICAO VARCHAR(85) NULL,
  PRECO DOUBLE NOT NULL,
  PRIMARY KEY (ID_PRODUTO),
  INDEX IDX01_PRODUTOS (ID_PRODUTO))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table desafio_senior.CLIENTES
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS desafio_senior.CLIENTES (
  ID_CLIENTE INT NOT NULL AUTO_INCREMENT,
  NOME_CLIENTE VARCHAR(45) NULL,
  CPF_CNPJ VARCHAR(19) NULL,
  PRIMARY KEY (ID_CLIENTE),
  INDEX IDX01_CLIENTES (ID_CLIENTE))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table desafio_senior.DOCUMENTO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS desafio_senior.DOCUMENTO (
  ID_DOCUMENTO INT NOT NULL AUTO_INCREMENT,
  ID_CLIENTE INT NULL,
  NUM_VENDA CHAR(7) NOT NULL,
  QTDE_TOTAL_ITENS INT NOT NULL,
  CONFIRMADO BIT(1) NOT NULL,
  PRIMARY KEY (ID_DOCUMENTO),
  INDEX IDX01_NUM_VENDA (NUM_VENDA),
  CONSTRAINT fk_DOCUMENTO_CLIENTES1
    FOREIGN KEY (ID_CLIENTE)
    REFERENCES desafio_senior.CLIENTES (ID_CLIENTE)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table desafio_senior.ITENS_DOCUMENTO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS desafio_senior.ITENS_DOCUMENTO (
  ID_DOCUMENTO INT NOT NULL,
  ID_PRODUTO INT NOT NULL,
  QTDE_PRODUTO INT NOT NULL,
	-- Adicionado campo QTDE_PRODUTO para evitar redundância no banco
  PRIMARY KEY (ID_DOCUMENTO, ID_PRODUTO),
  CONSTRAINT fk_PRODUTOS_ITENS_DOCUMENTO
    FOREIGN KEY (ID_PRODUTO)
    REFERENCES desafio_senior.PRODUTOS (ID_PRODUTO) 
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_DOCUMENTO_ITENS_DOCUMENTO
    FOREIGN KEY (ID_DOCUMENTO)
    REFERENCES desafio_senior.DOCUMENTO (ID_DOCUMENTO)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table desafio_senior.ESTOQUE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS desafio_senior.ESTOQUE (
  ID_ESTOQUE INT NOT NULL AUTO_INCREMENT,
  ID_PRODUTO INT NOT NULL,
  QTDE_DISPONIVEL INT NOT NULL,
  PRIMARY KEY (ID_ESTOQUE),
  CONSTRAINT fk_ESTOQUE_PRODUTOS
    FOREIGN KEY (ID_PRODUTO)
    REFERENCES desafio_senior.PRODUTOS (ID_PRODUTO)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table desafio_senior.CODIGOS_BARRA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS desafio_senior.CODIGOS_BARRA (
  ID_CODIGO_BARRA INT NOT NULL AUTO_INCREMENT,
  ID_PRODUTO INT NOT NULL,
  COD_BARRAS VARCHAR(15) NULL,
  PRIMARY KEY (ID_CODIGO_BARRA),
  CONSTRAINT fk_CODIGOS_BARRA_PRODUTOS
    FOREIGN KEY (ID_PRODUTO)
    REFERENCES desafio_senior.PRODUTOS (ID_PRODUTO)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

