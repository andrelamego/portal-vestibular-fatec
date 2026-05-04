package com.lamego.portal_vestibular_fatec.txt;

import com.lamego.portal_vestibular_fatec.curiosidade.Curiosidade;
import com.lamego.portal_vestibular_fatec.curiosidade.CuriosidadeRepository;
import com.lamego.portal_vestibular_fatec.curso.Curso;
import com.lamego.portal_vestibular_fatec.curso.CursoRepository;
import com.lamego.portal_vestibular_fatec.time.Time;
import com.lamego.portal_vestibular_fatec.time.TimeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class CargaTxtService {

    @Autowired
    private TimeRepository timeRepository;

    @Autowired
    private CuriosidadeRepository curiosidadeRepository;

    @Autowired
    private CursoRepository cursoRepository;

    private static final List<String> NOMES_CURSOS = List.of(
            "AMS - Análise e Desenvolvimento de Sistemas",
            "Análise e Desenvolvimento de Sistemas",
            "Comércio Exterior",
            "Desenvolvimento de Produtos Plásticos",
            "Desenvolvimento de Software Multiplataforma",
            "Gestão de Recursos Humanos",
            "Gestão Empresarial",
            "Logística",
            "Polímeros"
    );

    public void carregarDadosSeNecessario() {
        if(cursoRepository.count() == 0) {
            carregarCursos();
        }

        if (timeRepository.count() == 0) {
            carregarTimes();
            carregarCuriosidades();
        }
    }

    private void carregarTimes() {
        try {
            File arquivo = ResourceUtils.getFile("classpath:txts/carregaTimes.txt");

            List<String> linhas = Files.readAllLines(arquivo.toPath());

            for (String linha : linhas) {
                Time time = new Time();
                time.setNome(linha.trim());

                timeRepository.save(time);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void carregarCuriosidades() {
        carregarCuriosidadesTime("Corinthians", "carregaCorinthians.txt");
        carregarCuriosidadesTime("Palmeiras", "carregaPalmeiras.txt");
        carregarCuriosidadesTime("Santos", "carregaSantos.txt");
        carregarCuriosidadesTime("Sao Paulo", "carregaSaoPaulo.txt");
    }

    private void carregarCuriosidadesTime(String nomeTime, String nomeArquivo) {
        try {
            Time time = timeRepository.findByNome(nomeTime)
                    .orElseThrow();

            File arquivo = ResourceUtils.getFile("classpath:txts/" + nomeArquivo);

            List<String> linhas = Files.readAllLines(arquivo.toPath());

            for (String linha : linhas) {
                Curiosidade curiosidade = new Curiosidade();

                curiosidade.setTexto(linha.trim());
                curiosidade.setTime(time);
                curiosidade.setAtiva(true);
                curiosidade.setOrigemTxt(true);
                curiosidade.setDataCarga(LocalDateTime.now());

                curiosidadeRepository.save(curiosidade);
            }
        } catch (Exception e) {
            throw new RuntimeException("Erro ao carregar " + nomeArquivo);
        }
    }

    private void carregarCursos() {
        List<Curso> cursos = NOMES_CURSOS.stream()
                .filter(nome -> !cursoRepository.existsByNome(nome))
                .map(this::criarCursoAtivo)
                .toList();

        cursoRepository.saveAll(cursos);
    }

    private Curso criarCursoAtivo(String nome) {
        Curso curso = new Curso();
        curso.setNome(nome);
        curso.setAtivo(true);
        return curso;
    }
}
