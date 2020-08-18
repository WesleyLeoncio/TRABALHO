<?php

namespace Site\models;

if (!defined('URL')){
    header("location: /");
    exit();
}

class Noticia{

    private $result;
    private $tabela = "noticia";
    private $noticia;

    public function listarTelaInicial(){
        $listar = new \Site\models\helper\modelsRead();
        $listar->exeReadEspecifico("SELECT id, titulo, descricao, imagem, slug
                          FROM {$this->tabela}                         
                          ORDER BY data_criacao DESC LIMIT :limit",
                            "limit=3");
        $this->result['noticias'] = $listar->getResult();
        return $this->result['noticias'];
    }

    public function listar(){
        $listar = new \Site\models\helper\modelsRead();
        $listar->exeReadEspecifico("SELECT noti.id, noti.titulo, noti.descricao, noti.imagem, noti.slug, 
                          noti.author, noti.data_criacao,
                          cat.nome 
                          FROM {$this->tabela} noti
                          INNER JOIN categoria_noticia cat ON cat.id = noti.categoria_noticia_id                                                    
                          ORDER BY noti.data_criacao DESC LIMIT :limit",
                            "limit=5");
        $this->result['noticias'] = $listar->getResult();
        return $this->result['noticias'];
    }

    public function visualizarNoticia($noticia = null){
        $this->noticia = $noticia;

        $visualizar = new \Site\models\helper\modelsRead();
        $visualizar->exeReadEspecifico("SELECT noti.id, noti.titulo, noti.descricao, noti.conteudo, noti.imagem, 
                          noti.slug, noti.author, noti.data_criacao,
                          cat.nome 
                          FROM {$this->tabela} noti                          
                          INNER JOIN categoria_noticia cat ON cat.id = noti.categoria_noticia_id
                          WHERE adm_situacoes_id=:adm_situacoes_id AND noti.slug = :slug                                                    
                          LIMIT :limit",
                            "adm_situacoes_id=1&limit=1&slug={$this->noticia}");
        $this->result['noticias'] = $visualizar->getResult();
        return $this->result['noticias'];
    }

    public function noticiasRecentes(){
        $listarRecentes = new \Site\models\helper\modelsRead();
        $listarRecentes->exeReadEspecifico("SELECT id, titulo, descricao, slug
                          FROM {$this->tabela}  
                          WHERE adm_situacoes_id=:adm_situacoes_id                       
                          ORDER BY data_criacao DESC LIMIT :limit",
                            "adm_situacoes_id=1&limit=10");
        $this->result['notRecentes'] = $listarRecentes->getResult();
        return $this->result['notRecentes'];
    }
}
