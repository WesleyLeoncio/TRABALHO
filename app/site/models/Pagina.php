<?php
namespace App\site\models;

if (!defined('URL')) {
    header("Location: /");
    exit();
}

class Pagina{
    private $result;
    private $urlController;
    private $urlMetodo;

    public function listarPaginas($urlController = null, $urlMetodo = null){
        $this->urlController = (string) $urlController;
        $this->urlMetodo = (string) $urlMetodo;
        $listar = new \Site\models\helper\ModelsRead();
        $listar->exeReadEspecifico('SELECT pag.id,
                tpg.tipo tipo_tpg
                FROM pagina pag
                INNER JOIN tipo_pagina tpg ON tpg.id=pag.tp_pagina_id
                LEFT JOIN adm_niveis_acesso_pagina nivapag ON nivapag.adm_pagina_id = pag.id 
                AND nivapag.adm_niveis_acesso_id = :adm_niveis_acesso_id
                WHERE pag.situacoes_id =:situacoes_id
                AND (pag.controller =:controller AND pag.metodo =:metodo)
                AND ((pag.liberada_publico = :liberada_publico) OR (nivapag.permissao = :permissao))
                LIMIT :limit',
            "situacoes_id=1&controller={$this->urlController}&metodo={$this->urlMetodo}&liberada_publico=1"
            ."&adm_niveis_acesso_id=1&permissao=1&limit=1");

        $this->result = $listar->getResult();
        return $this->result;
    }
}

