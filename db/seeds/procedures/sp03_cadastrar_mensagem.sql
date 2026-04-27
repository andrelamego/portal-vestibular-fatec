CREATE PROCEDURE sp_cadastrar_mensagem
    @id_tipo_mensagem INT,
    @titulo VARCHAR(100),
    @conteudo VARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO mensagem (
        id_tipo_mensagem,
        titulo,
        conteudo
    )
    VALUES (
               @id_tipo_mensagem,
               @titulo,
               @conteudo
           );

    SELECT SCOPE_IDENTITY() AS id_mensagem_gerado;
END;
GO