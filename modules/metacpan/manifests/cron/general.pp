# This is defined in hiera and run via metacpan/init.pp

define metacpan::cron::general(
  $cmd,
  $minute,
  $user    = "metacpan",
  $hour    = "*",
  $weekday = "*",
  $ensure  = present,
  $perl_version = hiera('perl::version','5.18.2'),
  $path_env = "PATH=/opt/perls-${perl_version}/bin:/usr/local/bin:/usr/bin:/bin",
) {
  cron {
      $name:
          user        => $user,
          environment => $path_env,
          command     => $cmd,
          hour        => $hour,
          minute      => $minute,
          weekday     => $weekday,
          ensure      => $ensure;
  }
}
