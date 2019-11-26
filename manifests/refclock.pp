# refclock PHC /dev/ptp0 poll 3 dpoll -2 offset 0
define chronyd::refclock(
                          $driver,
                          $refclock_name = $name,
                          $oder = '01',
                          $poll = undef,
                          $dpoll = undef,
                          $offset = undef,
                          $trust = false,
                          $prefer = false,
                          $require = false,
                        ) {
  concat::fragment{ 'base chrony':
    order   => "10-${order}",
    target  => '/etc/chrony.conf',
    content => template("${module_name}/refclock.erb"),
  }
}