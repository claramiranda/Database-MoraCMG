-- VIEWS
	-- Usuário com detalhes de PESSOA ok
	-- Administrador com detalhes de MORADIA ok 
	-- Vagas com detalhes de MORADIA ok 
	-- Aplicaçoes com detalhes de Usuário + Moradia ok
	


-- Ver Usuários + Nome
	CREATE VIEW view_ver_usuarios
	AS
		SELECT P.nome 'Nome', u.ra 'RA', u.mudanca_imediata 'Disponível para mudança?'
			FROM USUARIO u INNER JOIN PESSOA p
				ON u.ra = p.ra 

-- select * from view_ver_usuarios


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

create view relatorio_aplicacoes
as
Select a.cod_aplicacao, p.nome 'Usuário', m.nome_moradia 'Moradia', a.cod_vaga 'Cod_vaga' from APLICACOES a 
inner join PESSOA p on p.ra = a.ra
inner join VAGAS v on v.cod_vaga = a.cod_vaga
inner join MORADIA m on m.cod_moradia = v.cod_moradia
select * from relatorio_aplicacoes






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