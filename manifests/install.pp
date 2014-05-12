define composer::install(
  $path = '/vagrant') {

  exec { "composer-install":
    command => "composer --verbose --no-interaction create-project symfony/framework-standard-edition ./",
    cwd     => $path,
    creates => "${path}/vendor",
    timeout => 0,
    require => Class[ 'composer' ]
  }
}
