-- VIEWS
	-- Usuário com detalhes de PESSOA
	-- Administrador com detalhes de MORADIA
	-- Vagas com detalhes de MORADIA
	-- Aplicaçoes com detalhes de Usuário + Moradia
	


-- Ver Usuários + Nome
	CREATE VIEW view_ver_usuarios
	AS
		SELECT P.nome 'Nome', u.ra 'RA', u.mudanca_imediata 'Disponível para mudança?'
			FROM USUARIO u INNER JOIN PESSOA p
				ON u.ra = p.ra 



-- Ver Administradores de Moradia
	CREATE VIEW view_ver_administradores
	AS
		SELECT a.ra 'RA', p.nome 'Nome Administrador', a.cod_moradia 'Código Moradia', m.nome_moradia 'Nome Moradia' FROM PESSOA p 
			INNER JOIN ADMINISTRADOR a 
				ON p.ra = a.ra
			INNER JOIN MORADIA m
				ON a.cod_moradia = m.cod_moradia


		--select * from view_ver_administradores
		--select * from ADMINISTRADOR
		

-- Ver relação de vagas por moradia
		create view view_vagas_moradia
		 as
			 SELECT v.cod_vaga 'Vaga', m.nome_moradia 'Moradia', v.tipo_vaga from VAGAS v inner join MORADIA m
			 on v.cod_moradia = m.cod_moradia

--select * from view_vagas_moradia







-- RASCUNHO DAQUI PRA BAIXO

/*
-- Usuários que procuram moradias
	CREATE VIEW view_usuarios_disponiveis
	AS
		SELECT * FROM USUARIO
		WHERE procurando_moradia = 0

		SELECT * FROM view_usuarios_disponiveis
*/


/*
	--- Usuários que possuem o mesmo período disponível que uma das vagas
	drop VIEW usuarios_compativeis_vagas_temporarias
	AS
		SELECT u.ra, u.data_mudanca 
		FROM USUARIO u INNER JOIN VAGA_TEMPORARIA v
		ON u.data_mudanca >= v.data_inicial





*/

/*
	--- Usuários que possuem o mesmo período disponível que uma das vagas
	CREATE VIEW usuarios_compativeis_vagas_temporarias
	AS
		SELECT u.ra, u.data_mudanca 
		FROM USUARIO u INNER JOIN VAGA_TEMPORARIA v
		ON u.data_mudanca >= v.data_inicial

*/