<?php
namespace App\site\controllers;

 if (!defined('URL')){
     header("location: /");
     exit();
 }

class Contato {
     private $dados;

     public function index() {

        $this->dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

        if (!empty($this->dados['formAddContato'])) {
            unset($this->dados['formAddContato']);
            $addContato = new \Site\Models\Contato();
            $addContato->addContato($this->dados);
            if (!$addContato->getResult()){
                $this->dados['formRetorno'] = $this->dados;
            }else{
                $this->dados['formRetorno'] = null;
            }
        }
        $carregarView = new \Config\ConfigView("contato/index", $this->dados);
        $carregarView->renderizar();
     }
}
