<?php
if (!defined('URL')){
    header("location: /");
    exit();
} ?>
<main role="main">
    <?php
    $umaNoticia = $this->dados['noticias'][0];
    extract($umaNoticia);
    ?>
    <div class="container marketing">
        <hr class="featurette-divider">
        <h2 class="display-4 text-center" style="margin-bottom: 50px"><?= $titulo; ?></h2>
        <hr class="featurette-divider">
        <div class="row">
            <div class="col-md-8 blog-main">
                <div class="col-md-12 anima_left">
                    <div class="card flex-md-row mb-4 shadow-sm h-md-250">
                        <div class="card-body d-flex flex-column align-items-start">
                            <strong class="d-inline-block mb-2 text-primary"><?= $nome; ?></strong>
                            <h3 class="mb-0">
                                <a class="text-dark" href="<?= URL .'/noticia/' .$slug; ?>"><?= $titulo; ?></a>
                            </h3>
                            <div class="mb-1 text-muted"><?= DATE('F d, Y',strtotime($data_criacao)); ?> by <?= $author; ?></div>
                                <img class="rounded" src="<?= URL . '/assets/img/noticia/' .$id . '/' . $imagem; ?>"
                                     alt="<?= $titulo ?>" title="<?= $titulo; ?>" width="300" height="200">
                            <p class="card-text mb-auto"><?= $descricao; ?></p>
                            <p class="card-text mb-auto"><?= $conteudo; ?></p>
                        </div>
                    </div>
                </div>
            </div><!-- /.blog-main -->

            <aside class="col-md-4 blog-sidebar">
                <div class="p-3">
                    <h4 class="font-italic">Recentes</h4>
                    <ol class="list-unstyled mb-0">
                        <?php
                        foreach ($this->dados['notRecentes'] as $recente){
                            extract($recente);
                            ?>
                            <li><a href="<?= URL .'noticia/visualizar/' .$slug; ?>"><?= $titulo; ?></a></li>
                            <?php
                        }
                        ?>
                    </ol>
                </div>

                <div class="p-3">
                    <h4 class="font-italic">Parceiros</h4>
                    <ol class="list-unstyled">
                        <li><a href="#">Globo.com</a></li>
                        <li><a href="#">Terra.com.br</a></li>
                        <li><a href="#">Facebook</a></li>
                    </ol>
                </div>
            </aside><!-- /.blog-sidebar -->
        </div><!-- /.row -->
        <hr class="featurette-divider">
</main><!-- /.container -->
