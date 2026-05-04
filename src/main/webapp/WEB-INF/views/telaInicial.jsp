<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oraculo do Futebol</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500;600;700&family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --preto: #171717;
            --grafite: #252525;
            --branco: #f8f9fa;
            --amarelo: #f5c518;
            --verde: #118847;
            --vermelho: #c8102e;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Open Sans', sans-serif;
            color: var(--branco);
            background: var(--preto);
        }

        .hero {
            min-height: 100vh;
            display: flex;
            align-items: stretch;
            position: relative;
            overflow: hidden;
            background:
                linear-gradient(90deg, rgba(23,23,23,0.96) 0%, rgba(23,23,23,0.82) 42%, rgba(23,23,23,0.18) 100%),
                url("https://images.unsplash.com/photo-1574629810360-7efbbe195018?auto=format&fit=crop&w=1800&q=80") center/cover no-repeat;
        }

        .hero::after {
            content: "";
            position: absolute;
            inset: auto 0 0 0;
            height: 34%;
            background: linear-gradient(0deg, rgba(23,23,23,1), rgba(23,23,23,0));
            pointer-events: none;
        }

        .hero-inner {
            width: min(1180px, 100%);
            margin: 0 auto;
            padding: 2rem 1.25rem 2.5rem;
            display: grid;
            grid-template-columns: minmax(0, 1fr) minmax(320px, 440px);
            gap: 2rem;
            align-items: center;
            position: relative;
            z-index: 1;
        }

        .topbar {
            position: absolute;
            top: 1.25rem;
            left: 1.25rem;
            right: 1.25rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            z-index: 2;
        }

        .brand {
            font-family: 'Oswald', sans-serif;
            font-size: 1.05rem;
            font-weight: 700;
            color: var(--amarelo);
            text-decoration: none;
            letter-spacing: 1px;
        }

        .admin-link {
            color: #d5d7da;
            text-decoration: none;
            font-size: 0.88rem;
            font-weight: 600;
        }

        .admin-link:hover {
            color: var(--amarelo);
        }

        .eyebrow {
            font-family: 'Oswald', sans-serif;
            color: var(--amarelo);
            letter-spacing: 2px;
            text-transform: uppercase;
            font-size: 0.92rem;
            margin-bottom: 0.8rem;
        }

        h1 {
            font-family: 'Oswald', sans-serif;
            font-size: clamp(3rem, 7vw, 5.7rem);
            line-height: 0.95;
            letter-spacing: 0;
            margin: 0 0 1.2rem;
            max-width: 760px;
        }

        .lead {
            color: #d5d7da;
            font-size: 1.08rem;
            line-height: 1.7;
            max-width: 620px;
            margin-bottom: 2rem;
        }

        .actions {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 0.9rem;
        }

        .btn-oraculo {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 48px;
            padding: 0.75rem 1.4rem;
            border-radius: 8px;
            background: var(--amarelo);
            color: var(--preto);
            font-family: 'Oswald', sans-serif;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-decoration: none;
            border: 0;
        }

        .btn-oraculo:hover {
            background: #ffd84a;
            color: var(--preto);
        }

        .hint {
            color: #b9bec4;
            font-size: 0.9rem;
        }

        .team-wall {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 0.9rem;
            align-self: end;
            margin-bottom: 1rem;
        }

        .team-tile {
            min-height: 160px;
            border-radius: 8px;
            overflow: hidden;
            position: relative;
            background-size: cover;
            background-position: center;
            box-shadow: 0 14px 34px rgba(0,0,0,0.32);
        }

        .team-tile::before {
            content: "";
            position: absolute;
            inset: 0;
            background: linear-gradient(180deg, rgba(0,0,0,0.05), rgba(0,0,0,0.82));
        }

        .team-tile::after {
            content: "";
            position: absolute;
            inset: 0;
            border: 1px solid rgba(255,255,255,0.14);
            border-radius: 8px;
            pointer-events: none;
        }

        .team-name {
            position: absolute;
            left: 1rem;
            right: 1rem;
            bottom: 0.85rem;
            font-family: 'Oswald', sans-serif;
            font-size: 1rem;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        .tile-corinthians {
            background-image:
                linear-gradient(135deg, rgba(0,0,0,0.2), rgba(255,255,255,0.22)),
                url("https://images.unsplash.com/photo-1517927033932-b3d18e61fb3a?auto=format&fit=crop&w=700&q=80");
        }

        .tile-palmeiras {
            background-image:
                linear-gradient(135deg, rgba(17,136,71,0.45), rgba(0,0,0,0.12)),
                url("https://images.unsplash.com/photo-1522778119026-d647f0596c20?auto=format&fit=crop&w=700&q=80");
        }

        .tile-santos {
            background-image:
                linear-gradient(135deg, rgba(255,255,255,0.24), rgba(0,0,0,0.28)),
                url("https://images.unsplash.com/photo-1551958219-acbc608c6377?auto=format&fit=crop&w=700&q=80");
        }

        .tile-saopaulo {
            background-image:
                linear-gradient(135deg, rgba(200,16,46,0.48), rgba(0,0,0,0.2)),
                url("https://images.unsplash.com/photo-1579952363873-27f3bade9f55?auto=format&fit=crop&w=700&q=80");
        }

        .ticker {
            position: absolute;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 2;
            background: rgba(10,10,10,0.72);
            border-top: 1px solid rgba(255,255,255,0.12);
            overflow: hidden;
        }

        .ticker-track {
            display: flex;
            width: max-content;
            animation: correr 28s linear infinite;
        }

        .ticker span {
            display: inline-flex;
            align-items: center;
            min-height: 44px;
            padding: 0 1.5rem;
            color: #d5d7da;
            font-size: 0.86rem;
            font-weight: 700;
            white-space: nowrap;
        }

        .ticker strong {
            color: var(--amarelo);
            margin-right: 0.45rem;
        }

        @keyframes correr {
            from { transform: translateX(0); }
            to { transform: translateX(-50%); }
        }

        @media (max-width: 900px) {
            .hero {
                background:
                    linear-gradient(180deg, rgba(23,23,23,0.96) 0%, rgba(23,23,23,0.82) 54%, rgba(23,23,23,0.35) 100%),
                    url("https://images.unsplash.com/photo-1574629810360-7efbbe195018?auto=format&fit=crop&w=1200&q=80") center/cover no-repeat;
            }

            .hero-inner {
                grid-template-columns: 1fr;
                padding-top: 6rem;
                padding-bottom: 4.5rem;
            }

            .team-wall {
                align-self: auto;
                margin-bottom: 0;
            }
        }

        @media (max-width: 560px) {
            .topbar {
                align-items: flex-start;
                gap: 1rem;
            }

            .hero-inner {
                padding-left: 1rem;
                padding-right: 1rem;
            }

            .lead {
                font-size: 1rem;
            }

            .actions {
                align-items: stretch;
                flex-direction: column;
            }

            .btn-oraculo {
                width: 100%;
            }

            .team-wall {
                grid-template-columns: 1fr;
            }

            .team-tile {
                min-height: 118px;
            }
        }
    </style>
</head>
<body>
    <main class="hero">
        <header class="topbar">
            <a href="${pageContext.request.contextPath}/" class="brand">FATEC ZL FUTEBOL</a>
        </header>

        <section class="hero-inner">
            <div>
                <p class="eyebrow">Oraculo do Futebol</p>
                <h1>Escolha seu time e receba uma curiosidade.</h1>
                <p class="lead">
                    Uma entrada rapida para brincar com Corinthians, Palmeiras, Santos e Sao Paulo antes do cadastro do vestibular.
                </p>
                <div class="actions">
                    <a href="${pageContext.request.contextPath}/escolhaTimes" class="btn-oraculo">Entrar no oraculo</a>
                    <span class="hint">Times, sorteio e curiosidades em poucos segundos</span>
                </div>
            </div>

            <div class="team-wall" aria-label="Times disponiveis no oraculo">
                <div class="team-tile tile-corinthians">
                    <span class="team-name">Corinthians</span>
                </div>
                <div class="team-tile tile-palmeiras">
                    <span class="team-name">Palmeiras</span>
                </div>
                <div class="team-tile tile-santos">
                    <span class="team-name">Santos</span>
                </div>
                <div class="team-tile tile-saopaulo">
                    <span class="team-name">Sao Paulo</span>
                </div>
            </div>
        </section>

        <div class="ticker" aria-hidden="true">
            <div class="ticker-track">
                <span><strong>Corinthians</strong> historia, torcida e tradicao</span>
                <span><strong>Palmeiras</strong> conquistas e curiosidades</span>
                <span><strong>Santos</strong> futebol arte e memoria</span>
                <span><strong>Sao Paulo</strong> idolos e grandes noites</span>
                <span><strong>Corinthians</strong> historia, torcida e tradicao</span>
                <span><strong>Palmeiras</strong> conquistas e curiosidades</span>
                <span><strong>Santos</strong> futebol arte e memoria</span>
                <span><strong>Sao Paulo</strong> idolos e grandes noites</span>
            </div>
        </div>
    </main>
</body>
</html>
