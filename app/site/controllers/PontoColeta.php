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
            $addContato = new \Site\Models\PontoColeta();
            $addContato->addContato($this->dados);
            if (!$addContato->getResult()) {
                $this->dados['formRetorno'] = $this->dados;
            } else {
                $this->dados['formRetorno'] = null;
            }
        }
        $carregarView = new \Config\ConfigView("pontoColeta/index", $this->dados);
        $carregarView->renderizar();
    }
}
