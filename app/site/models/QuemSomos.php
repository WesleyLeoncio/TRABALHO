<?php

namespace Site\models;

if (!defined('URL')){
    header("location: /");
    exit();
}

class QuemSomos{

    private $result;
    private $tabela = "quem_somos";

    public function listar(){
        $listar = new \Site\models\helper\modelsRead();
        $listar->exeReadEspecifico("SELECT id, titulo, descricao, imagem
                          FROM {$this->tabela} 
                          WHERE adm_situacao_id = :adm_situacao_id
                          ORDER BY ordem ASC LIMIT :limit",
            "adm_situacao_id=1&limit=3");
        $this->result['quemsomos'] = $listar->getResult();
        return $this->result['quemsomos'];
    }
}


