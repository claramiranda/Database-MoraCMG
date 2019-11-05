
-- PROCEDURES
	-- Cadastrar pessoa
	-- Cadastrar usuário
	-- Cadastrar moradia
	-- Cadastrar vaga
	-- usuário aplicar para vaga
	-- ++++


CREATE PROCEDURE cadastrar_pessoa_usuario
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


-- Cadastrar Usuário
	CREATE PROCEDURE cadastrar_usuario
		@ra int,
		@procurando_moradia int
	AS
		BEGIN TRANSACTION
			INSERT INTO USUARIO (ra, procurando_moradia)
			VALUES (@ra, @procurando_moradia)

			IF @@ROWCOUNT > 0 
				COMMIT TRANSACTION
			ELSE
				ROLLBACK TRANSACTION


