CREATE TABLE PESSOA (
	ra int NOT NULL,
	nome char(50) NOT NULL,
	curso char(30) NOT NULL,

	PRIMARY KEY (ra)
)

CREATE TABLE USUARIO (
	ra int NOT NULL,
	mudanca_imediata int NOT NULL, -- 1=sim / 0=não
	data_mudanca date,

	PRIMARY KEY (ra),
	FOREIGN KEY (ra) REFERENCES PESSOA
)

CREATE TABLE MORADIA(
	cod_moradia int IDENTITY,
	nome_moradia char(30) NOT NULL,
	qtd_moradores int,
	descricao char(50),
	ra_adm int NOT NULL,
	vagas_disponiveis int NULL

	PRIMARY KEY (cod_moradia)
)

CREATE TABLE ADMINISTRADOR ( --Usuário administrador da moradia
	ra int NOT NULL,
	cod_moradia int NOT NULL,
	email char(30),

	PRIMARY KEY (ra),
	FOREIGN KEY (ra) REFERENCES PESSOA,
	FOREIGN KEY (cod_moradia) REFERENCES MORADIA	
)

CREATE TABLE VAGAS(
	cod_moradia int NOT NULL,
	cod_vaga int IDENTITY, -- Seria util deixar isso aqui auto-incrementável depois
	tipo_vaga int NOT NULL, --1 = temporaria / 0 = permanente

	PRIMARY KEY (cod_vaga),
	FOREIGN KEY (cod_moradia) REFERENCES MORADIA
)

create TABLE VAGA_TEMPORARIA (
	cod_vaga int NOT NULL,
	data_inicial date NOT NULL,
	data_final date,  -- data final não precisa ser obrigatorio
	valor_semanal money NULL,

	PRIMARY KEY (cod_vaga),
	FOREIGN KEY (cod_vaga) REFERENCES VAGAS
)

CREATE TABLE VAGA_PERMANENTE (
	cod_vaga int NOT NULL,
	aluguel money,
	contas money,
	valor_total money,
	pessoas_no_quarto int, -- campo para indicar se é vaga individual ou para dividir quarto

	PRIMARY KEY (cod_vaga),
	FOREIGN KEY (cod_vaga) REFERENCES VAGAS
)


CREATE TABLE APLICACOES (
	cod_aplicacao int NOT NULL,
	cod_vaga int NOT NULL,
	ra int NOT NULL,
	data_aplicacao DATE,

	PRIMARY KEY (cod_aplicacao),
	FOREIGN KEY (cod_vaga) references VAGAS,
	FOREIGN KEY (ra) references USUARIO
)

-- ÍNDICES (é bom revisar pq eu não sei direito o que to fazendo aqui)
CREATE UNIQUE INDEX index_ra_pessoa ON PESSOA (ra)
CREATE UNIQUE INDEX index_cod_aplicacao ON APLICACOES (cod_aplicacao)
CREATE UNIQUE INDEX index_cod_moradia ON MORADIA (cod_moradia)