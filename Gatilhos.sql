-- GATILHOS
	-- gatilho pra cadastrar administrador e calcular o email da dac dele (gatilho ou procedure)
	
	
	
	
	-- gatilho cadastra vaga atualiza o valor de vagas_disponiveis na tabela de moradia
	CREATE TRIGGER gatilho_incrementa_vagas_disponiveis
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

-- gatilho deleta vaga decrementa o valor de vagas_disponiveis na tabela de moradia
	CREATE TRIGGER gatilho_decrementa_vagas_disponiveis
	ON VAGAS
	FOR DELETE
	AS
	BEGIN
		DECLARE
		@cod_moradia int
	   
		SELECT @cod_moradia = cod_moradia FROM DELETED
	 
		UPDATE MORADIA SET vagas_disponiveis = vagas_disponiveis - 1
		WHERE cod_moradia = @cod_moradia
	END
	GO
	
	
	
	-- Rascunho daqui pra baixo
--select * from moradia
--em teste
CREATE TRIGGER gatilho_nova_aplicacao
ON APLICACOES
FOR INSERT
AS
BEGIN
    DECLARE
    @cod_moradia int,
	@ra int,
	@cod_vaga int
   
    SELECT @cod_vaga = cod_vaga FROM INSERTED
	SELECT @ra = ra FROM INSERTED
	--SET @cod_vaga = (SELECT cod_vaga from VAGAS where dt_criacao = @DataAtual)
	set @cod_moradia = (SELECT @cod_moradia from VAGAS where cod_vaga = @cod_vaga)
 
    UPDATE MORADIA SET vagas_disponiveis = vagas_disponiveis - 1
    WHERE cod_moradia = @cod_moradia
END
GO