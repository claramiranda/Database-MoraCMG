-- Criação das tabelas


CREATE TABLE PESSOA (
	ra int NOT NULL,
	nome char(50) NOT NULL,
	curso char(30) NOT NULL,
	tipo int NOT NULL, -- 1 = administrador e 0 = usuário

	PRIMARY KEY (ra)
)

CREATE TABLE USUARIO (
	ra int NOT NULL,
	mudanca_imediata int NOT NULL, -- 1=sim / 0=não
	data_mudanca date,

	PRIMARY KEY (ra),
	FOREIGN KEY (ra) REFERENCES PESSOA
)


CREATE TABLE ADMINISTRADOR ( --Usuário administrador da moradia
	ra int NOT NULL,
	cod_moradia int NOT NULL,

	PRIMARY KEY (ra),
	FOREIGN KEY (ra) REFERENCES PESSOA	
)

CREATE TABLE MORADIA(
	cod_moradia int NOT NULL,
	ra int NOT NULL, -- Chave estrangeira (RA administrador)
	qtd_vagas int NOT NULL,
	descricao char(50),

	PRIMARY KEY (cod_moradia)
)


CREATE TABLE VAGAS(
	cod_moradia int NOT NULL,
	cod_vaga int NOT NULL,
	tipo_vaga binary NOT NULL, --1 = temporaria / 0 = permanente

	PRIMARY KEY (cod_vaga),
	FOREIGN KEY (cod_moradia) REFERENCES MORADIA
)

CREATE TABLE VAGA_PERMANENTE (
	cod_vaga int NOT NULL,
	aluguel money NOT NULL,
	contas money NOT NULL,
	valor_total money,
	tamanho_quarto int NOT NULL -- campo para indicar se é vaga individual ou para dividir quarto

	PRIMARY KEY (cod_vaga),
	FOREIGN KEY (cod_vaga) REFERENCES VAGAS
)

CREATE TABLE VAGA_TEMPORARIA (
	cod_vaga int NOT NULL,
	data_inicial date NOT NULL,
	data_final date NOT NULL,

	PRIMARY KEY (cod_vaga),
	FOREIGN KEY (cod_vaga) REFERENCES VAGAS
)

CREATE TABLE APLICACOES (
	cod_aplicacao int NOT NULL,
	cod_vaga int NOT NULL,
	ra int NOT NULL,
	data_aplicacao DATE NOT NULL,

	PRIMARY KEY (cod_aplicacao),
	FOREIGN KEY (cod_vaga) references VAGAS,
	FOREIGN KEY (ra) references USUARIO
)


-- Alterações nas tabelas necessárias pra criar restições de integridade
ALTER TABLE ADMINISTRADOR
ADD
	FOREIGN KEY (cod_moradia) REFERENCES MORADIA

ALTER TABLE MORADIA
ADD
	FOREIGN KEY (ra) REFERENCES ADMINISTRADOR



-- ÍNDICES
CREATE UNIQUE INDEX index_ra_pessoa ON PESSOA (ra)
CREATE UNIQUE INDEX index_cod_aplicacao ON APLICACOES (cod_aplicacao)
CREATE UNIQUE INDEX index_cod_moradia ON MORADIA (cod_moradia)



-- VIEWS
	-- Usuários que procuram moradias
	CREATE VIEW view_usuarios_disponiveis
	AS
		SELECT * FROM USUARIO
		WHERE procurando_moradia = 0

		SELECT * FROM view_usuarios_disponiveis


	--- Usuários que possuem o mesmo período disponível que uma das vagas
	CREATE VIEW usuarios_compativeis_vagas_temporarias
	AS
		SELECT u.ra, u.data_mudanca 
		FROM USUARIO u INNER JOIN VAGA_TEMPORARIA v
		ON u.data_mudanca >= v.data_inicial


		




