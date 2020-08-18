<?php

namespace App\site\controllers;

 if (!defined('URL')){
     header("location: /");
     exit();
 }

class Home {
     private $dados;

    public function index() {

        $listar = new \Site\models\Carousel();
        $this->dados['carousel'] = $listar->listar();

        $listar_servico = new \Site\models\Servico();
        $this->dados['servicos'] = $listar_servico->listar();

        $listar_video = new \Site\models\Video();
        $this->dados['video'] = $listar_video->listar();

        $listar_noticia = new \Site\models\Noticia();
        $this->dados['noticias'] = $listar_noticia->listarTelaInicial();

        $carregarView = new \Config\ConfigView("home/index", $this->dados);
        $carregarView->renderizar();
    }
}
