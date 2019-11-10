
-- PROCEDURES (TODAS as operaçoes de cadastro precisam ser via procedure)
	-- Cadastrar pessoa (interna)
	-- Cadastrar usuário
	-- Cadastrar adm moradia
	
	-- Cadastrar moradia
	-- Cadastrar vaga
	
	-- usuário aplicar para vaga
	-- ++++



-- PROCEDURES

-- Cadastrar Usuário
	CREATE PROCEDURE cadastrar_usuario
		@ra int,
		@nome char(50),
		@curso char(30),
		@mudanca_imediata int
		as
		DECLARE @DataAtual DATE
		SET @DataAtual = GETDATE()

		insert into PESSOA values (@ra,@nome,@curso)
		IF @@ROWCOUNT > 0 
			IF @mudanca_imediata = 0
				INSERT INTO USUARIO values (@ra, @mudanca_imediata,NULL)
			ELSE
				insert into USUARIO values (@ra, @mudanca_imediata,@DataAtual)


-- Massa de dados
-- Usuarios
/*
 exec cadastrar_usuario '155041', 'Clara Miranda', 'Análise de Sistemas', '1'
 exec cadastrar_usuario'00001','Kevin Moreira', 'Engenharia de Telecom','1'
 exec cadastrar_usuario '2', 'Nyahn Ekyê', 'Engenharia de Telecom', '0'
 exec cadastrar_usuario '3', 'Germano Haushild', 'Análise de Sistemas', '0'
 exec cadastrar_usuario '4', 'Caio Felipe de Sousa', 'Sistemas de Informação', '0'
 exec cadastrar_usuario '5', 'Cláudio Felipe Domingues', 'Engenharia Ambiental', '1'

 select * from view_ver_usuarios
*/



-- Cadastra moradia e por consequencia 
 CREATE PROCEDURE cadastrar_moradia
	@nome_moradia char(20),
	@qtd_moradores int,
	@descricao char(30),
	@ra_adm int
	AS
		insert into MORADIA (nome_moradia,qtd_moradores,descricao,ra_adm)
		values (@nome_moradia, @qtd_moradores, @descricao, @ra_adm)

--massa de dados
/*
 exec cadastrar_moradia 'Bruxos do 71','2','Perto da FT, fãs de jardinagem','155041'
 exec cadastrar_moradia 'Rota Alternativa','8','Galera gente fina, pet friendly','2'

 SELECT * FROM MORADIA
 */
			
				
				
				
				

	
	
	
	
	
	
	
--RASCUNHO DAQUI PRA BAIXO
	
	
-- Cadastrar Administrador Moradia
	CREATE PROCEDURE cadastrar_administrador_moradia
		@ra int,
		@nome char(50),
		@curso char(30),
		@cod_moradia int 
		
	AS
		BEGIN TRANSACTION
			exec cadastrar_pessoa @ra,@nome,@curso,'1'

			exec cadastrar_pessoa '00001','Kevin Moreira', 'Engenharia de Telecom','1'
	
-- TESTES COM PROCEDURES

 -- Cadastra moradia e por consequencia o administrador tbm INCOMPLETO
 /*
 CREATE PROCEDURE cadastrar_moradia
	@nome_moradia char(20),
	@qtd_moradores int,
	@descricao char(30),
	@ra_adm int
	AS
		insert into MORADIA (nome_moradia,qtd_moradores,descricao,ra_adm)
		values (@nome_moradia, @qtd_moradores, @descricao, @ra_adm)

			


 -- insert into MORADIA (cod_moradia,nome_moradia,vagas_disponiveis,descricao,ra_adm)
 -- values ('001','Rota Alternativa','8','Galera legal, próximo ao mercado.','2')


-- exec cadastrar_moradia 'Bruxos do 71','2','Perto da FT, fãs de jardinagem','155041'
-- exec cadastrar_moradia 'Rota Alternativa','8','Galera gente fina, pet friendly','2'

*/
 
 
 

 -- PROCEDURE CADASTRAR VAGAS TEMPORARIAS
 CREATE PROCEDURE cadastrar_vaga_temporaria
	@cod_vaga int NOT NULL, -- é por causa disso que precisa ser auto-incrementavel esse campo... não faz sentido
	@data_inicial date NOT NULL,
	@data_final date,
	@cod_moradia


 INSERT INTO VAGAS VALUES ('002','001','0')
  INSERT INTO VAGAS VALUES ('002','002','1')
  INSERT INTO VAGAS VALUES ('001','003','1')
 INSERT INTO VAGA_TEMPORARIA VALUES ('001','2019-11-10','2020-06-01',NULL)
 INSERT INTO VAGA_PERMANENTE(cod_vaga) VALUES ('002')

-- select * from VAGAS
 -- select * from VAGA_TEMPORARIA
 select * from VAGA_PERMANENTE


	

	
	-- Cadastrar pessoa old
	/*
CREATE PROCEDURE cadastrar_pessoa
		@ra int,
		@nome char(50),
		@curso char(30),
		@tipo int
	AS
		BEGIN TRANSACTION
			INSERT INTO PESSOA(ra, nome, curso, tipo)
			VALUES (@ra, @nome, @curso, @tipo)
			IF @@ROWCOUNT > 0
				COMMIT TRANSACTION

				IF @tipo = 0
					exec cadastrar_usuario @ra, @tipo

			ELSE
				ROLLBACK TRANSACTION


			--exec cadastrar_pessoa_usuario '155042','Clara Anna', 'Análise de Sistemas','0'
			--select * from PESSOA
*/
	
	
	


