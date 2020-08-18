<?php

namespace Site\models\helper;

if (!defined('URL')) {
    header("Location: /");
    exit();
}

class ModelsPaginacao
{

    private $link;
    private $maxLinks;
    private $pagina;
    private $limiteResultado;
    private $offset;
    private $query;
    private $parseString;
    private $resultBd;
    private $result;

    function __construct($link)
    {
        $this->link = $link;
        echo "<br /><br />{$this->link}";
        $this->maxLinks = 2;
    }

    public function condicao($pagina, $limitResultado)
    {
        $this->pagina = (int) $pagina ? $pagina : 1;
        $this->limiteResultado = (int) $limitResultado;
        $this->offset = ($this->pagina * $this->limiteResultado) - $this->limiteResultado;
    }

    public function paginacao($query, $parseString = null)
    {
        $this->query = (string) $query;
        $this->parseString = (string) $parseString;
        $contar = new \Site\models\helper\ModelsRead();
        $contar->exeReadEspecifico($this->query, $this->parseString);
        $this->resultBd = $contar->getResult();
        var_dump($this->resultBd);
        if ($this->resultBd[0]['num_result'] > $this->limiteResultado) {
            $this->instrucaoPaginacao();
        } else {
            $this->result = null;
        }
    }

    private function instrucaoPaginacao()
    {
        $paginas = ceil($this->resultBd[0]['num_result'] / $this->limiteResultado);
        $this->resultado = "<nav aria-label='paginacao'>";
        $this->result .= "<ul class='pagination justify-content-center'>";
        $this->result .= "<li class='page-item'>";
        $this->result .= "<a class='page-link' href=\"{$this->link}\" tabindex='-1'>Primeira</a>";
        $this->result .= "</li>";
        $this->result .= "<li class='page-item'><a class='page-link' href='#'>1</a></li>";
        $this->result .= "<li class='page-item active'>";
        $this->result .= "<a class='page-link' href='#'>2 <span class='sr-only'>(current)</span></a>";
        $this->result .= "</li>";
        $this->result .= "<li class='page-item'><a class='page-link' href='#'>3</a></li>";
        $this->result .= "<li class='page-item'>";
        $this->result .= "<a class='page-link' href='#'>Next</a>";
        $this->result .= "</li>";
        $this->result .= "</ul>";
        $this->result .= "</nav>";
    }

    function getResult()
    {
        return $this->result;
    }
}
