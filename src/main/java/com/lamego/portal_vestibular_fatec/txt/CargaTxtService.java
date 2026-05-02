package com.lamego.portal_vestibular_fatec.txt;

import com.lamego.portal_vestibular_fatec.curiosidade.Curiosidade;
import com.lamego.portal_vestibular_fatec.curiosidade.CuriosidadeRepository;
import com.lamego.portal_vestibular_fatec.time.Time;
import com.lamego.portal_vestibular_fatec.time.TimeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.util.List;

@Service
public class CargaTxtService {

    @Autowired
    private TimeRepository timeRepository;

    @Autowired
    private CuriosidadeRepository curiosidadeRepository;

    public void carregarDadosSeNecessario() {
        if (timeRepository.count() > 0) {
            return;
        }

        carregarTimes();
        carregarCuriosidades();
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

                curiosidadeRepository.save(curiosidade);
            }
        } catch (Exception e) {
            throw new RuntimeException("Erro ao carregar " + nomeArquivo);
        }
    }
}
