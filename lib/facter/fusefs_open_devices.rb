Facter.add('fusefs_open_devices') do
  confine :kernel => :OpenBSD

  setcode do
    Facter::Util::Resolution.exec('/sbin/sysctl -n vfs.fuse.fusefs_open_devices')
  end
end
