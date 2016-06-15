# vagrant-shell-local plugin (inspired by vagrant-host-shell & this thread http://superuser.com/questions/701735/run-script-on-host-machine-during-vagrant-up)

a vagrant provisioner to run commands on the host when a VM boots.

## example usage

Install as a plugin:

```
vagrant plugin install vagrant-host-shell
```

Add this to `Vagrantfile`:

```ruby
  config.vm.provision :shell_local, command: ['bash', '-c', 'touch /tmp/hostshell-works && echo hello from the host && hostname 1>&2']
```

Run `vagrant up` (or `vagrant provision` if machine is already running.)

Observe that `/tmp/hostshell-works` is present on your host, and that the provisioner output:

```
[stdout] hello from the host
[stderr] (your host's hostname)
```

# motivation

I decided to create and publish this plug-in because I didn't see activity on `vagrant-host-shell` about two years. It has accepted pull request for PATH fix which I required, but it wasn't published during 7 month (on this plug-in creation moment)

