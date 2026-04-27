CREATE TRIGGER t_curiosidade_bloquear_update
ON curiosidade
INSTEAD OF UPDATE
AS
BEGIN
    RAISERROR('Curiosidades do oraculo nao podem ser alteradas.', 16, 1);
END;
GO