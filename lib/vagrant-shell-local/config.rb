module VagrantPlugins::ShellLocal
  class Config < Vagrant.plugin('2', :config)
    attr_accessor :command

    def initialize
      @command = UNSET_VALUE
    end

    def finalize!
      @command = nil if @inline == UNSET_VALUE
    end

    def validate(machine)
      errors = _detected_errors

      unless command.is_a?(Array) || command.is_a?(String)
        errors << ':shell_local provisioner requires command to be set and be an array or a string'
      end

      { 'host shell provisioner' => errors }
    end
  end
end
