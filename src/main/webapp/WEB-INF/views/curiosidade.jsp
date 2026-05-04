<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Curiosidade - ${time.nome}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --cinza-escuro: #1c1c1c;
            --branco: #f8f9fa;
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

        .card-curiosidade {
            background: #2b2b2b;
            border: none;
            border-radius: 20px;
            max-width: 680px;
            width: 100%;
            padding: 2.5rem;
            box-shadow: 0 8px 40px rgba(0,0,0,0.5);
            text-align: center;
        }

        .badge-time {
            display: inline-block;
            font-family: 'Oswald', sans-serif;
            font-size: 0.85rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            padding: 0.4rem 1.2rem;
            border-radius: 50px;
            margin-bottom: 1.5rem;
        }

        .badge-corinthians { background: #3a3a3a; color: #ffffff; border: 1px solid #555; }
        .badge-palmeiras { background: #006437; color: #ffffff; }
        .badge-santos { background: #ffffff; color: #1c1c1c; }
        .badge-saopaulo { background: #c8102e; color: #ffffff; }

        .icone-curiosidade {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .texto-curiosidade {
            font-size: 1.25rem;
            color: var(--branco);
            line-height: 1.7;
            margin-bottom: 2rem;
        }

        .separador {
            border-top: 1px solid #3d3d3d;
            margin: 1.5rem 0;
        }

        .redirect-info {
            color: #adb5bd;
            font-size: 0.9rem;
            margin-bottom: 0.75rem;
        }

        .countdown-bar-wrapper {
            background: #3a3a3a;
            border-radius: 50px;
            height: 8px;
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

        .countdown-bar {
            height: 100%;
            border-radius: 50px;
            background: linear-gradient(90deg, #f5c518, #e07b00);
            width: 100%;
            transition: width 1s linear;
        }

        .btn-cadastro {
            font-family: 'Oswald', sans-serif;
            font-size: 1rem;
            letter-spacing: 1px;
            padding: 0.7rem 2rem;
            border-radius: 50px;
            background: linear-gradient(135deg, #f5c518, #e07b00);
            color: #1c1c1c;
            border: none;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
            transition: opacity 0.2s;
        }

        .btn-cadastro:hover {
            opacity: 0.85;
            color: #1c1c1c;
        }

        .btn-voltar {
            font-size: 0.85rem;
            color: #6c757d;
            text-decoration: none;
            display: block;
            margin-top: 1rem;
        }

        .btn-voltar:hover {
            color: #adb5bd;
        }

        #contador-texto {
            font-weight: 600;
            color: #f5c518;
        }
    </style>
</head>
<body>

<div class="card-curiosidade">
    <c:choose>
        <c:when test="${time.nome == 'Corinthians'}">
            <span class="badge-time badge-corinthians">${time.nome}</span>
        </c:when>
        <c:when test="${time.nome == 'Palmeiras'}">
            <span class="badge-time badge-palmeiras">${time.nome}</span>
        </c:when>
        <c:when test="${time.nome == 'Santos'}">
            <span class="badge-time badge-santos">${time.nome}</span>
        </c:when>
        <c:otherwise>
            <span class="badge-time badge-saopaulo">${time.nome}</span>
        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test="${not empty curiosidade}">
            <p class="texto-curiosidade">${curiosidade.texto}</p>
        </c:when>
        <c:otherwise>
            <p class="texto-curiosidade">Nao ha curiosidade disponivel para este time no momento. Escolha outro time.</p>
        </c:otherwise>
    </c:choose>

    <div class="separador"></div>

    <c:if test="${not empty curiosidade}">
        <p class="redirect-info">
            Voce sera redirecionado em <span id="contador-texto">15</span> segundos
        </p>

        <div class="countdown-bar-wrapper">
            <div class="countdown-bar" id="barra-countdown"></div>
        </div>

        <a href="${pageContext.request.contextPath}/cadastro" class="btn-cadastro">
            Quero me cadastrar agora
        </a>
    </c:if>

    <a href="${pageContext.request.contextPath}/escolhaTimes" class="btn-voltar">
        ← Escolher outro time
    </a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<c:if test="${not empty curiosidade}">
    <script>
        const total = 15;
        let restante = total;
        const barra = document.getElementById('barra-countdown');
        const texto = document.getElementById('contador-texto');

        const intervalo = setInterval(() => {
            restante--;
            texto.textContent = restante;
            barra.style.width = ((restante / total) * 100) + '%';

            if (restante <= 0) {
                clearInterval(intervalo);
                window.location.href = '${pageContext.request.contextPath}/cadastro';
            }
        }, 1000);
    </script>
</c:if>
</body>
</html>
