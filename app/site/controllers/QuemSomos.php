<?php

namespace App\site\controllers;

if (!defined('URL')){
    header("location: /");
    exit();
}

class QuemSomos {
    private $dados;

    public function index() {

        $listar = new \Site\models\QuemSomos();
        $this->dados['quemsomos'] = $listar->listar();

        $carregarView = new \Config\ConfigView("quemSomos/index", $this->dados);
        $carregarView->renderizar();
    }
}
