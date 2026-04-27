CREATE PROCEDURE sp_sortear_curiosidade
@id_time INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @id_curiosidade INT;

    SELECT TOP 1
        @id_curiosidade = c.id_curiosidade
    FROM curiosidade c
    WHERE c.id_time = @id_time
      AND dbo.fn_curiosidade_disponivel(c.id_curiosidade) = 1
    ORDER BY NEWID();

    IF @id_curiosidade IS NULL
        BEGIN
            SELECT TOP 1
                @id_curiosidade = c.id_curiosidade
            FROM curiosidade c
            WHERE c.id_time = @id_time
            ORDER BY NEWID();
        END;

    INSERT INTO historico_curiosidade (id_curiosidade)
    VALUES (@id_curiosidade);

    SELECT
        c.id_curiosidade,
        c.texto,
        t.id_time,
        t.nome AS nome_time
    FROM curiosidade c
             INNER JOIN time t ON t.id_time = c.id_time
    WHERE c.id_curiosidade = @id_curiosidade;
END;
GO