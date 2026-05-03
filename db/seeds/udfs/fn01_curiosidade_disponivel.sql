CREATE FUNCTION fn_curiosidade_disponivel
(
    @id_curiosidade INT
)
    RETURNS BIT
AS
BEGIN
    DECLARE @disponivel BIT;

    IF EXISTS (
        SELECT 1
        FROM (
                 SELECT TOP 3 id_curiosidade
                 FROM historico_curiosidade
                 ORDER BY data_hora_exibicao DESC, id_historico_curiosidade DESC
             ) ultimas
        WHERE ultimas.id_curiosidade = @id_curiosidade
    )
        SET @disponivel = 0;
    ELSE
        SET @disponivel = 1;

    RETURN @disponivel;
END;
GO
