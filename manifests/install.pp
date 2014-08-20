define composer::install( $path = "/vagrant" ) {

  file { $path:
    ensure  => directory,
  }

  exec { "composer-install":
    command     => "composer --verbose --no-interaction create-project symfony/framework-standard-edition ./",
    cwd         => $path,
    environment => "COMPOSER_HOME=/usr/bin/",
    creates     => "${path}/web",
    timeout     => 0,
    require     => File[ $path ],
  }

}
