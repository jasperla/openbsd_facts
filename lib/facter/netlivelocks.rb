Facter.add('netlivelocks') do
  confine :kernel => :OpenBSD

  setcode do
    Facter::Util::Resolution.exec('/sbin/sysctl -n kern.netlivelocks')
  end
end
