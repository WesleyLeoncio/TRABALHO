<?php

if (!defined('URL')){
    header("location: /");
    exit();
}
?>

<main role="main">
    <div class="container marketing">
        <hr class="featurette-divider">
        <h2 class="display-4 text-center" style="margin-bottom: 50px">Contato</h2>
        <hr class="featurette-divider">
        <?php
            if (isset($_SESSION['msg'])){
                echo $_SESSION['msg'];
                unset($_SESSION['msg']);
            }
            if (!isset($this->dados['formRetorno'])){
                $nome = $email = $assunto = $mensagem = "";
            }else {
                extract($this->dados['formRetorno']);
            }
        ?>
        <form name="forContato" method="post" action="">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="iNome">Nome</label>
                    <input type="text" name="nome" class="form-control" id="iNome"
                           value="<?= $nome; ?>" placeholder="Nome" >
                </div>
                <div class="form-group col-md-6">
                    <label for="iEmail">E-mail</label>
                    <input type="text" name="email" class="form-control" id="iEmail"
                           value="<?= $email; ?>" placeholder="E-mail" >
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="iAssunto">Assunto</label>
                    <select id="iAssunto" name="assunto" class="form-control" >
                        <option selected>Dúvidas</option>
                        <option>Sugestão</option>
                        <option>Reclamação</option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="iMensagem">Mensagem</label>
                    <textarea name="mensagem" rows="8" cols="100" class="form-control" id="iMensagem" >
                        <?= $mensagem; ?>
                    </textarea>
                </div>
            </div>
            <button type="submit" name="formAddContato" value="Enviar" class="btn btn-primary">Enviar mensagem</button>
        </form>
        <hr class="featurette-divider">
    </div>
</main>
