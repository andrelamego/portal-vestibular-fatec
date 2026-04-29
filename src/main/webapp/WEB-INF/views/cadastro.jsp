<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - Vestibular Fatec ZL</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --cinza-escuro: #1c1c1c;
            --branco: #f8f9fa;
            --azul-fatec: #003d7c;
            --amarelo: #f5c518;
        }

        body {
            background-color: #f0f2f5;
            font-family: 'Open Sans', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 2rem 1rem;
        }

        .card-cadastro {
            background: #ffffff;
            border: none;
            border-radius: 20px;
            max-width: 620px;
            width: 100%;
            box-shadow: 0 4px 24px rgba(0,0,0,0.10);
            overflow: hidden;
        }

        .card-header-fatec {
            background: var(--azul-fatec);
            padding: 1.8rem 2rem 1.4rem;
            text-align: center;
        }

        .card-header-fatec h1 {
            font-family: 'Oswald', sans-serif;
            font-size: 1.6rem;
            font-weight: 700;
            color: #ffffff;
            margin: 0;
            letter-spacing: 0.5px;
        }

        .card-header-fatec p {
            color: rgba(255,255,255,0.75);
            font-size: 0.9rem;
            margin: 0.3rem 0 0;
        }

        .card-body-form {
            padding: 2rem;
        }

        .form-label {
            font-weight: 600;
            font-size: 0.9rem;
            color: #343a40;
            margin-bottom: 0.3rem;
        }

        .form-control, .form-select {
            border-radius: 10px;
            border: 1.5px solid #dee2e6;
            font-size: 0.95rem;
            padding: 0.55rem 0.9rem;
            transition: border-color 0.2s;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--azul-fatec);
            box-shadow: 0 0 0 3px rgba(0,61,124,0.12);
        }

        .aviso-consentimento {
            background: #e8f4fd;
            border-left: 4px solid var(--azul-fatec);
            border-radius: 8px;
            padding: 0.9rem 1rem;
            font-size: 0.85rem;
            color: #495057;
            margin-top: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .aviso-consentimento strong {
            color: var(--azul-fatec);
        }

        .form-check-label {
            font-size: 0.9rem;
            color: #495057;
        }

        .btn-cadastrar {
            font-family: 'Oswald', sans-serif;
            font-size: 1.05rem;
            letter-spacing: 1px;
            padding: 0.75rem;
            border-radius: 12px;
            background: var(--azul-fatec);
            color: #ffffff;
            border: none;
            font-weight: 600;
            width: 100%;
            transition: background 0.2s, transform 0.1s;
        }

        .btn-cadastrar:hover {
            background: #002a57;
            transform: translateY(-1px);
        }

        .btn-cadastrar:disabled {
            background: #adb5bd;
            cursor: not-allowed;
        }

        .alerta-sucesso, .alerta-erro {
            border-radius: 10px;
            font-size: 0.9rem;
        }

        .link-voltar {
            text-align: center;
            margin-top: 1.2rem;
            font-size: 0.85rem;
        }

        .link-voltar a {
            color: #6c757d;
            text-decoration: none;
        }

        .link-voltar a:hover { color: var(--azul-fatec); }
    </style>
</head>
<body>

    <div class="card-cadastro">

        <div class="card-header-fatec">
            <h1>🎓 Vestibular Fatec ZL</h1>
            <p>Cadastre-se e fique por dentro de todas as novidades</p>
        </div>

        <div class="card-body-form">

            <c:if test="${not empty sucesso}">
                <div class="alert alert-success alerta-sucesso" role="alert">
                    ✅ ${sucesso}
                </div>
            </c:if>
            <c:if test="${not empty erro}">
                <div class="alert alert-danger alerta-erro" role="alert">
                    ❌ ${erro}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/cadastro" method="post" id="formCadastro">

                <div class="mb-3">
                    <label for="nomeCompleto" class="form-label">Nome completo *</label>
                    <input type="text" class="form-control" id="nomeCompleto" name="nomeCompleto"
                           placeholder="Seu nome completo" required maxlength="150"
                           value="${candidato.nomeCompleto}">
                </div>

                <div class="row g-3 mb-3">
                    <div class="col-md-6">
                        <label for="email" class="form-label">E-mail *</label>
                        <input type="email" class="form-control" id="email" name="email"
                               placeholder="seu@email.com" required maxlength="100"
                               value="${candidato.email}">
                    </div>
                    <div class="col-md-6">
                        <label for="telefoneCelular" class="form-label">Telefone celular *</label>
                        <input type="tel" class="form-control" id="telefoneCelular" name="telefoneCelular"
                               placeholder="(11) 99999-9999" required maxlength="15"
                               value="${candidato.telefoneCelular}">
                    </div>
                </div>

                <div class="row g-3 mb-3">
                    <div class="col-md-6">
                        <label for="bairro" class="form-label">Bairro *</label>
                        <input type="text" class="form-control" id="bairro" name="bairro"
                               placeholder="Seu bairro" required maxlength="100"
                               value="${candidato.bairro}">
                    </div>
                    <div class="col-md-6">
                        <label for="cursoId" class="form-label">Curso de interesse *</label>
                        <select class="form-select" id="cursoId" name="cursoId" required>
                            <option value="" disabled selected>Selecione um curso</option>
                            <c:forEach var="curso" items="${cursos}">
                                <option value="${curso.id}"
                                    <c:if test="${candidato.curso.id == curso.id}">selected</c:if>>
                                    ${curso.nome}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="aviso-consentimento">
                    <strong>📢 Aviso de consentimento:</strong> Ao se cadastrar, você autoriza a
                    <strong>Fatec Zona Leste</strong> a entrar em contato por e-mail, telefone ou
                    WhatsApp com informações sobre o vestibular e os cursos oferecidos.
                </div>

                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" id="concordo" required>
                    <label class="form-check-label" for="concordo">
                        Estou ciente e concordo com o recebimento de mensagens sobre o vestibular.
                    </label>
                </div>

                <button type="submit" class="btn-cadastrar" id="btnEnviar">
                    Quero me cadastrar
                </button>

            </form>

            <div class="link-voltar">
                <a href="${pageContext.request.contextPath}/escolhaTimes">← Voltar à escolha de time</a>
            </div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('telefoneCelular').addEventListener('input', function(e) {
            let v = e.target.value.replace(/\D/g, '');
            if (v.length <= 11) {
                v = v.replace(/^(\d{2})(\d)/, '($1) $2');
                v = v.replace(/(\d{5})(\d{4})$/, '$1-$2');
            }
            e.target.value = v;
        });

        document.getElementById('formCadastro').addEventListener('submit', function() {
            const btn = document.getElementById('btnEnviar');
            btn.disabled = true;
            btn.textContent = 'Enviando...';
        });
    </script>
</body>
</html>
