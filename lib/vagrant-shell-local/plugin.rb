begin
  require 'vagrant'
rescue LoadError
  raise 'The vagrant-shell-local plugin must be run within Vagrant.'
end

module VagrantPlugins::ShellLocal
  class Plugin < Vagrant.plugin('2')
    name 'vagrant-shell-local'
    description <<-DESC.gsub(/^ +/, '')
      A simple provisioner to run commands on the host at machine
      boot, instead of the guest.
    DESC

    config(:shell_local, :provisioner) do
      require_relative 'config'
      Config
    end

    provisioner(:shell_local) do
      require_relative 'provisioner'
      Provisioner
    end
  end
end
