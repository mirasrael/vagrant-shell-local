require 'open3'

module VagrantPlugins::ShellLocal
  class Provisioner < Vagrant.plugin('2', :provisioner)
    def provision
      result = Vagrant::Util::Subprocess.execute(
        *config.command,
        :notify => [:stdout, :stderr],        
        :env => {PATH: ENV["VAGRANT_OLD_ENV_PATH"]},
      ) do |io_name, data|
        @machine.env.ui.info "[#{io_name}] #{data}"
      end

      if !result.exit_code.zero?      
        raise VagrantPlugins::ShellLocal::Errors::NonZeroStatusError.new(config.command, result.exit_code)  
      end
    end
  end
end
