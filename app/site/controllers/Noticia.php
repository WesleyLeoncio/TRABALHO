<?php

namespace App\site\controllers;

if (!defined('URL')){
    header("location: /");
    exit();
}

class Noticia {

    private $dados;
    private $noticia;

    public function index(){
        $listar = new \Site\models\Noticia();
        $this->dados['noticias'] = $listar->listar();
        $this->dados['notRecentes'] = $listar->noticiasRecentes();

        $carregarView = new \Config\ConfigView("noticia/index", $this->dados);
        $carregarView->renderizar();
    }

    public function visualizar($noticia = null){

        $this->noticia = (string) $noticia;
        $visualizarNot = new \Site\models\Noticia();
        $this->dados['noticias'] = $visualizarNot->visualizarNoticia($this->noticia);

        $visualizarNot = new \Site\models\Noticia();
        $this->dados['notRecentes'] = $visualizarNot->noticiasRecentes();

        $carregarView = new \Config\ConfigView("noticia/visualizar", $this->dados);
        $carregarView->renderizar();
    }
}
