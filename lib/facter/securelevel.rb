Facter.add('securelevel') do
  confine :kernel => :OpenBSD

  setcode do
    Facter::Util::Resolution.exec('/sbin/sysctl -n kern.securelevel')
  end
end
