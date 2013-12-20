Facter.add('diskcount') do
  confine :kernel => :OpenBSD

  setcode do
    Facter::Util::Resolution.exec('/sbin/sysctl -n hw.diskcount')
  end
end
