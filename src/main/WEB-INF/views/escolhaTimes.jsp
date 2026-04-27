<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Escolha seu Time - Oráculo do Futebol</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --verde-campo: #1a7a2e;
            --branco: #f8f9fa;
            --cinza-escuro: #1c1c1c;
            --amarelo: #f5c518;
        }

        body {
            background-color: var(--cinza-escuro);
            font-family: 'Open Sans', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 2rem 1rem;
        }

        .titulo-pagina {
            font-family: 'Oswald', sans-serif;
            font-size: 2.2rem;
            font-weight: 700;
            color: var(--branco);
            text-align: center;
            margin-bottom: 0.5rem;
            letter-spacing: 1px;
        }

        .subtitulo {
            color: #adb5bd;
            text-align: center;
            margin-bottom: 2.5rem;
            font-size: 1rem;
        }

        .times-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
            max-width: 700px;
            width: 100%;
        }

        .card-time {
            border: none;
            border-radius: 16px;
            overflow: hidden;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            text-decoration: none;
        }

        .card-time:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 32px rgba(0,0,0,0.5);
        }

        .card-time .card-body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
        }

        .escudo {
            font-size: 4rem;
            margin-bottom: 0.75rem;
        }

        .nome-time {
            font-family: 'Oswald', sans-serif;
            font-size: 1.3rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            margin: 0;
        }

        /* Corinthians */
        .card-corinthians { background: linear-gradient(135deg, #1c1c1c 0%, #3a3a3a 100%); }
        .card-corinthians .nome-time { color: #ffffff; }
        .card-corinthians:hover { border: 2px solid #ffffff; }

        /* Palmeiras */
        .card-palmeiras { background: linear-gradient(135deg, #006437 0%, #00a859 100%); }
        .card-palmeiras .nome-time { color: #ffffff; }
        .card-palmeiras:hover { border: 2px solid #ffffff; }

        /* Santos */
        .card-santos { background: linear-gradient(135deg, #ffffff 0%, #e8e8e8 100%); }
        .card-santos .nome-time { color: #1c1c1c; }
        .card-santos:hover { border: 2px solid #1c1c1c; }

        /* São Paulo */
        .card-saopaulo { background: linear-gradient(135deg, #c8102e 0%, #1c1c1c 50%, #c8102e 100%); }
        .card-saopaulo .nome-time { color: #ffffff; }
        .card-saopaulo:hover { border: 2px solid #ffffff; }

        .aviso-carga {
            margin-top: 2rem;
            color: #6c757d;
            font-size: 0.85rem;
            text-align: center;
        }
    </style>
</head>
<body>

    <h1 class="titulo-pagina">⚽ Oráculo do Futebol</h1>
    <p class="subtitulo">Escolha seu time e descubra uma curiosidade exclusiva</p>

    <div class="times-grid">

        <a href="${pageContext.request.contextPath}/curiosidade?timeId=1" class="card-time card-corinthians">
            <div class="card-body">
                <div class="escudo">⚫⚪</div>
                <p class="nome-time">Corinthians</p>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/curiosidade?timeId=2" class="card-time card-palmeiras">
            <div class="card-body">
                <div class="escudo">🟢⚪</div>
                <p class="nome-time">Palmeiras</p>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/curiosidade?timeId=3" class="card-time card-santos">
            <div class="card-body">
                <div class="escudo">⚪⚫</div>
                <p class="nome-time">Santos</p>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/curiosidade?timeId=4" class="card-time card-saopaulo">
            <div class="card-body">
                <div class="escudo">🔴⚫</div>
                <p class="nome-time">São Paulo</p>
            </div>
        </a>

    </div>

    <c:if test="${not empty mensagemCarga}">
        <p class="aviso-carga">${mensagemCarga}</p>
    </c:if>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
