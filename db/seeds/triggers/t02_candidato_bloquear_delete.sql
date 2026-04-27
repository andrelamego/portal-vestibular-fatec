CREATE TRIGGER t_candidato_bloquear_delete
ON candidato
INSTEAD OF DELETE
AS
BEGIN
    RAISERROR('Candidatos cadastrados nao podem ser excluidos.', 16, 1);
END;
GO