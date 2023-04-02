CREATE SCHEMA IF NOT EXISTS t2_bd1;

CREATE TABLE IF NOT EXISTS usuario (
	tag INTEGER NOT NULL PRIMARY KEY,
    login VARCHAR(40),
    senha VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS personagem (
	idpersonagem INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(40),
    carisma INTEGER,
    forca INTEGER,
    inteligencia INTEGER,
    tagUser INTEGER NOT NULL,
    idesp INTEGER NOT NULL,
    idclasse INTEGER NOT NULL,
    FOREIGN KEY (tagUser) REFERENCES usuario(tag)
);

CREATE TABLE IF NOT EXISTS especie (
	idespecie INTEGER NOT NULL PRIMARY KEY,
    altura FLOAT,
    cabelo INTEGER,
    corPele INTEGER,
    corOlhos INTEGER,
    nome VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS classe (
	idclasse INTEGER NOT NULL PRIMARY KEY,
    descricao VARCHAR(200)
);

ALTER TABLE personagem ADD (
	FOREIGN KEY (idesp) REFERENCES especie(idespecie),
	FOREIGN KEY (idclasse) REFERENCES classe(idclasse)
);

CREATE TABLE IF NOT EXISTS clerigo (
	idclasse INTEGER NOT NULL PRIMARY KEY,
    deuses VARCHAR(60),
    simbSagrados VARCHAR(60),
    magiasCura VARCHAR(60),
    bonusFe INTEGER,
    FOREIGN KEY (idclasse) REFERENCES classe(idclasse)
);

CREATE TABLE IF NOT EXISTS mago (
	idclasse INTEGER NOT NULL PRIMARY KEY,
    runas VARCHAR(60),
    grimorios VARCHAR(60),
    magiasDano VARCHAR(60),
    bonusIntel INTEGER,
    FOREIGN KEY (idclasse) REFERENCES classe(idclasse)
);

CREATE TABLE IF NOT EXISTS barbaro (
	idclasse INTEGER NOT NULL PRIMARY KEY,
    tangas VARCHAR(60),
    tanquinhos VARCHAR(60),
    magiasDano VARCHAR(60),
    bonusForca INTEGER,
    FOREIGN KEY (idclasse) REFERENCES classe(idclasse)
);

CREATE TABLE IF NOT EXISTS arqueiro (
	idclasse INTEGER NOT NULL PRIMARY KEY,
    animais VARCHAR(60),
    acuidadeVisual VARCHAR(60),
    conhecNatureza VARCHAR(60),
    bonusCarisma INTEGER,
    FOREIGN KEY (idclasse) REFERENCES classe(idclasse)
);


CREATE TABLE IF NOT EXISTS habilidade (
	idhabilidade INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(20),
    efeito VARCHAR(100),
    custo INTEGER
);

CREATE TABLE IF NOT EXISTS arma (
	idarma INTEGER NOT NULL PRIMARY KEY,
    tipo VARCHAR(40),
    efeito VARCHAR(60),
    atributo VARCHAR(60),
    habilidade VARCHAR(60),
    nome VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS recursos (
	idrecurso INTEGER NOT NULL PRIMARY KEY,
    poder INTEGER,
    montaria VARCHAR(40),
    armadura VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS portar (
	idhab INTEGER NOT NULL,
    idclasse INTEGER NOT NULL,
    FOREIGN KEY (idhab) REFERENCES habilidade(idhabilidade),
    FOREIGN KEY (idclasse) REFERENCES classe(idclasse),
    PRIMARY KEY (idhab, idclasse)
);

CREATE TABLE IF NOT EXISTS ofertar (
	idarma INTEGER NOT NULL,
    idclasse INTEGER NOT NULL,
    bonusDano INTEGER,
    FOREIGN KEY (idarma) REFERENCES arma(idarma),
    FOREIGN KEY (idclasse) REFERENCES classe(idclasse),
    PRIMARY KEY (idarma, idclasse) 
);

CREATE TABLE IF NOT EXISTS deter (
	idrec INTEGER NOT NULL,
    idclasse INTEGER NOT NULL,
    FOREIGN KEY (idrec) REFERENCES recursos(idrecurso),
	FOREIGN KEY (idclasse) REFERENCES classe(idclasse),
    PRIMARY KEY (idrec, idclasse)
);