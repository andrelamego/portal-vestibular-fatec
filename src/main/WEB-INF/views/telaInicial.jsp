<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Futebol</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <div class="bg-slideshow">
        <div class="bg-slide active"></div>
        <div class="bg-slide"></div>
        <div class="bg-slide"></div>
        <div class="bg-slide"></div>
    </div>

    <div class="overlay"></div>

    <div class="content">
        <h1>⚽ Futebol</h1>
        <p>O esporte mais amado do mundo</p>
        <a href="/escolhaTime" class="btn">Entrar</a>
    </div>

    <script>
        const slides = document.querySelectorAll('.bg-slide');
        let current = 0;

        setInterval(() => {
            slides[current].classList.remove('active');
            current = (current + 1) % slides.length;
            slides[current].classList.add('active');
        }, 4000);
    </script>

</body>
</html>
