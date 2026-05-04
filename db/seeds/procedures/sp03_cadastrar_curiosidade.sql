CREATE PROCEDURE sp_cadastrar_curiosidade
    @id_time INT = NULL,
    @id_tipo_mensagem INT = NULL,
    @texto VARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO curiosidade (
        id_time,
        id_tipo_mensagem,
        texto,
        ativa,
        origem_txt,
        data_carga
    )
    VALUES (
        @id_time,
        @id_tipo_mensagem,
        @texto,
        1,
        0,
        SYSDATETIME()
    );

    SELECT SCOPE_IDENTITY() AS id_curiosidade_gerado;
END;
GO
