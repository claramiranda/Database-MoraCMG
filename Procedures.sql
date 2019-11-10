-- PROCEDURES (TODAS as operaçoes de cadastro precisam ser via procedure)
	-- Cadastrar Usuário OK
		-- cadastrar pessoa	OK
	
	-- Cadastrar moradia OK
		-- Cadastrar ADM moradia OK
	
	-- Cadastrar vaga ok
		-- cadastra vaga temporaria
		-- Cadastrar vaga fixa	
	
	-- Cadastrar Aplicação ok
	

-- Cadastrar Usuário
	create PROCEDURE procedure_cadastrar_usuario
		@ra int,
		@nome char(50),
		@curso char(30),
		@mudanca_imediata int
		as
		DECLARE @DataAtual DATE
		SET @DataAtual = GETDATE()

		insert into PESSOA values (@ra,@nome,@curso)
		IF @@ROWCOUNT > 0 
			INSERT INTO USUARIO values (@ra, @mudanca_imediata)


-- Massa de dados
-- Usuarios
/*
 exec procedure_cadastrar_usuario '155041', 'Clara Miranda', 'Análise de Sistemas', '1'
 exec procedure_cadastrar_usuario '139659','Kevin Moreira', 'Engenharia de Telecom','1'
 exec procedure_cadastrar_usuario '186653', 'Nyahn Ekyê', 'Engenharia de Telecom', '0'
 exec procedure_cadastrar_usuario '154233', 'Germano Haushild', 'Análise de Sistemas', '0'
 exec procedure_cadastrar_usuario '165822', 'Caio Felipe de Sousa', 'Sistemas de Informação', '0'
 exec procedure_cadastrar_usuario '135569', 'Cláudio Felipe Domingues', 'Engenharia Ambiental', '1'

 -- ver relação bonita com nome dos usuarios
 select * from view_ver_usuarios
 select * from pessoa
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

		if @@ROWCOUNT > 0 
			insert into ADMINISTRADOR (ra, cod_moradia) 
			values (@ra_adm,(SELECT cod_moradia from MORADIA where nome_moradia = @nome_moradia))
--massa de dados
/*
 exec cadastrar_moradia 'Bruxos do 71','2','Perto da FT, fãs de jardinagem','155041'
 exec cadastrar_moradia 'Rota Alternativa','8','Galera gente fina, pet friendly','2'
 exec cadastrar_moradia 'Rep Hour','6','Vizinhos da Rota','5'
 exec cadastrar_moradia 'Casa da Eli','2','Ger, Eli e vários dog','3'
 exec cadastrar_moradia 'Apê Perto do Trampo','3','Só para trabalhantes','4'


-- ver relação bonita dos ADMS do sistemas
select * from view_ver_administradores
 */
			
			
			
		
			
			
-- PROCEDURE CADASTRAR VAGA
	CREATE PROCEDURE cadastrar_vaga
		@cod_moradia int,
		@tipo_vaga int
		as 
			DECLARE @DataAtual DATETIME
			declare @cod_vaga int
			SET @DataAtual = GETDATE()

			insert into VAGAS(cod_moradia,tipo_vaga,dt_criacao) values (@cod_moradia, @tipo_vaga, @DataAtual)
			SET @cod_vaga = (SELECT cod_vaga from VAGAS where dt_criacao = @DataAtual)
			--print @cod_vaga
			--RETURN @cod_vaga

			if @@ROWCOUNT > 0
				if @tipo_vaga = 1 
					insert into VAGA_PERMANENTE(cod_vaga) values (@cod_vaga)
				else
					insert into VAGA_TEMPORARIA(cod_vaga) values (@cod_vaga)
					
--CAdastra aplicacoes
create procedure cadastro_aplicacoes
	@cod_vaga int,
	@ra int
	as
		insert into APLICACOES (cod_vaga,ra) values (@cod_vaga, @ra)


			

			
				
				
				
				

	
	
	
	
	
	
	
--RASCUNHO DAQUI PRA BAIXO
	
	
-- TESTES COM PROCEDURES
 

 -- PROCEDURE CADASTRAR VAGAS TEMPORARIAS
 CREATE PROCEDURE cadastrar_vaga_temporaria
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
	
	
	


