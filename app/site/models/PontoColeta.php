<?php

namespace Site\models;

if (!defined('URL')) {
    header("location: /");
    exit();
}


class PontoColeta
{

    private $result = false;
    private $tabela = 'ponto_coleta';

    public function addContato(array $dados)
    {
        $this->dados = $dados;
        $this->dados['data_criacao'] = date("Y-m-d H:i:s");
        $this->validarDados();
        if ($this->result) {
            $this->exeAddContato();
        }
    }

    private function validarDados()
    {
        $this->dados = array_map('strip_tags', $this->dados);
        $this->dados = array_map('trim', $this->dados);
        if (in_array('', $this->dados)) {
            $_SESSION['msg'] = "
                        <div class='alert alert-danger' role='alert'>
                          <strong>Erro ao enviar:</strong> Os campos obrigatórios não foram preenchidos!
                        </div>";
        } else {
            if (filter_var($this->dados['email'], FILTER_VALIDATE_EMAIL)) {
                $this->result = true;
            } else {
                $_SESSION['msg'] = "
                        <div class='alert alert-danger' role='alert'>
                          <strong>Erro ao enviar:</strong> O campo e-mail é inválido!
                        </div>";
            }
        }
    }

    private function exeAddContato()
    {
        $inserir = new \Site\models\helper\ModelsCreate();
        $inserir->exeCreate($this->tabela, $this->dados);
        if ($inserir->getResult()) {
            $this->result = true;
            $_SESSION['msg'] = "<div class=\"alert alert-success\" role=\"alert\">
                                    Contato enviado com sucesso!
                                </div>";
        } else {
            $_SESSION['msg'] = "<div class=\"alert alert-danger\" role=\"alert\">
                                    Ponto de coleta não enviado com sucesso! Erro: {$inserir->getMsg()}
                                </div>";
        }
    }

    public function getResult()
    {
        return $this->result;
    }
}
