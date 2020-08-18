<?php

namespace Site\models;

if (!defined('URL')){
    header("location: /");
    exit();
}

class Video{

    private $result;
    private $tabela = "video";

    public function listar(){
        $listar = new \Site\models\helper\modelsRead();
        $listar->exeRead($this->tabela,
            "ORDER BY data_criacao DESC LIMIT :limit","limit=1");
        $this->result['video'] = $listar->getResult();
        return $this->result['video'];
    }

}
