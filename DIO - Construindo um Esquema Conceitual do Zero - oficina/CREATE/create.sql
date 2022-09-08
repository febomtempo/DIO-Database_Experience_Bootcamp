
-- -----------------------------------------------------
-- Schema oficina
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oficina` DEFAULT CHARACTER SET utf8 ;
USE `oficina` ;

-- -----------------------------------------------------
-- Table `oficina`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
;


-- -----------------------------------------------------
-- Table `oficina`.`Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Veiculo` (
  `idVeiculo` INT NOT NULL,
  `marca` VARCHAR(45) NULL,
  `modelo` VARCHAR(45) NULL,
  `ano` VARCHAR(45) NULL,
  `placa` VARCHAR(45) NULL,
  `cor` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`),
  INDEX `fk_Veículo_Cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Veículo_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `oficina`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `oficina`.`Equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Equipe` (
  `idEquipe` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idEquipe`))
;


-- -----------------------------------------------------
-- Table `oficina`.`Ordem_de_Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Ordem_de_Servico` (
  `numero` INT NOT NULL,
  `data_emissao` VARCHAR(45) NULL,
  `data_conclusao` VARCHAR(45) NULL,
  `valor` FLOAT NULL,
  `status` VARCHAR(45) NULL,
  `Equipe_idEquipe` INT NOT NULL,
  `Veiculo_idVeiculo` INT NOT NULL,
  `autorizacao_cliente` INT NULL,
  PRIMARY KEY (`numero`, `Equipe_idEquipe`, `Veiculo_idVeiculo`),
  INDEX `fk_Ordem de Serviço_Equipe1_idx` (`Equipe_idEquipe` ASC) VISIBLE,
  INDEX `fk_Ordem de Serviço_Veículo1_idx` (`Veiculo_idVeiculo` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem de Serviço_Equipe1`
    FOREIGN KEY (`Equipe_idEquipe`)
    REFERENCES `oficina`.`Equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem de Serviço_Veículo1`
    FOREIGN KEY (`Veiculo_idVeiculo`)
    REFERENCES `oficina`.`Veiculo` (`idVeiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `oficina`.`Mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Mecanico` (
  `idMecanico` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `especialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idMecanico`))
;


-- -----------------------------------------------------
-- Table `oficina`.`Equipe_has_Mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Equipe_has_Mecanico` (
  `Equipe_idEquipe` INT NOT NULL,
  `Mecanico_idMecanico` INT NOT NULL,
  PRIMARY KEY (`Equipe_idEquipe`, `Mecanico_idMecanico`),
  INDEX `fk_Equipe_has_Mecânico_Mecânico1_idx` (`Mecanico_idMecanico` ASC) VISIBLE,
  INDEX `fk_Equipe_has_Mecânico_Equipe1_idx` (`Equipe_idEquipe` ASC) VISIBLE,
  CONSTRAINT `fk_Equipe_has_Mecânico_Equipe1`
    FOREIGN KEY (`Equipe_idEquipe`)
    REFERENCES `oficina`.`Equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipe_has_Mecânico_Mecânico1`
    FOREIGN KEY (`Mecanico_idMecanico`)
    REFERENCES `oficina`.`Mecanico` (`idMecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `oficina`.`Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Servico` (
  `idServico` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `valor_mao_de_obra` FLOAT NULL,
  PRIMARY KEY (`idServico`))
;


-- -----------------------------------------------------
-- Table `oficina`.`Ordem_de_Servico_has_Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Ordem_de_Servico_has_Servico` (
  `Ordem_de_Servico_numero` INT NOT NULL,
  `Servico_idServico` INT NOT NULL,
  PRIMARY KEY (`Ordem_de_Servico_numero`, `Servico_idServico`),
  INDEX `fk_Ordem de Serviço_has_Serviço_Serviço1_idx` (`Servico_idServico` ASC) VISIBLE,
  INDEX `fk_Ordem de Serviço_has_Serviço_Ordem de Serviço1_idx` (`Ordem_de_Servico_numero` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem de Serviço_has_Serviço_Ordem de Serviço1`
    FOREIGN KEY (`Ordem_de_Servico_numero`)
    REFERENCES `oficina`.`Ordem_de_Servico` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem de Serviço_has_Serviço_Serviço1`
    FOREIGN KEY (`Servico_idServico`)
    REFERENCES `oficina`.`Servico` (`idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `oficina`.`Peca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Peca` (
  `idPeca` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`idPeca`))
;


-- -----------------------------------------------------
-- Table `oficina`.`Ordem_de_Servico_has_Peca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`Ordem_de_Servico_has_Peca` (
  `Ordem_de_Servico_numero` INT NOT NULL,
  `Peca_idPeca` INT NOT NULL,
  PRIMARY KEY (`Ordem_de_Servico_numero`, `Peca_idPeca`),
  INDEX `fk_Ordem de Serviço_has_Peça_Peça1_idx` (`Peca_idPeca` ASC) VISIBLE,
  INDEX `fk_Ordem de Serviço_has_Peça_Ordem de Serviço1_idx` (`Ordem_de_Servico_numero` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem de Serviço_has_Peça_Ordem de Serviço1`
    FOREIGN KEY (`Ordem_de_Servico_numero`)
    REFERENCES `oficina`.`Ordem_de_Servico` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem de Serviço_has_Peça_Peça1`
    FOREIGN KEY (`Peca_idPeca`)
    REFERENCES `oficina`.`Peca` (`idPeca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
