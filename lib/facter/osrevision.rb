Facter.add('osrevision') do
  confine :kernel => :OpenBSD

  setcode do
    Facter::Util::Resolution.exec('/sbin/sysctl -n kern.osrevision')
  end
end
