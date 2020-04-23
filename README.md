# Database-MoraCMG
Implementação da base de dados de um sistema de anúncio e reserva de vagas em moradias compartilhadas.

Utilizando a documentação de requisitos do app MoraCMG como ponto de partida, a base de dados foi desenvolvida em T-SQL como projeto final da disciplina Banco de Dados II.

# Documentação
A documentação completa do projeto pode ser encontrada no link abaixo:
https://docs.google.com/document/d/18F0rSMpgyTpGuUwnoZey0Ots3GWgyd--vXMIAvHTUyA/edit?usp=sharing


# Diagramas
![Rascunho do XMER da base de dados](https://user-images.githubusercontent.com/17063193/68551945-97adb700-03f0-11ea-8d8b-3ca670ada4eb.jpeg)


# Modelo Relacional
`
    PESSOA {ra, nome, curso}
    
    USUARIO{ra,mudança_imediata)
        	ra – chave estrangeira referenciando tabela PESSOA
    
    ADMINISTRADOR{ra, cod_moradia, email}
        	ra – chave estrangeira referenciando tabela PESSOA
    
    MORADIA{cod_moradia, nome_moradia,qtd_moradores,bio,ra_adm,vagas_disponiveis}
        	ra_adm – chave estrangeira referenciando tabela ADMINISTRADOR
    
    VAGAS{cod_moradia, cod_vaga, tipo_vaga, dt_criação, dt_inicio, vaga_ativa, qtd_aplicacoes}
        	cod_moradia - chave estrangeira referenciando tabela MORADIA

    VAGA_TEMPORARIA{cod_vaga, data_final, valor_diária}
        	cod_vaga - chave estrangeira referenciando tabela VAGAS
    
    VAGA_PERMANENTE{cod_vaga, aluguel, contas, valor_total, pessoas_no_quarto}
        	cod_vaga - chave estrangeira referenciando tabela VAGAS
    
    APLICACOES{cod_aplicacao, cod_vaga, ra, data_aplicação}
        	cod_vaga - chave estrangeira referenciando tabela VAGAS
        	ra - chave estrangeira referenciando tabela USUARIO
`

