module VagrantPlugins::ShellLocal::Errors
  
    class VagrantShellLocalError < Vagrant::Errors::VagrantError; end
    
    class NonZeroStatusError < VagrantShellLocalError
      def initialize(command, exit_code)
        @command = command
        @exit_code = exit_code
        super nil
      end

      def error_message 
        "Command [#{@command}] exited with non-zero status [#{@exit_code}]"
      end
    end
end
