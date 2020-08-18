<?php

namespace App\adm\Models;

if (!defined('URL')) {
    header("Location: /");
    exit();
}

class Botao
{
    private $result;
    private $botao;
    private $botaoValido = [];
   
    function getResult()
    {
        return $this->result;
    }

            
    public function valBotao(array $botao)
    {
        $this->botao = $botao;
        foreach ($this->botao as $key => $botao_unico) {
            extract($botao_unico);
            $verBotao = new \App\adm\models\helper\ModelsRead();
            $verBotao->exeReadEspecifico("SELECT pg.id id_pg
                    FROM pagina pg
                    LEFT JOIN adm_niveis_acesso_pagina nivpg ON nivpg.adm_pagina_id=pg.id
                    WHERE pg.controller =:menu_controller
                    AND pg.metodo =:menu_metodo
                    AND pg.situacoes_id = 1
                    AND nivpg.adm_niveis_acesso_id =:adm_niveis_acesso_id
                    AND nivpg.permissao= 1 LIMIT :limit", "menu_controller={$menu_controller}&menu_metodo={$menu_metodo}&adm_niveis_acesso_id=".$_SESSION['adm_niveis_acesso_id']."&limit=1");
            if($verBotao->getResult()){
                $this->botaoValido[$key] = true;
            }else{
                $this->botaoValido[$key] = false;
            }
        }    
        return $this->botaoValido;
    }
}
