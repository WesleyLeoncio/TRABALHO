    <?php
        require "./vendor/autoload.php";
        require "./Config/Config.php";

        use Config\ConfigController as Home;

		# Quando instancia, vai chamar o ConfigController
		# E assim vai rodar o __construct()
        $url = new Home(); 

        $url->carregar();
