<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Consulta de Candidatos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --cinza-escuro: #1c1c1c;
            --branco: #f8f9fa;
            --amarelo: #f5c518;
        }

        body {
            background-color: #f0f2f5;
            font-family: 'Open Sans', sans-serif;
            min-height: 100vh;
        }

        .navbar-admin {
            background: var(--cinza-escuro);
            padding: 0.9rem 1.5rem;
        }

        .navbar-admin .brand {
            font-family: 'Oswald', sans-serif;
            font-size: 1.2rem;
            font-weight: 700;
            color: var(--amarelo);
            letter-spacing: 1px;
            text-decoration: none;
        }

        .navbar-admin .nav-link-admin {
            color: #adb5bd;
            font-size: 0.9rem;
            text-decoration: none;
            margin-left: 1.2rem;
            transition: color 0.2s;
        }

        .navbar-admin .nav-link-admin:hover,
        .navbar-admin .nav-link-admin.active {
            color: var(--amarelo);
        }

        .main-content {
            max-width: 1100px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .page-title {
            font-family: 'Oswald', sans-serif;
            font-size: 1.6rem;
            font-weight: 700;
            color: var(--cinza-escuro);
            margin-bottom: 1.5rem;
        }

        .card-filtros {
            background: #ffffff;
            border: none;
            border-radius: 16px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.08);
            margin-bottom: 1.5rem;
            padding: 1.2rem 1.5rem;
        }

        .titulo-filtros {
            font-family: 'Oswald', sans-serif;
            font-size: 1rem;
            font-weight: 600;
            color: #495057;
            margin-bottom: 1rem;
            letter-spacing: 0.3px;
        }

        .btn-filtro {
            font-size: 0.85rem;
            padding: 0.45rem 1rem;
            border-radius: 8px;
            border: 1.5px solid #dee2e6;
            background: #fff;
            color: #495057;
            transition: all 0.2s;
            text-decoration: none;
            display: inline-block;
        }

        .btn-filtro:hover, .btn-filtro.ativo {
            background: var(--cinza-escuro);
            color: var(--amarelo);
            border-color: var(--cinza-escuro);
        }

        .form-inline-filtro {
            display: flex;
            gap: 0.5rem;
            align-items: center;
            flex-wrap: wrap;
        }

        .form-control-sm-custom {
            border-radius: 8px;
            border: 1.5px solid #dee2e6;
            font-size: 0.88rem;
            padding: 0.42rem 0.8rem;
            min-width: 160px;
        }

        .form-control-sm-custom:focus {
            border-color: #555;
            box-shadow: 0 0 0 3px rgba(0,0,0,0.07);
            outline: none;
        }

        .btn-buscar {
            background: var(--cinza-escuro);
            color: var(--amarelo);
            border: none;
            border-radius: 8px;
            font-family: 'Oswald', sans-serif;
            font-size: 0.88rem;
            padding: 0.45rem 1.1rem;
            letter-spacing: 0.4px;
        }

        .btn-buscar:hover { background: #3a3a3a; }

        .card-resultado {
            background: #ffffff;
            border: none;
            border-radius: 16px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.08);
            overflow: hidden;
        }

        .card-resultado-header {
            background: var(--cinza-escuro);
            color: var(--branco);
            font-family: 'Oswald', sans-serif;
            font-size: 1rem;
            font-weight: 600;
            padding: 0.9rem 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .badge-total {
            background: var(--amarelo);
            color: var(--cinza-escuro);
            font-size: 0.8rem;
            font-weight: 700;
            padding: 0.2rem 0.7rem;
            border-radius: 50px;
        }

        .tabela-candidatos {
            font-size: 0.88rem;
            margin: 0;
        }

        .tabela-candidatos thead th {
            background: #f8f9fa;
            color: #495057;
            font-weight: 600;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid #dee2e6;
            white-space: nowrap;
        }

        .tabela-candidatos tbody tr:hover { background: #f8f9fa; }

        .badge-curso {
            background: #e9ecef;
            color: #495057;
            font-size: 0.78rem;
            padding: 0.2rem 0.6rem;
            border-radius: 6px;
            font-weight: 600;
        }

        .sem-resultados {
            text-align: center;
            color: #adb5bd;
            padding: 3rem 1rem;
            font-size: 0.95rem;
        }
    </style>
</head>
<body>

    <nav class="navbar-admin d-flex align-items-center">
        <a href="#" class="brand">⚽ ADMIN FATEC ZL</a>
        <div class="ms-auto">
            <a href="${pageContext.request.contextPath}/admin/curiosidades" class="nav-link-admin">Curiosidades</a>
            <a href="${pageContext.request.contextPath}/admin/cadastraTipo" class="nav-link-admin">Tipos</a>
            <a href="${pageContext.request.contextPath}/admin/consultaCandidatos" class="nav-link-admin active">Candidatos</a>
            <a href="${pageContext.request.contextPath}/admin/logout" class="nav-link-admin">Sair</a>
            <a href="${pageContext.request.contextPath}/" class="nav-link-admin">← Site</a>
        </div>
    </nav>

    <div class="main-content">

        <h1 class="page-title">Consulta de Candidatos</h1>

        <div class="card-filtros">
            <p class="titulo-filtros">🔎 Filtros rápidos</p>

            <div class="d-flex flex-wrap gap-2 mb-3">
                <a href="${pageContext.request.contextPath}/admin/consultaCandidatos?tipo=todos-curso"
                   class="btn-filtro ${tipoBusca == 'todos-curso' ? 'ativo' : ''}">
                   Todos por curso
                </a>
                <a href="${pageContext.request.contextPath}/admin/consultaCandidatos?tipo=todos-bairro"
                   class="btn-filtro ${tipoBusca == 'todos-bairro' ? 'ativo' : ''}">
                   Todos por bairro
                </a>
                <a href="${pageContext.request.contextPath}/admin/consultaCandidatos?tipo=primeiros10"
                   class="btn-filtro ${tipoBusca == 'primeiros10' ? 'ativo' : ''}">
                   10 primeiros cadastros
                </a>
                <a href="${pageContext.request.contextPath}/admin/consultaCandidatos?tipo=ultimos10"
                   class="btn-filtro ${tipoBusca == 'ultimos10' ? 'ativo' : ''}">
                   10 últimos cadastros
                </a>
            </div>

            <div class="d-flex gap-3 flex-wrap">
                <form action="${pageContext.request.contextPath}/admin/consultaCandidatos" method="get"
                      class="form-inline-filtro">
                    <input type="hidden" name="tipo" value="por-curso">
                    <select class="form-control-sm-custom" name="cursoId" required>
                        <option value="" disabled <c:if test="${empty cursoFiltro}">selected</c:if>>Filtrar por curso...</option>
                        <c:forEach var="curso" items="${cursos}">
                            <option value="${curso.id}"
                                <c:if test="${cursoFiltro == curso.id}">selected</c:if>>
                                ${curso.nome}
                            </option>
                        </c:forEach>
                    </select>
                    <button type="submit" class="btn-buscar">Buscar</button>
                </form>

                <form action="${pageContext.request.contextPath}/admin/consultaCandidatos" method="get"
                      class="form-inline-filtro">
                    <input type="hidden" name="tipo" value="por-bairro">
                    <input type="text" class="form-control-sm-custom" name="bairro"
                           placeholder="Filtrar por bairro..." value="${bairroFiltro}">
                    <button type="submit" class="btn-buscar">Buscar</button>
                </form>
            </div>
        </div>

        <div class="card-resultado">
            <div class="card-resultado-header">
                <span>
                    <c:choose>
                        <c:when test="${tipoBusca == 'todos-curso'}">Todos os candidatos — ordenados por curso</c:when>
                        <c:when test="${tipoBusca == 'todos-bairro'}">Todos os candidatos — ordenados por bairro</c:when>
                        <c:when test="${tipoBusca == 'primeiros10'}">10 primeiros cadastros</c:when>
                        <c:when test="${tipoBusca == 'ultimos10'}">10 últimos cadastros</c:when>
                        <c:when test="${tipoBusca == 'por-curso'}">Candidatos — curso selecionado</c:when>
                        <c:when test="${tipoBusca == 'por-bairro'}">Candidatos — bairro: ${bairroFiltro}</c:when>
                        <c:otherwise>Selecione um filtro acima</c:otherwise>
                    </c:choose>
                </span>
                <c:if test="${not empty candidatos}">
                    <span class="badge-total">${candidatos.size()} resultado(s)</span>
                </c:if>
            </div>

            <c:choose>
                <c:when test="${empty candidatos && not empty tipoBusca}">
                    <div class="sem-resultados">
                        😕 Nenhum candidato encontrado para este filtro.
                    </div>
                </c:when>
                <c:when test="${empty tipoBusca}">
                    <div class="sem-resultados">
                        Use os filtros acima para consultar os candidatos.
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="table-responsive">
                        <table class="table tabela-candidatos">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nome</th>
                                    <th>E-mail</th>
                                    <th>Telefone</th>
                                    <th>Bairro</th>
                                    <th>Curso</th>
                                    <th>Data/Hora Cadastro</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c" items="${candidatos}" varStatus="status">
                                    <tr>
                                        <td class="text-muted">${status.count}</td>
                                        <td><strong>${c.nomeCompleto}</strong></td>
                                        <td>${c.email}</td>
                                        <td>${c.telefoneCelular}</td>
                                        <td>${c.bairro}</td>
                                        <td><span class="badge-curso">${c.curso.nome}</span></td>
                                        <td class="text-muted">${c.dataHoraCadastroFormatada()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
