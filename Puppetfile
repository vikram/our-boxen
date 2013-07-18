# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "2.3.6"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.4"
github "homebrew",   "1.2.0"
github "hub",        "1.0.0"
github "inifile",    "0.9.0", :repo => "cprice404/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.2.7"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.1.1"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"


# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "emacs", "1.1.0"
github "macvim", "1.0.0"
github "cord", "1.0.0"
github "chrome", "1.1.1"
github "hipchat", "1.0.7"
github "virtualbox", "1.0.4"
github "vagrant", "2.0.8"
github "screen", "1.0.0"
github "redis", "1.0.0"
github "clojure", "1.2.0"
github "appcleaner", "1.0.0"
github "phantomjs", "2.0.2"
github "caffeine", "1.0.0"
github "fluid", "1.0.0"
github "induction", "1.0.0"
github "keyremap4macbook", "1.0.4"
github "vim", "1.0.5"
github "kindle", "1.0.1"
