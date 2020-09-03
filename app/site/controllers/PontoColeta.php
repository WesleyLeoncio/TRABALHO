<?php

namespace App\site\controllers;

if (!defined('URL')) {
    header("location: /");
    exit();
}

class PontoColeta
{
    private $dados;

    public function index()
    {

        $this->dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

        if (!empty($this->dados['formAddPonto'])) {
            unset($this->dados['formAddPonto']);
            $addColeta = new \Site\Models\PontoColeta();
            $addColeta->addColeta($this->dados);
            if (!$addColeta->getResult()) {
                $this->dados['formRetorno'] = $this->dados;
            } else {
                $this->dados['formRetorno'] = null;
            }
        }
        $carregarView = new \Config\ConfigView("pontoColeta/index", $this->dados);
        $carregarView->renderizar();
    }
}
