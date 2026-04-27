CREATE TRIGGER t_curiosidade_bloquear_delete
ON curiosidade
INSTEAD OF DELETE
AS
BEGIN
    RAISERROR('Curiosidades do oraculo nao podem ser excluidas.', 16, 1);
END;
GO