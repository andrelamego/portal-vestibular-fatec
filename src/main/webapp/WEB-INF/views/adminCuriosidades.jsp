<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Curiosidades</title>
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
            max-width: 1120px;
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
            border-radius: 8px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.08);
            margin-bottom: 1.5rem;
            overflow: hidden;
        }

        .card-admin .card-header {
            background: var(--cinza-escuro);
            color: var(--branco);
            font-family: 'Oswald', sans-serif;
            font-size: 1rem;
            font-weight: 600;
            letter-spacing: 0.5px;
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
        }

        .btn-salvar:hover {
            background: #3a3a3a;
            color: var(--amarelo);
        }

        .tabela-curiosidades {
            font-size: 0.88rem;
            margin: 0;
        }

        .tabela-curiosidades thead th {
            background: #f8f9fa;
            color: #495057;
            font-weight: 600;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid #dee2e6;
            white-space: nowrap;
        }

        .tabela-curiosidades tbody tr:hover {
            background: #f8f9fa;
        }

        .badge-id {
            background: var(--cinza-escuro);
            color: var(--amarelo);
            font-family: 'Oswald', sans-serif;
            font-size: 0.8rem;
            padding: 0.25rem 0.6rem;
            border-radius: 6px;
        }

        .badge-status {
            background: #e9ecef;
            color: #495057;
            font-size: 0.78rem;
            padding: 0.2rem 0.55rem;
            border-radius: 6px;
            font-weight: 600;
            white-space: nowrap;
        }

        .texto-curiosidade {
            min-width: 320px;
            line-height: 1.45;
        }

        .sem-resultados {
            color: #6c757d;
            padding: 2rem 1.5rem;
            text-align: center;
        }
    </style>
</head>
<body>

    <nav class="navbar-admin d-flex align-items-center">
        <a href="${pageContext.request.contextPath}/admin/curiosidades" class="brand">ADMIN FATEC ZL</a>
        <div class="ms-auto">
            <a href="${pageContext.request.contextPath}/admin/curiosidades" class="nav-link-admin active">Curiosidades</a>
            <a href="${pageContext.request.contextPath}/admin/cadastraTipo" class="nav-link-admin">Tipos</a>
            <a href="${pageContext.request.contextPath}/admin/consultaCandidatos" class="nav-link-admin">Candidatos</a>
            <a href="${pageContext.request.contextPath}/admin/logout" class="nav-link-admin">Sair</a>
            <a href="${pageContext.request.contextPath}/" class="nav-link-admin">Site</a>
        </div>
    </nav>

    <div class="main-content">
        <h1 class="page-title">Gerenciar Curiosidades</h1>

        <c:if test="${not empty sucesso}">
            <div class="alert alert-success rounded-3" role="alert">${sucesso}</div>
        </c:if>
        <c:if test="${not empty erro}">
            <div class="alert alert-danger rounded-3" role="alert">${erro}</div>
        </c:if>

        <div class="card-admin">
            <div class="card-header">Nova Curiosidade</div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/admin/curiosidades" method="post">
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label for="timeId" class="form-label">Time *</label>
                            <select id="timeId" name="timeId" class="form-select" required>
                                <option value="" selected disabled>Selecione...</option>
                                <c:forEach var="time" items="${times}">
                                    <option value="${time.id}">${time.nome}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label for="tipoMensagemId" class="form-label">Tipo *</label>
                            <select id="tipoMensagemId" name="tipoMensagemId" class="form-select" required>
                                <option value="" selected disabled>Selecione...</option>
                                <c:forEach var="tipo" items="${tipos}">
                                    <option value="${tipo.id}">${tipo.descricao}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label for="ativa" class="form-label">Status</label>
                            <select id="ativa" name="ativa" class="form-select">
                                <option value="true" selected>Ativa</option>
                                <option value="false">Inativa</option>
                            </select>
                        </div>

                        <div class="col-12">
                            <label for="texto" class="form-label">Texto da curiosidade *</label>
                            <textarea id="texto" name="texto" class="form-control" rows="4" maxlength="500" required
                                      placeholder="Digite a curiosidade que sera exibida ao visitante"></textarea>
                        </div>

                        <div class="col-12">
                            <button type="submit" class="btn-salvar">Cadastrar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="card-admin">
            <div class="card-header">Curiosidades Cadastradas</div>
            <c:choose>
                <c:when test="${empty curiosidades}">
                    <div class="sem-resultados">Nenhuma curiosidade cadastrada ainda.</div>
                </c:when>
                <c:otherwise>
                    <div class="table-responsive">
                        <table class="table tabela-curiosidades">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Time</th>
                                    <th>Tipo</th>
                                    <th>Texto</th>
                                    <th>Status</th>
                                    <th>Origem</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="curiosidade" items="${curiosidades}">
                                    <tr>
                                        <td><span class="badge-id">#${curiosidade.id}</span></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty curiosidade.time}">${curiosidade.time.nome}</c:when>
                                                <c:otherwise>-</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty curiosidade.tipoMensagem}">${curiosidade.tipoMensagem.descricao}</c:when>
                                                <c:otherwise>-</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="texto-curiosidade">${curiosidade.texto}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${curiosidade.ativa}">
                                                    <span class="badge-status">Ativa</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge-status">Inativa</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${curiosidade.origemTxt}">
                                                    <span class="badge-status">TXT</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge-status">Admin</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
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
