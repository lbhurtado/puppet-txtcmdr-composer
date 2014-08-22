define composer::install( $path = "/vagrant" ) {

  file { $path:
    ensure  => directory,
  }

  exec { "composer-install":
    command     => "COMPOSER_PROCESS_TIMEOUT=4000 composer --verbose --no-interaction create-project symfony/framework-standard-edition ./",
    cwd         => $path,
    environment => "COMPOSER_HOME=/usr/bin/",
    creates     => "${path}/web",
    timeout     => 0,
    require     => File[ $path ],
  }

}
