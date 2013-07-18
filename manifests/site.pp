require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $luser,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::luser}"
  ]
}

File {
  group => 'staff',
  owner => $luser
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  include nodejs::v0_4
  include nodejs::v0_6
  include nodejs::v0_8
  include nodejs::v0_10

  # default ruby versions
  include ruby::1_8_7
  include ruby::1_9_2
  include ruby::1_9_3
  include ruby::2_0_0

  include xquartz
  include emacs
  include macvim
  include cord
  include chrome
  include chrome::canary
  include hipchat
  include caffeine
  include appcleaner
  include clojure
  include fluid
  include induction

include keyremap4macbook

# launch and add login-item
include keyremap4macbook::login_item

# enable remapping left control to left control + escape
keyremap4macbook::remap{ 'controlL2controlL_escape': }

# set the parameter.keyoverlaidmodifier_timeout to 300
keyremap4macbook::set{ 'parameter.keyoverlaidmodifier_timeout':
  value => '300'
}

# set the contents of the private.xml file.
keyremap4macbook::private_xml{ 'private.xml':
  content => '<some>xml</some>'
}

include kindle
include screen
include redis
include phantomjs
include vagrant
include virtualbox

include vim
vim::bundle { [
  'scrooloose/syntastic',
  'sjl/gundo.vim'
]: }

# Example of how you can manage your .vimrc
file { "${vim::vimrc}":
  target  => "/Users/${::boxen_user}/.dotfiles/.vimrc",
  require => Repository["/Users/${::boxen_user}/.dotfiles"]
}

# Or, simply,
file { "${vim::vimrc}": ensure => exists }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
