-- GATILHOS
	-- gatilho pra cadastrar administrador e calcular o email da dac dele (gatilho ou procedure)
	
	
	
	
	-- gatilho cadastra vaga atualiza o valor de vagas_disponiveis na tabela de moradia
	CREATE TRIGGER gatilho_atualiza_vagas_disponiveis
	ON VAGAS
	FOR INSERT
	AS
	BEGIN
		DECLARE
		@cod_moradia int
	   
		SELECT @cod_moradia = cod_moradia FROM INSERTED
	 
		UPDATE MORADIA SET vagas_disponiveis = vagas_disponiveis + 1
		WHERE cod_moradia = @cod_moradia
	END
	GO

--select * from moradia