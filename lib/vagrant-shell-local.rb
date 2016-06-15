module VagrantPlugins
  module ShellLocal
  	lib_path = Pathname.new(File.expand_path("../vagrant-shell-local", __FILE__))
  	autoload :Errors, lib_path.join("errors")
  end
end

require 'vagrant-shell-local/plugin'
