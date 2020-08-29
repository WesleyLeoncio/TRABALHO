<?php

if (!defined('URL')) {
    header("location: /");
    exit();
}
?>

<main role="main">
    <div class="container marketing">
        <hr class="featurette-divider">
        <h2 class="display-4 text-center" style="margin-bottom: 50px;color:green;font-weight: bold;">Ponto de Coleta</h2>
        <hr class="featurette-divider">
        <?php
        if (isset($_SESSION['msg'])) {
            echo $_SESSION['msg'];
            unset($_SESSION['msg']);
        }
        if (!isset($this->dados['formRetorno'])) {
            $empresa = $email = $cidade = $bairro = $rua = $numero = "";
        } else {
            extract($this->dados['formRetorno']);
        }
        ?>
        <form name="forContato" method="post" action="">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="iEmpresa">Empresa</label>
                    <input type="text" name="empresa" class="form-control" id="iEmpresa" value="<?= $empresa; ?>" placeholder="Empresa">
                </div>
                <div class="form-group col-md-6">
                    <label for="iEmail">E-mail</label>
                    <input type="text" name="email" class="form-control" id="iEmail" value="<?= $email; ?>" placeholder="E-mail">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="iCidade">Cidade</label>
                    <input type="text" name="cidade" class="form-control" id="iCidade" value="<?= $cidade; ?>" placeholder="Cidade">
                </div>
                <div class="form-group col-md-6">
                    <label for="iEmail">Bairro</label>
                    <input type="text" name="bairro" class="form-control" id="iBairro" value="<?= $bairro; ?>" placeholder="Bairro">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="iRua">Rua</label>
                    <input type="text" name="rua" class="form-control" id="iRua" value="<?= $rua; ?>" placeholder="Rua">
                </div>
                <div class="form-group col-md-6">
                    <label for="iEmail">Numero</label>
                    <input type="number" name="numero" class="form-control" id="iNumero" value="<?= $numero; ?>" placeholder="Numero">
                </div>
            </div>
            <div class="botao">
                <button type="submit" name="formAddContato" value="Enviar" class="btn btn-outline-success">Cadastrar Ponto</button>
            </div>

        </form>
        <hr class="featurette-divider">
    </div>

    <style>
        .botao {
            margin-top: 28px;
            padding-left: 970px;
        }
    </style>
</main>