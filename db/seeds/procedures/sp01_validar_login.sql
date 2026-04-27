CREATE PROCEDURE sp_validar_login
    @login VARCHAR(50),
    @senha VARCHAR(50)
AS
BEGIN
    IF @login = 'admin' AND @senha = 'Jej-W+q%'
        SELECT 1 AS valido;
    ELSE
        SELECT 0 AS valido;
END;
GO