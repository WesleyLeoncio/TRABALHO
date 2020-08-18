<?php

namespace App\adm\controllers;

if (!defined('URL')){
    header("location: /");
    exit();
}

class AdmUser {
    private $dados;
    private $id;

    public function index() {
        $botao = ['cad_usuario' => ['menu_controller' => 'AdmUser', 'menu_metodo' => 'addUser'],
            'vis_usuario' => ['menu_controller' => 'AdmUser', 'menu_metodo' => 'moreUser'],
            'edit_usuario' => ['menu_controller' => 'AdmUser', 'menu_metodo' => 'upUser'],
            'del_usuario' => ['menu_controller' => 'AdmUser', 'menu_metodo' => 'delUser']];

        $listarBotao = new \App\adm\models\Botao();
        $this->dados['botao'] = $listarBotao->valBotao($botao);

        $listarUsario = new \App\adm\models\User();
        $this->dados['listUser'] = $listarUsario->listarUsuario();

        $carregarView = new \Config\ConfigView("user/index", $this->dados);
        $carregarView->renderizarAdm();
    }

    public function addUser(){
        $this->dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        if (!empty($this->dados['CadUsuario'])) {
            unset($this->dados['CadUsuario']);
            $this->dados['imagem_nova'] = ($_FILES['imagem_nova'] ? $_FILES['imagem_nova'] : null);
            $cadUsuario = new \App\adm\Models\User();
            $cadUsuario->cadUsuario($this->dados);
            if ($cadUsuario->getResult()) {
                $urlDestino = URL . 'adm-user/index';
                header("Location: $urlDestino");
            } else {
                $this->dados['form'] = $this->dados;
                $this->addUserVerPriv();
            }
        } else {
            $this->addUserVerPriv();
        }
    }

    private function addUserVerPriv()
    {
        $listarSelect = new \App\adm\Models\User();
        $this->dados['select'] = $listarSelect->listarCadastrar();

        $botao = ['list_usuario' => ['menu_controller' => 'adm-user', 'menu_metodo' => 'index']];
        $listarBotao = new \App\adm\Models\Botao();
        $this->dados['botao'] = $listarBotao->valBotao($botao);

        //$listarMenu = new \App\adm\Models\AdmMenu();
        //$this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Config\ConfigView("user/addUser", $this->dados);
        $carregarView->renderizarAdm();
    }

    public function upUser($dadosId = null)
    {
        $this->dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $this->dadosId = (int) $dadosId;
        if (!empty($this->dadosId)) {
            $this->upUserPriv();
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro: Usuário não encontrado!</div>";
            $urlDestino = URL . 'adm-user/index';
            header("Location: $urlDestino");
        }
    }

    private function upUserPriv()
    {
        if (!empty($this->dados['editUsuario'])) {
            unset($this->dados['editUsuario']);
            $this->dados['imagem_nova'] = ($_FILES['imagem_nova'] ? $_FILES['imagem_nova'] : null);
            $editarUsuario = new \App\adm\models\User();
            $editarUsuario->altUsuario($this->dados);
            if ($editarUsuario->getResult()) {
                $_SESSION['msg'] = "<div class='alert alert-success'>Usuário editado com sucesso!</div>";
                $urlDestino = URL . 'adm-user/moreUser/' . $this->dados['id'];
                header("Location: $urlDestino");
            } else {
                $this->dados['form'] = $this->dados;
                $this->upUserViewPriv();
            }
        } else {
            $verUsuario = new \App\adm\models\User();
            $this->dados['form'] = $verUsuario->verUsuario($this->dadosId);
            $this->upUserViewPriv();
        }
    }

    private function upUserViewPriv()
    {
        if ($this->dados['form']) {
            $listarSelect = new \App\adm\models\User();
            $this->dados['select'] = $listarSelect->listarCadastrar();

            $botao = ['vis_usuario' => ['menu_controller' => 'ver-usuario', 'menu_metodo' => 'ver-usuario']];
            $listarBotao = new \App\adm\models\Botao();
            $this->dados['botao'] = $listarBotao->valBotao($botao);

            $carregarView = new \Config\ConfigView("user/upUser", $this->dados);
            $carregarView->renderizarAdm();
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro: Usuário não encontrado!</div>";
            $UrlDestino = URL . 'user/index';
            header("Location: $UrlDestino");
        }
    }

    public function delUser($id = null){
        $this->id = (int) $id;
        if (!empty($this->id)) {
            $apagarUsuario = new \App\adm\Models\User();
            $apagarUsuario->apagarUsuario($this->id);
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro: Necessário selecionar um usuário!</div>";
        }
        $urlDestino = URL . 'adm-user/index';
        header("Location: $urlDestino");
    }


    public function moreUser($id = null)
    {

        $this->id = (int) $id;
        if (!empty($this->id)) {
            $verUsuario = new \App\adm\Models\User();
            $this->dados['dados_usuario'] = $verUsuario->verUsuario($this->id);

            $botao = ['list_usuario' => ['menu_controller' => 'AdmUser', 'menu_metodo' => 'index'],
                'edit_usuario' => ['menu_controller' => 'AdmUser', 'menu_metodo' => 'upUser'],
                'edit_senha' => ['menu_controller' => 'AdmUser', 'menu_metodo' => 'upUserPass'],
                'del_usuario' => ['menu_controller' => 'AdmUser', 'menu_metodo' => 'delUser']];
            $listarBotao = new \App\adm\Models\Botao();
            $this->dados['botao'] = $listarBotao->valBotao($botao);

            //$listarMenu = new \App\adms\Models\AdmsMenu();
            //$this->dados['menu'] = $listarMenu->itemMenu();

            $carregarView = new \Config\ConfigView("user/moreUser", $this->dados);
            $carregarView->renderizarAdm();
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro: Usuário não encontrado!</div>";
            $urlDestino = URL . 'adm-user/index';
            header("Location: $urlDestino");
        }
    }

}
