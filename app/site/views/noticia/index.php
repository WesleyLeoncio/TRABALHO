<?php
if (!defined('URL')){
    header("location: /");
    exit();
} ?>
<main role="main">
    <div class="container marketing">
        <hr class="featurette-divider">
        <h2 class="display-4 text-center" style="margin-bottom: 50px">Notícias</h2>
        <hr class="featurette-divider">

        <div class="row">
            <div class="col-md-8 blog-main">
                <?php
                foreach ($this->dados['noticias'] as $umaNoticia){
                    extract($umaNoticia);
                    ?>
                <div class="col-md-12 anima_left">
                    <div class="card flex-md-row mb-4 shadow-sm h-md-250">
                        <div class="card-body d-flex flex-column align-items-start">
                            <strong class="d-inline-block mb-2 text-primary"><?= $nome; ?></strong>
                            <h3 class="mb-0">
                                <a class="text-dark" href="<?= URL .'noticia/visualizar/' .$slug; ?>"><?= $titulo; ?></a>
                            </h3>
                            <div class="mb-1 text-muted"><?= DATE('F d, Y',strtotime($data_criacao)); ?> by <?= $author; ?></div>
                            <p class="card-text mb-auto"><?= $descricao; ?></p>
                            <a href="<?= URL .'noticia/visualizar/' .$slug; ?>">Leia mais</a>
                        </div>
                    </div>
                </div>
                <?php
                }
                ?>
                <nav aria-label="Paginacao Noticias">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item active">
                            <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>

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
