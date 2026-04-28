<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #1c1c1c;
            font-family: 'Open Sans', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card-login {
            background: #2b2b2b;
            border: none;
            border-radius: 20px;
            width: 100%;
            max-width: 400px;
            padding: 2.5rem 2rem;
            box-shadow: 0 8px 40px rgba(0,0,0,0.5);
        }

        .titulo {
            font-family: 'Oswald', sans-serif;
            font-size: 1.6rem;
            font-weight: 700;
            color: #f5c518;
            text-align: center;
            letter-spacing: 1px;
            margin-bottom: 0.3rem;
        }

        .subtitulo {
            color: #6c757d;
            font-size: 0.85rem;
            text-align: center;
            margin-bottom: 2rem;
        }

        .form-label {
            font-size: 0.88rem;
            font-weight: 600;
            color: #adb5bd;
        }

        .form-control {
            background: #3a3a3a;
            border: 1.5px solid #444;
            color: #f8f9fa;
            border-radius: 10px;
            padding: 0.6rem 0.9rem;
        }

        .form-control:focus {
            background: #3a3a3a;
            border-color: #f5c518;
            color: #f8f9fa;
            box-shadow: 0 0 0 3px rgba(245,197,24,0.15);
        }

        .form-control::placeholder { color: #555; }

        .btn-entrar {
            font-family: 'Oswald', sans-serif;
            font-size: 1rem;
            letter-spacing: 1px;
            padding: 0.7rem;
            border-radius: 10px;
            background: #f5c518;
            color: #1c1c1c;
            border: none;
            font-weight: 700;
            width: 100%;
            margin-top: 0.5rem;
            transition: opacity 0.2s;
        }

        .btn-entrar:hover { opacity: 0.85; }

        .link-voltar {
            display: block;
            text-align: center;
            margin-top: 1.2rem;
            font-size: 0.82rem;
            color: #6c757d;
            text-decoration: none;
        }

        .link-voltar:hover { color: #adb5bd; }
    </style>
</head>
<body>

<div class="card-login">

    <h1 class="titulo">⚽ ADMIN</h1>
    <p class="subtitulo">Fatec Zona Leste — Área restrita</p>

    <c:if test="${not empty erro}">
        <div class="alert alert-danger rounded-3 py-2 mb-3" style="font-size:0.88rem;">
            ❌ ${erro}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/admin/login" method="post">
        <div class="mb-3">
            <label for="login" class="form-label">Login</label>
            <input type="text" class="form-control" id="login" name="login"
                   placeholder="Digite seu login" required autocomplete="off">
        </div>
        <div class="mb-3">
            <label for="senha" class="form-label">Senha</label>
            <input type="password" class="form-control" id="senha" name="senha"
                   placeholder="Digite sua senha" required>
        </div>
        <button type="submit" class="btn-entrar">Entrar</button>
    </form>

    <a href="${pageContext.request.contextPath}/" class="link-voltar">← Voltar ao site</a>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
