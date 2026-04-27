CREATE TRIGGER t_candidato_bloquear_update
ON candidato
INSTEAD OF UPDATE
AS
BEGIN
    RAISERROR('Candidatos cadastrados nao podem ser alterados.', 16, 1);
END;
GO