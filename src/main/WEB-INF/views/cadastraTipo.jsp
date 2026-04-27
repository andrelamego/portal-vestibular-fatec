<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Cadastro de Tipos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --cinza-escuro: #1c1c1c;
            --cinza-medio: #2b2b2b;
            --branco: #f8f9fa;
            --amarelo: #f5c518;
            --vermelho: #dc3545;
        }

        body {
            background-color: #f0f2f5;
            font-family: 'Open Sans', sans-serif;
            min-height: 100vh;
        }

        /* Sidebar / Navbar admin */
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

        /* Conteúdo principal */
        .main-content {
            max-width: 960px;
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

        .card-admin {
            background: #ffffff;
            border: none;
            border-radius: 16px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.08);
            margin-bottom: 2rem;
        }

        .card-admin .card-header {
            background: var(--cinza-escuro);
            color: var(--branco);
            font-family: 'Oswald', sans-serif;
            font-size: 1rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            border-radius: 16px 16px 0 0 !important;
            padding: 0.9rem 1.5rem;
        }

        .card-admin .card-body {
            padding: 1.5rem;
        }

        .form-label {
            font-weight: 600;
            font-size: 0.88rem;
            color: #343a40;
        }

        .form-control, .form-select {
            border-radius: 8px;
            border: 1.5px solid #dee2e6;
            font-size: 0.92rem;
        }

        .form-control:focus, .form-select:focus {
            border-color: #555;
            box-shadow: 0 0 0 3px rgba(0,0,0,0.08);
        }

        .btn-salvar {
            background: var(--cinza-escuro);
            color: var(--amarelo);
            border: none;
            border-radius: 8px;
            font-family: 'Oswald', sans-serif;
            font-size: 0.95rem;
            padding: 0.55rem 1.5rem;
            letter-spacing: 0.5px;
            transition: background 0.2s;
        }

        .btn-salvar:hover { background: #3a3a3a; }

        .btn-limpar {
            background: transparent;
            color: #6c757d;
            border: 1.5px solid #dee2e6;
            border-radius: 8px;
            font-size: 0.9rem;
            padding: 0.55rem 1.2rem;
            transition: border-color 0.2s;
        }

        .btn-limpar:hover { border-color: #adb5bd; }

        /* Tabela */
        .tabela-tipos {
            font-size: 0.9rem;
        }

        .tabela-tipos thead th {
            background: #f8f9fa;
            color: #495057;
            font-weight: 600;
            font-size: 0.82rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid #dee2e6;
        }

        .tabela-tipos tbody tr:hover { background: #f8f9fa; }

        .btn-editar {
            font-size: 0.82rem;
            padding: 0.3rem 0.8rem;
            border-radius: 6px;
            background: #e9ecef;
            color: #495057;
            border: none;
            transition: background 0.2s;
        }

        .btn-editar:hover { background: #dee2e6; }

        /* Consulta simples */
        .resultado-consulta {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 1rem 1.2rem;
            font-size: 0.9rem;
            min-height: 60px;
        }

        .badge-id {
            background: var(--cinza-escuro);
            color: var(--amarelo);
            font-family: 'Oswald', sans-serif;
            font-size: 0.8rem;
            padding: 0.25rem 0.6rem;
            border-radius: 6px;
        }
    </style>
</head>
<body>

    <%-- Navbar admin --%>
    <nav class="navbar-admin d-flex align-items-center">
        <a href="#" class="brand">⚽ ADMIN FATEC ZL</a>
        <div class="ms-auto">
            <a href="${pageContext.request.contextPath}/admin/cadastraTipo" class="nav-link-admin active">Tipos</a>
            <a href="${pageContext.request.contextPath}/admin/consultaCandidatos" class="nav-link-admin">Candidatos</a>
            <a href="${pageContext.request.contextPath}/" class="nav-link-admin">← Site</a>
        </div>
    </nav>

    <div class="main-content">

        <h1 class="page-title">Gerenciar Tipos de Mensagem</h1>

        <%-- Feedback --%>
        <c:if test="${not empty sucesso}">
            <div class="alert alert-success rounded-3" role="alert">✅ ${sucesso}</div>
        </c:if>
        <c:if test="${not empty erro}">
            <div class="alert alert-danger rounded-3" role="alert">❌ ${erro}</div>
        </c:if>

        <div class="row g-4">

            <%-- Formulário Cadastro / Edição --%>
            <div class="col-md-5">
                <div class="card-admin">
                    <div class="card-header">
                        <c:choose>
                            <c:when test="${not empty tipoEdicao}">✏️ Editar Tipo</c:when>
                            <c:otherwise>➕ Novo Tipo</c:otherwise>
                        </c:choose>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/admin/cadastraTipo" method="post">

                            <c:if test="${not empty tipoEdicao}">
                                <input type="hidden" name="id" value="${tipoEdicao.id}">
                            </c:if>

                            <div class="mb-3">
                                <label for="nome" class="form-label">Nome do tipo *</label>
                                <input type="text" class="form-control" id="nome" name="nome"
                                       placeholder="Ex: Curiosidade, Dica, Fato..."
                                       required maxlength="80"
                                       value="${tipoEdicao.nome}">
                            </div>

                            <div class="mb-4">
                                <label for="descricao" class="form-label">Descrição</label>
                                <textarea class="form-control" id="descricao" name="descricao"
                                          rows="3" maxlength="255"
                                          placeholder="Descrição opcional do tipo">${tipoEdicao.descricao}</textarea>
                            </div>

                            <div class="d-flex gap-2">
                                <button type="submit" class="btn-salvar">Salvar</button>
                                <a href="${pageContext.request.contextPath}/admin/cadastraTipo" class="btn-limpar">Limpar</a>
                            </div>

                        </form>
                    </div>
                </div>

                <%-- Consulta simples por ID --%>
                <div class="card-admin">
                    <div class="card-header">🔍 Consulta por ID</div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/admin/cadastraTipo/consulta" method="get" class="d-flex gap-2">
                            <input type="number" class="form-control" name="id"
                                   placeholder="ID do tipo" min="1"
                                   value="${consultaId}" required>
                            <button type="submit" class="btn-salvar">Buscar</button>
                        </form>

                        <c:if test="${not empty tipoConsulta}">
                            <div class="resultado-consulta mt-3">
                                <span class="badge-id">#${tipoConsulta.id}</span>
                                <strong class="ms-2">${tipoConsulta.nome}</strong>
                                <c:if test="${not empty tipoConsulta.descricao}">
                                    <p class="text-muted mb-0 mt-1" style="font-size:0.85rem;">${tipoConsulta.descricao}</p>
                                </c:if>
                            </div>
                        </c:if>

                        <c:if test="${not empty erroConsulta}">
                            <div class="resultado-consulta mt-3 text-danger">${erroConsulta}</div>
                        </c:if>
                    </div>
                </div>
            </div>

            <%-- Listagem de todos os tipos --%>
            <div class="col-md-7">
                <div class="card-admin">
                    <div class="card-header">📋 Todos os Tipos</div>
                    <div class="card-body p-0">
                        <c:choose>
                            <c:when test="${empty tipos}">
                                <p class="text-muted p-3 mb-0">Nenhum tipo cadastrado ainda.</p>
                            </c:when>
                            <c:otherwise>
                                <table class="table tabela-tipos mb-0">
                                    <thead>
                                        <tr>
                                            <th style="width:60px">ID</th>
                                            <th>Nome</th>
                                            <th>Descrição</th>
                                            <th style="width:80px">Ação</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="tipo" items="${tipos}">
                                            <tr>
                                                <td><span class="badge-id">#${tipo.id}</span></td>
                                                <td>${tipo.nome}</td>
                                                <td class="text-muted">
                                                    <c:choose>
                                                        <c:when test="${not empty tipo.descricao}">${tipo.descricao}</c:when>
                                                        <c:otherwise>—</c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/admin/cadastraTipo/editar?id=${tipo.id}"
                                                       class="btn-editar">Editar</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
