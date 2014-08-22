class composer ($path = "/vagrant") {

  exec { "curl -sS https://getcomposer.org/installer | php":
    command => "curl -sSk https://getcomposer.org/installer | php -- --disable-tls --max-time 900",
    cwd     => "/usr/bin",
    creates => "/usr/bin/composer.phar",
  }

  file { "/usr/bin/composer.phar":
    ensure  => link,
    target  => "/usr/bin/composer",
    mode    => "a+x",
    require => Exec [ "curl -sS https://getcomposer.org/installer | php" ],
  }

  composer::install { $path:
    require => File[ "/usr/bin/composer.phar" ],
  }
  
}